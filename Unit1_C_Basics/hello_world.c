//Analee Maharaj

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define NUMBER 5

int main(int argc, char* argv[]){
    printf("Hello World!\n");
    printf("%d) option %s", 1,"ONE");

    //statically typed
    int number= 32;
    char phrase[20]="Hello World!";

    for (int x = 0; x < NUMBER ; x++){
        //do something
    }

    //make pointer
    int whole_number =42;
    int* whole_number_pointer= &whole_number;

    //setting 
    *whole_number_pointer =21;

    printf("\n\n%d",whole_number);
    printf("\n%d",*whole_number_pointer);
    printf("\n%p",whole_number_pointer);

    printf("\n\nbytes in int: %ld", sizeof(int));

    whole_number_pointer +=1;
    printf("\n\n%p",whole_number_pointer);


    double* malloced_double =
        (double*) malloc(sizeof(double));

    double* malloced_int =
        (double*) malloc(sizeof(double));
    *malloced_double =102.45;
    printf("\n\n%lf", *malloced_double);

    free(malloced_double);

    int num;
    printf("prompt! ");
    scanf("%d", &num);
    

    return 0; //no errors
}
