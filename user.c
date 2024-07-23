#include "user.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static User *database = 0;
static  int i=0;

bool Database_Init(int size)
{
    database = malloc(sizeof(User)*size);
    if(database==NULL)
        return 0;

    return 1;
}

bool Database_AddUser(User user)
{
    database[i++] = user;
    return 1;
}

bool Database_RemoveUser( int index)
{
    if(index>29 || index<0)
        return 0;
    else
        for (; index < 29; index++)
            database[index]= database[index+1];
    return 1;

}

User Database_GetUser(int index, bool *result)
{
    if (i<=index){
        *result=false;
        User user;
        return user;
    }

    *result=true;
    return database[index];
}

bool Database_Destroy()
{
    free(database);
    return 0;
}
