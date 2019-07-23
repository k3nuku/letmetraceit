%namespace letmetraceit
%partial
%parsertype cParser
%visibility internal
%tokentype Token

%union
{ 
	public int i;
	public double d; 
	public string s; 
}

%start header_include

%token NUMBER
%token PLUS MINUS MULTI DIVIDE
%token SHARP BITWISEAND LEFTPAREN RIGHTPAREN COMMA DOT COLON SEMICOLON
%token RGT ASSIGN LGT LEFTCURLY BITWISEOR RIGHTCURLY BOOLOR
%token WHILE SWITCH RETURN OUT IF GOTO FOR ELSE ELSEIF CONTINUE CASE BREAK
%token LEGT BITWISERIGHT EQUALS BITWISELEFT REGT BOOLAND NOTEQUALS
%token INCLUDE STATIC

%token UNSIGNED TYPEVOID TYPECHAR TYPEINT TYPELONG TYPEDOUBLE
%token TYPEUCHAR TYPEUINT TYPEULONG TYPEUDOUBLE
%token STRUCT

%token VALINT VALID VALFLOAT

%left LGT REGT RGT REGT EQUALS NOTEQUALS
%left MINUS PLUS
%left MULTI DIVIDE
%right UMINUS
%right POINTER
%nonassoc THEN
%nonassoc ELSE

%%
// struct asdf
structure: STRUCT VALID; 

// void, int, char ...
default_types: TYPEVOID | TYPECHAR | TYPEINT | TYPELONG | TYPEDOUBLE;

// types (struct, unsigned, deftypes ...)
types: default_types
	 | UNSIGNED default_types
	 | TYPEUCHAR | TYPEUINT | TYPEULONG | TYPEUDOUBLE
	 | structure
	 ;

// header include line
header_include: SHARP INCLUDE RGT header_file LGT {
	Console.WriteLine("including header at {0}", $4.s);
};

// header file (e.g. sys/types.h)
header_file: VALID DOT VALID { $$.s = $1.s + "." + $3.s; }
		   | VALID DIVIDE header_file { $$.s = $1.s + "/" + $3.s; };

//function_default: types Id LEFTPAREN parameters RIGHTPAREN;

//function_definition: STATIC function_default
//				     | ;

// function_body: LEFTCURLY statements RIGHTCURLY;

// statements

%%
public cParser(cScanner sc): base(sc) {}