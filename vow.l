%{
	int vow_count=0;
	int const_count=0;
%}

%%
[aeiouAEIOU] {vow_count++;}
[a-zA-Z] {const_count++;}

%%
int yywrap(){}
int main()
{
	printf("enter the string:");
	yylex();
	printf("no of vowels=%d\n no of consonants=%d",vow_count,const_count);
	return 0;
}