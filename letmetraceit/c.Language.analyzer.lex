%namespace letmetraceit
%scannertype cScanner
%visibility internal
%tokentype Token

%option stack, minimize, parser, verbose, persistbuffer, noembedbuffers 

%{

%}

Integer			([0]|[1-9][0-9]*)
Float			([0-9]*\.[0-9]+)
Id				(\_)*[A-Za-z][a-zA-Z0-9_]*
MultiComment	"/*"([^*]|\*+[^*/])*\*+"/"
SingleComment	((\/\/).+)
Delim			[ \t\r]
Newline			[\n]
Whitespace		({Delim}|{Newline})+
%%
{Whitespace}	; // ignoring whitespace
{SingleComment} ; // ignoring singlelined comment
{MultiComment}	; // ignoring multilined comment

"+"				{ return (int)Token.PLUS; }
"-"				{ return (int)Token.MINUS; }
"*"				{ return (int)Token.MULTI; }
"/"				{ return (int)Token.DIVIDE; }
"="				{ return (int)Token.ASSIGN; }

"=="			{ return (int)Token.EQUALS; }
"!="			{ return (int)Token.NOTEQUALS; }
">"				{ return (int)Token.LGT; }
">="			{ return (int)Token.LEGT; }
"<"				{ return (int)Token.RGT; }
"<="			{ return (int)Token.REGT; }

"<<"			{ return (int)Token.BITWISELEFT; }
">>"			{ return (int)Token.BITWISERIGHT; }
"|"				{ return (int)Token.BITWISEOR; }
"&"				{ return (int)Token.BITWISEAND; }

"||"			{ return (int)Token.BOOLOR; }
"&&"			{ return (int)Token.BOOLAND; }

"("				{ return (int)Token.LEFTPAREN; }
")"				{ return (int)Token.RIGHTPAREN; }
"{"				{ return (int)Token.LEFTCURLY; }
"}"				{ return (int)Token.RIGHTCURLY; }

"."				{ return (int)Token.DOT; }
","				{ return (int)Token.COMMA; }
":"				{ return (int)Token.COLON; }
";"				{ return (int)Token.SEMICOLON; }
"#"				{ return (int)Token.SHARP; }

"if"			{ return (int)Token.IF; }
"else"			{ return (int)Token.ELSE; }
"else if"		{ return (int)Token.ELSEIF; }
"switch"		{ return (int)Token.SWITCH; }
"case"			{ return (int)Token.CASE; }

"return"		{ return (int)Token.RETURN; }
"goto"			{ return (int)Token.GOTO; }
"out"			{ return (int)Token.OUT; }

"for"			{ return (int)Token.FOR; }
"while"			{ return (int)Token.WHILE; }
"break"			{ return (int)Token.BREAK; }
"continue"		{ return (int)Token.CONTINUE; }

"include"		{ return (int)Token.INCLUDE; }
"static"		{ return (int)Token.STATIC; }

// types: unsigned should be managed at token data
"unsigned"		{ return (int)Token.UNSIGNED; }
"char"			{ return (int)Token.TYPECHAR; }
"int"			{ return (int)Token.TYPEINT; }
"long"			{ return (int)Token.TYPELONG; }
"double"		{ return (int)Token.TYPEDOUBLE; }
"void"			{ return (int)Token.TYPEVOID; }
"u8"			{ return (int)Token.TYPEUCHAR; }
"u16"			{ return (int)Token.TYPEUINT; }
"u32"			{ return (int)Token.TYPEULONG; }
"u64"			{ return (int)Token.TYPEUDOUBLE; }
"struct"		{ return (int)Token.STRUCT; }

{Integer}		{ yylval.i = Int32.Parse(yytext); return (int)Token.VALINT; }
{Float}			{ yylval.d = Double.Parse(yytext); return (int)Token.VALFLOAT; }
{Id}			{ yylval.s = yytext; return (int)Token.VALID; }

.				{ yyerror(String.Format("lexical error {0}", yytext)); }
%%