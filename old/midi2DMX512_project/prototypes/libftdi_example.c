// http://libftdi.developer.intra2net.narkive.com/M8rRcwG6/reading-dmx


#include <stdio.h>
#include <stdlib.h>
#include <ftdi.h>
#include <unistd.h>
#include <string.h>

int main()
{
    int ret;
    struct ftdi_context *ftdi;

    if ((ftdi = ftdi_new()) == 0)
   {
        fprintf(stderr, "ftdi_new failed\n");
        return EXIT_FAILURE;
    }

    if ((ret = ftdi_usb_open(ftdi, 0x0403, 0x6001)) < 0)
    {
        fprintf(stderr, "unable to open ftdi device: %d (%s)\n", ret, ftdi_get_error_string(ftdi));
        // ftdi_free(ftdi);
        return EXIT_FAILURE;
    }

    if ((ret = ftdi_usb_reset(ftdi)) < 0)
    {
        fprintf(stderr, "unable to reset ftdi device: %d (%s)\n", ret, ftdi_get_error_string(ftdi));
        // ftdi_free(ftdi);
        return EXIT_FAILURE;
    }

    if ((ret = ftdi_setflowctrl(ftdi, SIO_DISABLE_FLOW_CTRL)) < 0)
    {
        fprintf(stderr, "unable to disable flow control: %d (%s)\n", ret, ftdi_get_error_string(ftdi));
        return EXIT_FAILURE;
    }


    // Setup device
    if (((ret = ftdi_set_baudrate(ftdi, 250000)) < 0) ||
      ((ret = ftdi_set_line_property(ftdi, BITS_8, STOP_BIT_2, NONE)) < 0) ||
      ((ret = ftdi_usb_purge_buffers(ftdi)) < 0)) {
    fprintf(stderr, "Can't setup device: %d (%s)", ret, ftdi_get_error_string(ftdi));
    // ftdi_free(ftdi);
    return EXIT_FAILURE;
    }


    if ((ret = ftdi_setrts(ftdi,  SIO_SET_RTS_HIGH)) < 0)
    {
        fprintf(stderr, "unable to clear rts control: %d (%s)\n", ret, ftdi_get_error_string(ftdi));
        return EXIT_FAILURE;
    }


// Transmit DMX packet
    unsigned char StartCode[1];
    unsigned char buffer[512];

    for(int i = 0; i < sizeof(buffer); i++) {
        buffer[i] = 0;
    }

    // StartCode[0] = 0x00;
    // buffer[0] = 0x00;
    // buffer[1] = 0x00;
    // buffer[2] = 0x00;
    // buffer[3] = 0x00;




    int sendDMXBreak() {
        int ret;
        if ((ret = ftdi_set_line_property2(ftdi, BITS_8, STOP_BIT_2, NONE, BREAK_ON)) < 0)
        {
            fprintf(stderr, "unable to set BREAK ON: %d (%s)\n", ret, ftdi_get_error_string(ftdi));
            return EXIT_FAILURE;
        }
        usleep(88); // Break 88 uS or more
        if ((ret = ftdi_set_line_property2(ftdi, BITS_8, STOP_BIT_2, NONE, BREAK_OFF)) < 0)
        {
            fprintf(stderr, "unable to set BREAK OFF: %d (%s)\n", ret, ftdi_get_error_string(ftdi));
            return EXIT_FAILURE;
        }
        usleep(8); // Mark After Break 8 uS or more
        return EXIT_SUCCESS;
        }



    ftdi_write_data_set_chunksize(ftdi, 1); // или ftdi_usb_purge_buffers(ftdi);



int setDMXChannelValue(int channel, int value) {
        // ftdi_set_line_property(ftdi, BITS_8, STOP_BIT_2, NONE);
        //  ftdi_write_data(ftdi, StartCode, 1);
    sendDMXBreak();
    buffer[channel]=value;
    ftdi_write_data(ftdi, buffer, 5);
}

    // for(int i=0; i<255; i++ ) {
    //     setDMXChannelValue(1, i);
    // }

FILE *file;

while (1) {
    file = fopen("test.pipe", "r");
    char file_buffer[1024]; // каждый раз создаётся новый буфер после закрытия файла другой стороной
    int index = 0;
    char ch;
    if (file) {
        while ((ch = getc(file)) != EOF) {
            file_buffer[index++] = ch;
            // printf("%c\n", ch);
            }
        // printf("%s\n", file_buffer);
    }
         char * channel;
         char * value;

        channel = strtok(file_buffer, ","); // строк возвращает указатель на первый символ
        value = strtok(NULL, ",");
        // printf("%s\n", channel);
        // printf("%s\n", value);

        int chan = atoi(channel);
        int val = atoi(value);

        printf("%d\n", chan);
        printf("%d\n", val);


        setDMXChannelValue(chan, val);

        memset(&file_buffer[0], 0, sizeof(file_buffer));
        fclose(file);

    // setDMXChannelValue();
}

    // setDMXChannelValue(1, 255);





    for(int i=0; i<sizeof(buffer); i++ ) {
        printf("%d ", buffer[i]);
    }
    printf("%d\n", sizeof(buffer));





    // if (obj->sleep.tv_nsec > 0) nanosleep(&(obj->sleep), NULL);


    if ((ret = ftdi_usb_close(ftdi)) < 0)
    {
        fprintf(stderr, "unable to close ftdi device: %d (%s)\n", ret, ftdi_get_error_string(ftdi));
        // ftdi_free(ftdi);
        return EXIT_FAILURE;
    }

    ftdi_free(ftdi);
ftdi_deinit(ftdi);
    return EXIT_SUCCESS;



    }
