#include <stdio.h>

// extern long add_numbers(long a, long b); // declare external assembly function
extern long sum8(long a, long b, long c, long d, long e, long f, long g,
                 long h, long i);
// extern long sum3(long a, long b, long c, long d);
// extern long sum2();

int main()
{
    long a = 5;
    long b = 7;
    // long result = add_numbers(a, b); // call the assembly function
    long result = sum8(1, 2, 3, 4, 5, 6, 7, 8, 9);
    //  9 * 10 / 2 = 45
    // n * (n+1)/ 2 = 8 * 9 / 2 = 36
    // long result = sum3(1, 2, 3, 4);
    // long result = sum2();

    printf("Result: %ld\n", result);
    return 0;
}