%{
#include<stdio.h>
#include<stdlib.h>
int line_number=1;
%}

%%
\n {line_number++; printf("\n%d",line_number);}
. printf("%c",yytext[0]);
%%

int main()
{
FILE *input_file = fopen("input.c","r");
if(input_file == NULL)
{
  printf("ERROR: cannot open file\n");
  return 1;
}
yyin = input_file;
printf("1: ");
yylex();
fclose(input_file);
return 0;
}
