#ifndef DATABASE_H
#define DATABASE_H

#include "user.h"

typedef struct{
    User *users;
    int number;
    int max_number;
} Database;

bool Database_Init(Database *db, int size);
bool Database_AddUser(Database *db, User user);
bool Database_RemoveUser(Database *db, int index);
User Database_GetUser(Database *db, int index, bool *result);
bool Database_Destroy();


#endif // DATABASE_H
