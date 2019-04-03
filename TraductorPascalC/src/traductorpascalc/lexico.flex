package traductorPascalC;
import java.io.*;
import java_cup.runtime.Symbol;

%%

%class AnalizadorLexico
//%cupsym sym
%cup
%line
%column

%%

/*---------------- palabras reervadas ---------------*/
"program"	{return new Symbol(sym.program_);}
"UNIT"	{return new Symbol(sym.unit_);}

"."             {return new Symbol (sym.punto);}
":"		{return new Symbol(sym.dosPuntos);}
";"		{return new Symbol(sym.puntoComa);}
"="		{return new Symbol(sym.igual);}
","		{return new Symbol(sym.coma);}
"("		{return new Symbol(sym.abrirPar);}
")"		{return new Symbol(sym.cerrarPar);}
":="		{return new Symbol(sym.puntosIgual);}
"<"		{return new Symbol(sym.menor);}
">"		{return new Symbol(sym.mayor);}
">="      	{return new Symbol(sym.mayorIgual);}
"<="      	{return new Symbol(sym.menorIgual);}
"+"		{return new Symbol(sym.mas);}
"-"		{return new Symbol(sym.menos);}
"*"		{return new Symbol(sym.mul);}
"div"		{return new Symbol(sym.div_);}
"mod"		{return new Symbol(sym.mod_);}
"var"           {return new Symbol (sym.var_);}
"procedure"	{return new Symbol(sym.procedure_);}
"function"	{return new Symbol(sym.function_);}
"lambda"	{return new Symbol(sym.lambda);}

"const"         {return new Symbol(sym.const_);}
"INTEGER"	{return new Symbol(sym.int_);}
"REAL"          {return new Symbol(sym.real_);}
"if"      	{return new Symbol(sym.if_);}
"then"          {return new Symbol(sym.then_);}
"else"    	{return new Symbol(sym.else_);}
"while"   	{return new Symbol(sym.while_);}
"do"     	{return new Symbol(sym.do_);}
"repeat"	{return new Symbol(sym.repeat_);}
"until"   	{return new Symbol(sym.until_);}
"for"     	{return new Symbol(sym.for_);}
"to"     	{return new Symbol(sym.to_);}
"downto" 	{return new Symbol(sym.downto_);}
"begin" 	{return new Symbol(sym.begin_);}
"end"           {return new Symbol(sym.end_);}
"const"         {return new Symbol(sym.const_);}

"or"      	{return new Symbol(sym.or_);}
"and"     	{return new Symbol(sym.and_);}
"and"     	{return new Symbol(sym.and_);}
"not"     	{return new Symbol(sym.not_);}


/*---------------- identificadores ---------------*/

[a-no-zA-NO-Z][a-zA-Z0-9_]* {
	return new Symbol (sym.identifier);
}

/*----------------  numeros ---------------*/

[+-]?[0-9]+ {
	return new Symbol (sym.numeric_integer_const,yytext());
}
		
[+-]?[0-9]+"."[0-9]+    {
	return new Symbol (sym.numeric_real_const, yytext());
}

[+-]?[0-9]+[eE][+-]?[0-9]+  {
	return new Symbol (sym.numeric_real_const, yytext());
}

[+-]?[0-9]+"."[0-9]]+[eE][+-]?[0-9]+    {
	return new Symbol (sym.numeric_real_const, yytext());
}

"''" {
	return new Symbol (sym.string_const, yytext());
}

/*----------------  comentarios ---------------*/

"{"([^\n\r}])*"}"          {}
"{*"([^*]|"*"[^}])*"*"+"}" {}

/*----------------  espacios en blanco ---------------*/

[/n/t/r] {}

.   {
 System.out.println("Caracter erroneo: "+yytext() + " " + yyline + " " + yycolumn); 

}
