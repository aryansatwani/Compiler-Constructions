%{
#include<stdio.h>
#include<stdlib.h>
int char_count=0;
int word_count=0;
int line_count=0;
%}

%%
  [ \t\r] {//Ignore Whitespace
  }
  \n {line_count++;}
  [a-zA-z]{6, } {word_count++; char_count = char_count+yyleng;}
. { if(yyleng>=6)
{
char_count=char_count+yyleng;
}
  }
%%

int main()
{
  yylex();
printf("No. of words is %d\n",word_count);
printf("No. of chars is %d\n", char_count);
printf("No of lines is %d\n", line_count);
return 0;
}

