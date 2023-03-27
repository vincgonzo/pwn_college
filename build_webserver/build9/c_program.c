#include <stdio.h>          /* See NOTES */
#include <sys/types.h>          /* See NOTES */
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/ip.h> /* superset of previous */

int main()
{
    int socket_desc;
    struct sockaddr_in server, client;
     char client_message[1024];

    // Create socket
    socket_desc = socket(AF_INET, SOCK_STREAM, 0);
    if (socket_desc == -1) {
        printf("Could not create socket");
        return 1;
    }

    // Prepare the sockaddr_in structure
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = INADDR_ANY;
    server.sin_port = htons(8080);

    // Bind
    if (bind(socket_desc, (struct sockaddr *)&server, sizeof(server)) < 0) {
        puts("bind failed");
        return 1;
    }
    puts("bind done");

    if (listen(socket_desc, 3) < 0) {
            puts("listen failed");
            return 1;
    }
    puts("Waiting for incoming connections...");

    // Accept incoming connection
    int client_sock, c;
    c = sizeof(struct sockaddr_in);
    while ((client_sock = accept(socket_desc, (struct sockaddr *)&client, (socklen_t*)&c))) {
	puts("Connection accepted");

        // Fork
        pid_t pid = fork();
        if (pid == -1) {
            perror("fork");
            return 1;
        } else if (pid == 0) {
            // Child process

            // Open file
            FILE *fp = fopen("_file.txt", "r");
            if (fp == NULL) {
                perror("fopen");
                exit(1);
            }

            // Read file
            char buffer[1024];
            fgets(buffer, sizeof(buffer), fp);
            printf("File contents: %s", buffer);

            // Close file
            fclose(fp);

            // Write response
            char *response = "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nContent-Length: 12\r\n\r\nHello World!";
            write(client_sock, response, strlen(response));

            // Close socket
            close(client_sock);

            // Exit child process
            exit(0);
        } else {
            // Parent process
            // Close client socket
            close(client_sock);
            // Wait for child process to complete
            wait(NULL);
        }
    }

    return 0;
}
