#include <sys/types.h>          /* See NOTES */
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/ip.h> /* superset of previous */

int main()
{
	socket(AF_INET, SOCK_STREAM, IPPROTO_IP);
	return 0;
}

