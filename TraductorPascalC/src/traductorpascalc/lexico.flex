package traductorPascalC;
import java.io.*;
import java_cup.runtime.*;

%%

%class AnalizadorLexico
%cup
%line
%column


%%
"#define"	{return new Symbol(sym.define_);}

"."             {return new Symbol (sym.punto)}
"var"             {return new Symbol (sym.var)}
"procedure"		{return new Symbol(sym.procedure);}
"function"		{return new Symbol(sym.function);}
":"		{return new Symbol(sym.dospuntos);}
";"		{return new Symbol(sym.puntocoma);}
"="		{return new Symbol(sym.igual);}
","		{return new Symbol(sym.coma);}
"("		{return new Symbol(sym.abrirPar);}
")"		{return new Symbol(sym.cerrarPar);}
":="		{return new Symbol(sym.puntosIgual);}
"+"		{return new Symbol(sym.mas);}
"-"		{return new Symbol(sym.menos);}
"*"		{return new Symbol(sym.mul);}
"div"		{return new Symbol(sym.div);}
"mod"		{return new Symbol(sym.mod_);}


"{"		{return new Symbol(sym.abrirLla);}
"}"		{return new Symbol(sym.cerrarLla);}
"return"	{return new Symbol(sym.return_);}


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
/*---------------- identificadores ---------------*/

[a-n-ozA-N-O-Z][a-zA-Z0-9_]*{
	return new Symbol (sym.identifier);
}

/*----------------  numeros ---------------*/

[+-]?[0-9]+{
	return new Symbol (sym.numeric_integer_const,yytext());
}
		
[+-]?[0-9]+"."[0-9]+{
	return new Symbol (sym.numeric_const_real, yytext());
}

[+-]?[0-9]+[eE][+-]?[0-9]+{
	return new Symbol (sym.numeric_const_real, yytext());
}

[+-]?[0-9]+"."[0-9]]+[eE][+-]?[0-9]+{
	return new Symbol (sym.numeric_const_real, yytext());
}

"''" {
	return new Symbol (sym.string_const, yytext());
}

/*----------------  comentarios ---------------*/

"{"([^\n\r}])*"}"          {}
"{*"([^*]|"*"[^}])*"*"+"}" {}

/*----------------  espacios en blanco ---------------*/

[/n/t/r] {}

.{
	System.out.println("Error "+ yytext());
}
