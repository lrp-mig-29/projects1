#ifndef USER_H
#define USER_H

#include <stdbool.h>

typedef enum {
  Female = 0,
  Male = 1
} Gender;

typedef struct{
    char firstName[20];
    char lastName[20];
    char socialSecurityNo[12];
    Gender gender;
} User;

#endif // USER_H
