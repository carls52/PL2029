package plctopascal;
import java.io.*;
import java_cup.runtime.*;

%%

%class AnalizadorLexico
%cup
%line
%column

%%

[\r\n\t] {System.out.print("");}
"float" {return new Symbol(sym.Tfloat, yyline, yycolumn);}
"int" {return new Symbol(sym.Tint, yyline, yycolumn);}
"void" {return new Symbol(sym.Tvoid, yyline, yycolumn);}
"return" {return new Symbol(sym.Treturn, yyline, yycolumn);}
"," {return new Symbol(sym.Tcoma, yyline, yycolumn);}
"{" {return new Symbol(sym.Tcora, yyline, yycolumn);}
"}" {return new Symbol(sym.Tcorc, yyline, yycolumn);}
"(" {return new Symbol(sym.Tpara, yyline, yycolumn);}
")" {return new Symbol(sym.Tparc, yyline, yycolumn);}
";" {return new Symbol(sym.Tpcoma, yyline, yycolumn);}
"#define" {return new Symbol(sym.Tdefine, yyline, yycolumn);}
"if" {return new Symbol(sym.Tif, yyline, yycolumn);}
"else" {return new Symbol(sym.Telse, yyline, yycolumn);}
"while" {return new Symbol(sym.Twhile, yyline, yycolumn);}
"do" {return new Symbol(sym.Tdo, yyline, yycolumn);}
"until" {return new Symbol(sym.Tuntil, yyline, yycolumn);}
"for" {return new Symbol(sym.Tfor, yyline, yycolumn);}

[$A-Za-z][_$A-Za-z0-9]* {return new Symbol(sym.Tident, yyline, yycolumn, yytext());}
[0][+-]?[0-7]+ {return new Symbol(sym.Tconstint, yyline, yycolumn, yytext());}
"0x"[+-]?[0-9A-F]+ {return new Symbol(sym.Tconstint, yyline, yycolumn, yytext());}
[+-]?[0-9]+ {return new Symbol(sym.Tconstint, yyline, yycolumn, yytext());}
[0][+-]?[0-7]+"."[0-7]+ {return new Symbol(sym.Tconstfloat, yyline, yycolumn, yytext());}
"0x"[+-]?[0-9A-F]+"."[0-9A-F]+ {return new Symbol(sym.Tconstfloat, yyline, yycolumn, yytext());}
[+-]?[0-9]+"."[0-9]+ {return new Symbol(sym.Tconstfloat, yyline, yycolumn, yytext());}
\'([^'\n]|\')+\' {return new Symbol(sym.Tconstlit, yyline, yycolumn, yytext());}

"+" {return new Symbol(sym.Tmas, yyline, yycolumn);}
"-" {return new Symbol(sym.Tmenos, yyline, yycolumn);}
"*" {return new Symbol(sym.Tpor, yyline, yycolumn);}
"/" {return new Symbol(sym.Tdiv, yyline, yycolumn);}
"%" {return new Symbol(sym.Tmod, yyline, yycolumn);}
"&&" {return new Symbol(sym.Tand, yyline, yycolumn);}
"||" {return new Symbol(sym.Tor, yyline, yycolumn);}
"==" {return new Symbol(sym.Teq, yyline, yycolumn);}
"<" {return new Symbol(sym.Tmenor, yyline, yycolumn);}
">" {return new Symbol(sym.Tmayor, yyline, yycolumn);}
"<=" {return new Symbol(sym.Tmenori, yyline, yycolumn);}
">=" {return new Symbol(sym.Tmayori, yyline, yycolumn);}
"!" {return new Symbol(sym.Tneg, yyline, yycolumn);}
"=" {return new Symbol(sym.Tasig, yyline, yycolumn);}
"/*"([^*]|"*"[^/])*"*"+"/" {}
"//"[^\r\n]+ {}
[ ] {}
. { System.out.println("Error léxico. Caracter erroneo: "+yytext() + ", linea " + yyline + " columna " + yycolumn); }
