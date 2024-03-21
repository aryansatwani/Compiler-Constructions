%{
  #include<stdio.h>
  #include<string.h>
  #include<stdlib.h>
  bool in_block_comment = false;
  bool in_line_comment = false;
%}

%%
"/*" {in_block_comment = true;}
"*/" {in_block_comment = false;}
"//" {in_line_comment = true;}

\n {
  if(in_line_comment){in_line_comment=false;}
  if(!in_block_comment){fputc("\n",yyout);}
}

%%

int main(int argc, char** argv)
{
  if(argc!=3)
  {
    printf("Usage:%s input_file output_file\n", argv[0]);
    return 1;
  }
  FILE *input_file = fopen(argv[1],"r");
  if(input_file == NULL)
  {
    printf("Error: could not open file %s\n",argv[1]);
    return 1;
  }

  FILE *output_file = fopen(argv[2],"r");
  if(output_file == NULL)
  {
    printf("Error: could not open file %s\n", argv[2]);
    return 1;
  }

  yyin = input_file;
  yyout = output_file;
  yylex();
  fclose(input_file);
  fclose(output_file);
  return 0;
}
