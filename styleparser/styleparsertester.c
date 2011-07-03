
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "styleparser.h"

#define READ_BUFFER_LEN 1024
char *get_contents(FILE *f)
{
    char buffer[READ_BUFFER_LEN];
    size_t content_len = 1;
    char *content = malloc(sizeof(char) * READ_BUFFER_LEN);
    content[0] = '\0';
    
    while (fgets(buffer, READ_BUFFER_LEN, f))
    {
        content_len += strlen(buffer);
        content = realloc(content, content_len);
        strcat(content, buffer);
    }
    
    return content;
}

int main(int argc, char *argv[])
{
    char *input = get_contents(stdin);
    (void)parse_styles(input);
    return 0;
}