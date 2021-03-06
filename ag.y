%{
    #include <stdio.h>
    int yylex(void);
    void yyerror(char *);
%}
%start sql
%token INTEGER
%token DATABASE
%token TEXT_FIELD
%token TEXT_AREA
%token TABLE_NAME
%token EQ
%token IDENTIFIER
%left '='
%union {
    int num;                 /* integer value */
    char* value;                /* symbol table index */
};

%%

sql:	        
            	 	  create_database { printf("asd");}
             	 	| sql create_database
            	 	;

create_database: 
                	DATABASE { printf("Sad");}
                	;

// create_table: 
//                     TABLE_NAME { printf("create table");}
//                     ;

%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}
