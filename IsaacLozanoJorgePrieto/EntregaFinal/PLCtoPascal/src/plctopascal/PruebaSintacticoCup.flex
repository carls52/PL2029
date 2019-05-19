import java.io.*;
import java_cup.runtime.*;

%%

%init{
try{
PrintStream o = new PrintStream (new File("salPrueba.txt"));
System.setOut(o);
}
catch(FileNotFoundException e)
{}
%init}

%class AnalizadorLexico
%cup
%line
%column

%%

\r\n {System.out.print("");}
"#define" {return new Symbol(sym.Tdefine);}
"for" {return new Symbol(sym.Tfor);}
[$A-Za-z][_$A-Za-z0-9]* {return new Symbol(sym.Tid,yytext());}
[ ] {}
[^$A-Za-z] { System.out.println("Caracter erroneo: "+yytext() + " " + yyline + " " + yycolumn); }
