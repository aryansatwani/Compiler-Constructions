%{
#include<stdio.h>
#include<stdlib.h>
%}

%%
[01]+ {
int num = 0, base=2, exp;
int result;
int len = strlen(yytext);
for (int i=0;i<len;i++)
{
  if (yytext[i] == '1')
  {
    result = 1;
    exp = len-i-1;
    while(exp!=0)
    {
      result = result*base;
      --exp;
    }
    num = num+result;
  }
}
if(num==0)
{
  printf("Input is not in power of 2\n")
}
else if((num &(num-1))=0)
{
  printf("The input is a power of 2\n")
}
else 
{
  printf("The input is not in a power of 2\n")
}
}
. {printf("Invalid Input\n");}

%%

int main()
{
  yylex();
  return 0;
}
