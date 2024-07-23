#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <conio.h>
#include <stdbool.h>
#include "user.h"
#define BUFFERSIZE 30

int main()
{
   if(Database_Init(30)==0){
       printf("!");
       exit(-1);
   } else
      printf("memory is avaiable.\n");

    int index;
    int i=0;
    int choice;
    User a;

    char buffer[BUFFERSIZE];

    while(1){
        printf("\n1. Add user\n");
        printf("2. Remove user\n");
        printf("3. Print user\n");
        printf("4. Exit\n>");
        scanf("%d",&choice);

        User user;
        switch (choice){
        case 1:
            printf("Enter first name: ");
            scanf("%s", buffer);
            strcpy( user.firstName, buffer);

            printf("Enter last name: ");
            scanf("%s", buffer);
            strcpy( user.lastName, buffer);

            printf("Enter social security number: ");
            scanf("%s", buffer);
            strcpy( user.socialSecurityNo, buffer);


            printf("Enter a gender: ");//gender>female=0, male=1;
            scanf("%d",&user.gender );

            Database_AddUser(user);
            break;
        case 2:
            printf("Enter user index to delete: ");
            scanf("%d",&index);
            if (Database_RemoveUser(index)==0)
                printf("!");
            break;
        case 3:
            printf("Enter user to get: ");
            scanf("%d",&index);
            if (index<0 || index>29){
                printf("!");
                break;
            }
            bool result;
            a = Database_GetUser(index, &result);

            if (result==false){
                printf("!");
                break;
            }

            if(strcmp(a.socialSecurityNo,"")==0 ){
                printf("!");
                break;
            }

            printf("\nFirst name: %s",a.firstName);
            printf("\nLast name: %s",a.lastName);
            printf("\nSocial security number: %s",a.socialSecurityNo);
            printf("\nGender: %d",a.gender);

            break;
        case 4:
            Database_Destroy();
            exit(1);
            break;
        }
    }
    return 0;
}


