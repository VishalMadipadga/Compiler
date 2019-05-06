/*Vishal Madipadga
CS3377.501
vrm160030@utdallas.edu

File contains all tokens and the regular expressions associated with them
For all Complex Tokens (tokens who's meta information is not explicit)
yylval is set to yytext, which is converted either to a char* or integer, 
so that Bison can use


*/



%option noyywrap
%option nounput
%option noinput

%{
  #include <stdlib.h>
 //#include "myproject.h"
  #include "y.tab.h"
%}

%%

[a-zA-Z]\.?		{yylval.str= strdup(yytext); return NAME_INITIAL_TOKEN; }
[ \t\r]+                {  }
M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3}) 	{yylval.str = strdup(yytext); return ROMANTOKEN;}  
"Sr."		{return SRTOKEN;}
"Jr."		{return JRTOKEN;}
[\r\n] 		{return EOLTOKEN; }		
[0-9]+		{yylval.value = atoi (yytext); return INTTOKEN; }
"#"		{return HASHTOKEN;}
","		{return COMMATOKEN;}
[a-zA-Z]{2,}            {yylval.str= strdup(yytext); return NAMETOKEN; }
"-"		{return DASHTOKEN;}
^[a-zA-Z0-9][a-zA-Z0-9]+                {yylval.str= strdup(yytext); return IDENTIFIERTOKEN;}




%%
