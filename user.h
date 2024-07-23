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
} User ;



bool Database_Init(int size);
bool Database_AddUser(User user);
bool Database_RemoveUser(int index);
User Database_GetUser(int index, bool *result);
bool Database_Destroy();


#endif // USER_H
