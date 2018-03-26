#include <stdio.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <errno.h>
#include <string.h>

#define CMD_NOP 0
//no operation
#define CMD_EXIT 1

int main() {
        char *buff = NULL;
        char byte = 0;
        int count = 0;
        int needExit = 0;
        int file_descriptor;
        char * fifo_dmx512 = "fifo_dmx512.pipe";

        mkfifo(fifo_dmx512, 0666);  // create named pipe in filesystem
        file_descriptor = open(fifo_dmx512, O_RDONLY);

        // read at least one byte from the pipe.
        while (read(file_descriptor, &byte, 1) == 1) {
            /*
                switch (byte)
                {
                    case CMD_NOP:
                        break;
                    case CMD_EXIT:
                        needExit = 1;
                        break;


                }
                if (needExit) break;
            */
            if (ioctl(file_descriptor, FIONREAD, &count) != -1) {
                fprintf(stdout,"Child: count = %d\n",count);

               //allocate buff memory
                buff = malloc(count+1);

                buff[0] = 0; //first DMX byte always 0

                if (read(file_descriptor, buff+1, count) == count) {
                    //send DMX packet here buff contains all packet
                    //fprintf(stdout,"Child: received \"%s\"\n", buff);
                }
                free(buff);

            }
            else {
                // could not read in-size
                perror("Failed to read input size.");
            }

            close(file_descriptor);
            file_descriptor = open(fifo_dmx512, O_RDONLY);
        }

        // close our side
        close(file_descriptor);
        fprintf(stdout,"Child: Shutting down.\n");

    return 0;
}
