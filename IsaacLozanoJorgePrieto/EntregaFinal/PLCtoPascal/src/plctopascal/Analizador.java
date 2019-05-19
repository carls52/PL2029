package plctopascal;
import java.io.*;
public class Analizador{
	public static void main(String argv[]) throws Exception
	{
		if(argv.length ==0)
		{
			System.out.println("Inserta nombre de archivo\n"+"(Usage: java Analizador <inputfile>)");
		}
		else
		{
			for(int i=0; i<argv.length;i++)
			{
				AnalizadorLexico lexico = null;
				try{
                                        String salida = argv[i].substring(0,argv[i].length()-2) +".pas";
                                        PrintStream o = new PrintStream (new File(salida));
                                        System.setOut(o);
					lexico = new AnalizadorLexico(new java.io.FileReader(argv[i]));
					parser sintactico = new parser(lexico);     
					sintactico.parse();
				}
				catch(java.io.FileNotFoundException e){
					System.out.println("Archivo no encontrado");
				}

				catch(java.io.IOException e){
					System.out.println("Error en lectura");
					e.printStackTrace();
				}
				
			}
		}
	}
}