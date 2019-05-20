/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package traductorpascalc;

public class VarList {
    String valor = "";
    String tipo = "";
    String[] lista;
    int max=0;
    Boolean funcion = false;
    public VarList(){
        lista = new String[100];
    }
    public VarList(Boolean f)
    {
        this.funcion = f;
    }
}
