#include <stdio.h>
#include <string.h>  // for strerror()
#include <errno.h>   // for errno

int main() {
    FILE *file = fopen("nonexistent.txt", "r");
    printf("First printf into out.txt\n");
    if (file == NULL) {
        // Using perror
        perror("perror says");

        // Using strerror
        printf("strerror says: %s\n", strerror(errno));
    } else {
        char buffer[1024];  // Buffer to hold file contents
        size_t bytesRead;

        // Read and print contents
        while ((bytesRead = fread(buffer, 1, sizeof(buffer) - 1, file)) > 0) {
            buffer[bytesRead] = '\0';  // Null-terminate the buffer
            printf("%s", buffer);
            printf(" ");
        }

        printf("\n");
        fclose(file);
    }

    return 0;
}