#ifndef TERMINAL_H
#define TERMINAL_H

enum TERMINAL_ERROR 
{
    TERMINAL_INIT_FAIL = 0,
    TERMINAL_INIT_SUCCESS = 1,
};

int terminal_init(void);
static void terminal_putchar(char c);
void terminal_write(const char* str);
void terminal_prompt(void);
void terminal_newline(void);

#endif // TERMINAL_H