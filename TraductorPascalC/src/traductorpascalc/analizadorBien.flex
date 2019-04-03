package traductorcpascal;
import java.io.*;
import java_cup.runtime.*;

%%

%class AnalizadorLexico
%cup
%line
%column


%%

[\r\n\t]        {System.out.print("");}


"#define"	{return new Symbol(sym.define_);}

"int"           {return new Symbol(sym.int_);}
"float"         {return new Symbol(sym.float_);}
"void"          {return new Symbol(sym.void_);}

";"		{return new Symbol(sym.puntocoma);}
"="		{return new Symbol(sym.igual);}
","		{return new Symbol(sym.coma);}
"("		{return new Symbol(sym.abrirPar);}
")"		{return new Symbol(sym.cerrarPar);}
"{"		{return new Symbol(sym.abrirLla);}
"}"		{return new Symbol(sym.cerrarLla);}
"return"	{return new Symbol(sym.return_);}
"+"		{return new Symbol(sym.mas);}
"-"		{return new Symbol(sym.menos);}
"*"		{return new Symbol(sym.mul);}
"/"		{return new Symbol(sym.div);}
"%"		{return new Symbol(sym.mod_);}
"||"            {return new Symbol(sym.or_);}
"&&"            {return new Symbol(sym.and_);}
"=="            {return new Symbol(sym.igualigual);}
"<"		{return new Symbol(sym.menor);}
">"		{return new Symbol(sym.mayor);}
">="            {return new Symbol(sym.mayorigual);}
"<="            {return new Symbol(sym.menorigual);}
"!"		{return new Symbol(sym.not_);}
"if"            {return new Symbol(sym.if_);}
"else"          {return new Symbol(sym.else_);}
"while"         {return new Symbol(sym.while_);}
"do"            {return new Symbol(sym.do_);}
"until"         {return new Symbol(sym.until_);}
"for"           {return new Symbol(sym.for_);}



[a-zA-Z$][a-zA-Z0-9_$]*                         {return new Symbol(sym.ident, yytext());}


[+-]?[0-9]+                                     {return new Symbol(sym.constint, yytext());}		
[+-]?[0-9]+"."[0-9]+                            {return new Symbol(sym.constfloat, yytext());}

"0"[+-]?[0-7]+					{return new Symbol(sym.constint, yytext());}
"0"[+-]?[0-7]+"."[0-7]+                         {return new Symbol(sym.constfloat, yytext());}

"0x"[+-]?[0-9A-F]+				{return new Symbol(sym.constint, yytext());}
"0x"[+-]?[0-9A-F]+"."[0-9A-F]+                  {return new Symbol(sym.constfloat, yytext());}

\'([^'\n]|\')+\'                                {return new Symbol(sym.constlit, yytext());}

"/*"([^*]|"*"[^/])*"*"+"/"                      {}
"//"[^\r\n]+                                    {} 
[ ]             {}
.               { System.out.println("Caracter erroneo: "+yytext() + " " + yyline + " " + yycolumn); }

