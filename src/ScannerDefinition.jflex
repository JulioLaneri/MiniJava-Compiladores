
/*package de.jflex.example.standalone;*/
import java_cup.runtime.*;
%%

%public
%class Scanner
%cup
%unicode
%line
%column


%{
  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline+1, yycolumn+1, value);
  }
%}

whitespace=[\r\n]|[ \t]

%%
"print" { return symbol(sym.PRINT, yytext()); }

"true"      { return symbol(sym.TRUE, yytext()); }
"false"     { return symbol(sym.FALSE, yytext()); }
"this"      { return symbol(sym.THIS, yytext()); }
"else"      { return symbol(sym.ELSE, yytext()); }
"new"       { return symbol(sym.NEW, yytext()); }
"int"       { return symbol(sym.INT, yytext()); }
"if"        { return symbol(sym.IF, yytext()); }
"while"     { return symbol(sym.WHILE, yytext()); }
"length"    { return symbol(sym.LENGTH, yytext()); }
"return"	{ return symbol(sym.RETURN, yytext()); }
"System.out.println" { return symbol(sym.PRINT, yytext()); }

// Operadores lógicos y relacionales
"=="        { return symbol(sym.EQEQ, yytext()); }
"!="        { return symbol(sym.NEQ, yytext()); }
"<="        { return symbol(sym.LTE, yytext()); }
">="        { return symbol(sym.GTE, yytext()); }
"="         { return symbol(sym.EQ, yytext()); }
"<"         { return symbol(sym.LT, yytext()); }
">"         { return symbol(sym.GT, yytext()); }
"&&"        { return symbol(sym.AND, yytext()); }
"||"        { return symbol(sym.OR, yytext()); }
"!" 		{ return symbol(sym.NOT, yytext()); }

// Operadores aritméticos
"+"         { return symbol(sym.PLUS, yytext()); }
"-"         { return symbol(sym.MINUS, yytext()); }
"*"         { return symbol(sym.TIMES, yytext()); }
"/"         { return symbol(sym.DIV, yytext()); }
"%"         { return symbol(sym.MOD, yytext()); }

// Asignaciones compuestas
"+="        { return symbol(sym.PLUSEQ, yytext()); }
"-="        { return symbol(sym.MINUSEQ, yytext()); }
"*="        { return symbol(sym.TIMESEQ, yytext()); }
"/="        { return symbol(sym.DIVEQ, yytext()); }
"%="        { return symbol(sym.MODEQ, yytext()); }

// Incremento/Decremento
"++"        { return symbol(sym.INC, yytext()); }
"--"        { return symbol(sym.DEC, yytext()); }

// Puntuación
"("         { return symbol(sym.O_PAREN, yytext()); }
")"         { return symbol(sym.C_PAREN, yytext()); }
"["         { return symbol(sym.LBRACKET, yytext()); }
"]"         { return symbol(sym.RBRACKET, yytext()); }
"{"         { return symbol(sym.O_CBRACKET, yytext()); }
"}"         { return symbol(sym.C_CBRACKET, yytext()); }
";"         { return symbol(sym.SEMICOLON, yytext()); }
","         { return symbol(sym.COMMA, yytext()); }
"."         { return symbol(sym.DOT, yytext()); }

// Identificadores y números
[0-9]+      { return symbol(sym.NUM, Integer.parseInt(yytext())); }
[a-zA-Z_][a-zA-Z0-9_]*   { return symbol(sym.IDENTIFIER, yytext()); }

// Comentarios
"//".*                             { /* comentario de una línea */ }
"/*"([^*]*\*+)*"/"                { /* comentario multilinea */ }

{whitespace}+ {/*ignore*/}

. { System.err.println(
	"\nunexpected character in input: '" + yytext() + "' at line " +
	(yyline+1) + " column " + (yycolumn+1));
  }