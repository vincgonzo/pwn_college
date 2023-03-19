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
        read(client_sock, client_message, 1024);
        printf("%s\n", client_message);

        // Write the response
        char *response = "HTTP/1.0 200 OK\r\n\r\n";
        write(client_sock, response, strlen(response));
        close(client_sock);
    }

    return 0;
}
