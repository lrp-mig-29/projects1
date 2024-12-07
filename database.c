#include "database.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

bool Database_Init(Database *db, int size)
{
    db->users=(User*)malloc(size *sizeof(User));
    db->number = 0;
    db->max_number = size;
    if(db->users==NULL)
        return 0;

    return 1;
}

bool Database_AddUser(Database *db, User user)
{
    db->users[db->number++] = user;
    return 1;
}

bool Database_RemoveUser(Database *db, int index)
{
    if(index>(db->number-1) || index<0)
        return 0;
    else
        for (; index < db->number; index++)
            db->users[index]= db->users[index+1];
    return 1;
}

User Database_GetUser(Database *db, int index, bool *result)
{
    if (db->number <= index){
        *result=false;
        User user;
        return user;
    }

    *result=true;
    return db->users[index];
}

bool Database_Destroy(Database *db)
{
    free(db->users);
    return 0;
}
