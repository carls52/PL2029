/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package traductorpascalc;

public class VarList {
    String valor = "";
    String tipo = "";
    Boolean funcion = false;
    public VarList(){}
    public VarList(Boolean f)
    {
        this.funcion = f;
    }
}