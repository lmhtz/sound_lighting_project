// http://libftdi.developer.intra2net.narkive.com/M8rRcwG6/reading-dmx
// compile with libs and optimize "gcc libftdi_example.c -O3 -lftdi"
// memset habr https://habrahabr.ru/post/272269/
//get libraries on RPi "sudo apt-get install libftdi-dev"
// compile on RPi "gcc -std=c99 libftdi_example.c -O3 -lftdi"


#include <stdio.h>
#include <stdlib.h>
#include <ftdi.h>
#include <unistd.h>
#include <string.h>
// #include <malloc.h>


int main(int argc, char* argv[]) {

    char* fifo_data = argv[1];
    char* fifo_status = argv[2];

    int return_val;
    struct ftdi_context* ftdi;

    if (argv[1] == NULL || argv[2] == NULL)
    printf("%s\n", "Please specify fifo pipe and fifo status file names as parameters");


    int ftdi_init() {
        if (
            ( (ftdi = ftdi_new() ) == 0) ||
            ( (return_val = ftdi_usb_open(ftdi, 0x0403, 0x6001)) < 0 ) ||
            ( (return_val = ftdi_usb_reset(ftdi) ) < 0) ||
            ( (return_val = ftdi_setflowctrl(ftdi, SIO_DISABLE_FLOW_CTRL)) < 0 ) ||
            ( (return_val = ftdi_set_baudrate(ftdi, 250000) ) < 0) ||
            ( (return_val = ftdi_set_line_property(ftdi, BITS_8, STOP_BIT_2, NONE) ) < 0) // ||
            // ( (return_val = ftdi_usb_purge_buffers(ftdi)) < 0 ) ||
            // ( (return_val = ftdi_setrts(ftdi,  SIO_SET_RTS_HIGH)) ) < 0
            ) {
                fprintf(stderr, "Can't setup device: %d (%s)", return_val, ftdi_get_error_string(ftdi));
                ftdi_free(ftdi);  // Deinitialize and free an ftdi_context.
                return EXIT_FAILURE;
        }
        else {
            ftdi_write_data_set_chunksize(ftdi, 1);  // set buffer size = 1
        }
    }

    int ftdi_close() {
    if ( (return_val = ftdi_usb_close(ftdi)) < 0 ) {
        fprintf(stderr, "unable to close ftdi device: %d (%s)\n", return_val, ftdi_get_error_string(ftdi));
        ftdi_free(ftdi);
        return EXIT_FAILURE;
    }
    ftdi_free(ftdi);
    }

    int sendDMXBreak() {
        if ( (return_val = ftdi_set_line_property2(ftdi, BITS_8, STOP_BIT_2, NONE, BREAK_ON)) < 0 ) {
            fprintf(stderr, "unable to set BREAK ON: %d (%s)\n", return_val, ftdi_get_error_string(ftdi));
            return EXIT_FAILURE;
        }
        usleep(88); // Break 88 uS or more
        if ( (return_val = ftdi_set_line_property2(ftdi, BITS_8, STOP_BIT_2, NONE, BREAK_OFF)) < 0 ) {
            fprintf(stderr, "unable to set BREAK OFF: %d (%s)\n", return_val, ftdi_get_error_string(ftdi));
            return EXIT_FAILURE;
        }
        usleep(8); // Mark After Break 8 uS or more
        return EXIT_SUCCESS;
    }


    void read_pipe(FILE* fifo_dmx_pipe, unsigned char* file_buf) {

        // memset(&file_buf[0], *"\0", (2048 * sizeof(unsigned char)) ); //  clean array before read
        int index = 0;
        char ch;

        if (fifo_dmx_pipe) {
            while (!feof(fifo_dmx_pipe)) {
                ch = getc(fifo_dmx_pipe);
                file_buf[index++] = ch;
                // printf("%c\n", ch);
                }
                printf("%s %d\n", "bytes read: ", index);
            }

    } //  END-OF read_pipe func


    unsigned char* prepare_frame(unsigned char* file_buf, int* dmx_frame_size_ptr) {

        int prepare_buf[512] = {0};

        //read from file
        char* elem = strtok(file_buf, ",");
        prepare_buf[0] = atoi(elem);
        unsigned short elem_quantity = 1; //  first element already in array

        //convert received data to array elements
        while (elem = strtok(NULL, ",")) {
            prepare_buf[elem_quantity] = atoi(elem);
            elem_quantity++;
        }
        printf("%s %d\n", "elem_quantity: ", elem_quantity);

        //find max channel
        int max_channel = 0;
        unsigned short chan_index = 0;
        while (chan_index < elem_quantity) {
            if (prepare_buf[chan_index] > max_channel)
                max_channel = prepare_buf[chan_index];
            chan_index += 2;
        }
        printf("%s %d\n", "max channel: ", max_channel);

        //fill dmx_buf with channel values
        //calloc initalizes memory with zeros and returns pointer to void*
        unsigned char* dmx_buf = calloc(max_channel+1, sizeof(unsigned char));
        unsigned char current_value;
        unsigned short current_channel;
        for(unsigned short i = 0; i <= elem_quantity; ) {
            current_channel = prepare_buf[i];
            current_value = prepare_buf[i+1];
            dmx_buf[current_channel] = current_value;
            i+=2;
        }

        //print dmx_buf for test
        for(unsigned short i = 0; i <= max_channel; i++) {
            printf("%s %d %s %d\n","channel:", i, "value:", dmx_buf[i]);
        }

        max_channel += 3; // add some empty channels to end - no luck without, WHY??? test with osci?

        //we need copy because max_channel is local var
        int* max_channel_ptr = &max_channel;
        memcpy(dmx_frame_size_ptr, max_channel_ptr, sizeof(int));
        printf("%s %d\n", "max_channel_ptr", * max_channel_ptr);
        printf("%s %d\n", "dmx_frame_size_ptr", * dmx_frame_size_ptr);

        return dmx_buf;
    }


    void send_frame(unsigned char* dmx_buf, int* dmx_frame_size_ptr) {
        sendDMXBreak();
        ftdi_set_line_property(ftdi, BITS_8, STOP_BIT_2, NONE);
        int x = ftdi_write_data(ftdi, dmx_buf, * dmx_frame_size_ptr);
        //ftdi_usb_purge_buffers(ftdi);
        printf("%s %d\n%s\n","bytes send: ", x, "----------------");
    }


    ftdi_init();

    //init pointer for current dmx frame size in bytes
    int frame_size = 0;
    int* dmx_frame_size_ptr = &frame_size;

    // сделать проверку чтобы не падало по закрытии пайпа с другой стороны
    while (1) {  //while flat not exit

        FILE* fifo_dmx_pipe = fopen(fifo_data, "r");
        FILE* fifo_status_pipe = fopen(fifo_status, "w");

        //every time create new array for received dmx512 values
        //RGB (512x3) + 512 commas = 2048
        unsigned char file_buf[2048] = {0};

        read_pipe(fifo_dmx_pipe, file_buf);
        unsigned char* dmx_buf = prepare_frame(file_buf, dmx_frame_size_ptr);
        // printf("%s %d\n", "FRAME SIZE: ", *dmx_frame_size_ptr);
        send_frame(dmx_buf, dmx_frame_size_ptr);

        free(dmx_buf);
        dmx_buf = NULL;
        fclose(fifo_dmx_pipe);
        fprintf(fifo_status_pipe, "succeed");
        fclose(fifo_status_pipe);

    } //end of while


    ftdi_close();



}  // end of main
