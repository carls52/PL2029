package plctopascal;
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

[1-9][0-9]* {return new Symbol(sym.Tnumero, Integer.parseInt(yytext()));}
"==" {return new Symbol(sym.Teq);}
"!=" {return new Symbol(sym.Tdif);}
"<" {return new Symbol(sym.Tmenor);}
">" {return new Symbol(sym.Tmayor);}
"<=" {return new Symbol(sym.Tmayoreq);}
">=" {return new Symbol(sym.Tmenoreq);}
"(" {return new Symbol(sym.Tpaa);}
")" {return new Symbol(sym.Tpac);}
"true" {return new Symbol(sym.Ttrue, Boolean.parseBoolean(yytext()));}
"false" {return new Symbol(sym.Tfalse, Boolean.parseBoolean(yytext()));}
"not" {return new Symbol(sym.Tnot);}
"and" {return new Symbol(sym.Tand);}
"or" {return new Symbol(sym.Tor);}
"nand" {return new Symbol(sym.Tnand);}
"nor" {return new Symbol(sym.Tnor);}
"xor" {return new Symbol(sym.Txor);}
"xnor" {return new Symbol(sym.Txnor);}
";" {return new Symbol(sym.Tpc);}
[^] {}
