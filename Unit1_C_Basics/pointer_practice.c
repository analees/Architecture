#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

void memDump(const char *str) {
    // Dynamically allocate memory for a copy of the string
    char *stringmemory = (char *)malloc(strlen(str) + 1);

    // Copy the original string to the dynamically allocated memory
    strcpy(stringmemory, str);

    // Print the memory dump
    // Prints the headings address, decimal, and character
    printf("Address\tDecimal\tCharacter\n");

    // Indicates end of string
    while (*stringmemory != '\0') {
        // Prints the memory address, the decimal value, and character value of the char string memory
        printf("%p\t%d\t%c\n", (void *)stringmemory, (int)(*stringmemory), *stringmemory);
        stringmemory++;
    }

}

bool isPalindrome(const char *word) {
    // Initialize and check the length of the string
    int lengthofWord = strlen(word);
    if (lengthofWord <= 0) {
        return false;
    }

    const char *start = word;
    const char *end = word + lengthofWord - 1;

    // Make sure the pointers meet at the middle
    while (start <= end) {
        if (*start != *end) {
            return false;
        }
        // Move forward through the string
        start++;
        // Move backward through the string
        end--;
    }

    return true;
}

void printFromIndex(const char *str) {
    // get the length of string
    int lengthofString = strlen(str);
    int startingindex;
    printf("Enter the number you want the index to start: ");
    scanf("%d", &startingindex);

    if (startingindex < 0 || startingindex >= lengthofString) {
        printf("oops, that isn't a valid starting index, try again later");
    } else {
        printf("So, %s starting at index %d is %s", str, startingindex, str + startingindex);
    }
}

 int reverse(char *str) {

    int len = strlen(str);
    for (int i = 0, j = len - 1; i <= j; i++, j--) {
        char c = str[i];
        str[i] = str[j];
        str[j] = c;
    }
    printf("Reversed String: %s", str);
    return 0;
}

 
int getHash(const char *str) {
    int sum = 0;
    int count = 0;

    // Iterate through the string until reach the end
    while (*str != '\0') {
        // Accumulate the ASCII values
        sum += (int)(*str);
        // counts how many characters in the string
        count++;
        // Move to the next character
        str++;
    }

    // cannot divide by 0
    if (count == 0) {
        return 0;
    }

    // Calculate the hash value by dividing the sum by the number of characters
    int hashValue = sum / count;

    return hashValue;
}

int main() {
    char entry[16];
    int choice;

    printf("Enter a word 15 characters or less in all lowercase: ");
    scanf("%15s", entry);

    printf("The word you entered was: %s\n", entry);

    // Ask the user to pick from 4 options
    printf("Choose an option 1-5:\n");
    printf("1) memDump\n");
    printf("2) getHash\n");
    printf("3) isPalindrome\n");
    printf("4) printFromIndex\n");
    printf("5) reverse\n");
    printf("What is your choice number?: ");
    // store the option at the memory location of the choice variable
    scanf("%d", &choice);

    // Display the user's choice
    printf("You selected Option number %d\n", choice);

    // switch statement to look at the option selected and call the respective method
    switch (choice) {
        case 1:
            memDump(entry);
            break;
        case 2:
            printf("Hash value: %d\n", getHash(entry));
            break;
        case 3:
            if (isPalindrome(entry)) {
                printf("Nice %s is a palindrome.\n", entry);
            } 
            
            else 
            {
                printf("Sadly %s is not a palindrome.\n", entry);
            }
            break;
        case 4:
            printFromIndex(entry);
            break;
        case 5:
            reverse(entry);
            break;
        default:
            printf("Invalid choice.\n");
            break;
    }
}