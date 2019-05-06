//Vishal Madipadga
//CS3377.501 
//vrm160030@utdallas.edu

//include statements
#include <stdio.h>
//#include "myproject.h"
//header file genrated by bison, contains enums
#include "y.tab.h"
#include <string.h>

//function prototype for yylex
int yylex(void);
//variable prototype for yytext
extern char *yytext;
//function prototype for yyparse
int yyparse (void);

int main(int argc, char* argv[] ) 
{
 int token;
 //if argv[0] is ./scanner or if argv[1] is scanner call yylex 
 if(strcmp( argv[0],"./scanner" ) ==0  )
 {
 printf("\nOperating in scan mode\n \n" );
 
 //set token to output of yylex
 token = yylex();
 //while the token is not 0, execute switch statment
 while(token !=0)
 { 
  printf("yylex returned " ); 
  //switch statement based on token value
  switch(token)
   { 
   //all token are enumerated based on the expression they match
   //if a token is matched, print the token's enum and it's meta information
    case NAME_INITIAL_TOKEN:
    printf( "NAME_INITAL_TOKEN token(%s)\n", yytext    ) ;
    break;
    case IDENTIFIERTOKEN:
    printf("IDENTIFIERTOKEN token (%s)\n", yytext);
    break;
    case NAMETOKEN:
    printf( "NAMETOKEN (%s)\n" ,yytext );
    break;
    case ROMANTOKEN:
    printf("ROMANTOKEN (%s)\n", yytext  );
    break;
    case SRTOKEN:
    printf("SRTOKEN (%s)\n", yytext);
    break;
    case JRTOKEN:
    printf("JRTOKEN (%s)\n", yytext);
    break;
    case EOLTOKEN:
    printf("EOLTOKEN (%d)\n", token );
    break;
    case INTTOKEN:
    printf("INTTOKEN (%s)\n", yytext);
    break;
    case HASHTOKEN:
    printf("HASHTOKEN (%d)\n", token);
    break;
    case COMMATOKEN:
    printf("COMMATOKEN (%d)\n", token);
    break;
    case DASHTOKEN:
    printf("DASHTOKEN (%d)\n", token);
    break;

	
   }
   //get another token from yylex to continue the loop
   token = yylex();

 }
 }
 //if argv[0] is ./parser or argv[1] is parser , call yyparse
 if(strcmp(argv[0], "./parser" )==0   )
 {
   
   
     
     printf("\nOperating in parse mode.\n \n");

     //switch statement based on what yyparse returns
     switch (yyparse())
       {
       //if yyparse returns 0, yyparse was successful
       case 0:
	 printf("\nParse Successful!\n");
	 break;
       //if yyparse returned 1, yyparse failed
       case 1:
	 printf("Parse Failed!\n");
	 break;
       case 2:
	 printf("Out of Memory\n");
	 break;
       default:
	 printf("Unknown result from yyparse()\n");
	 break;
       

     }
 }

printf( "Done \n" );
return 0;
}
