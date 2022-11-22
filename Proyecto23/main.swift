//
//  main.swift
//  Proyecto23
//
//  Created by Jorge Castilla on 19/11/22.
//



print("Hello, World!")
var matr1 = matriz(filas: 3, columnas: 3)
matr1.imprimirMatriz()
matr1.modificarElemento(filas: 3, columnas: 2, nuevoElemento: 10)
print("")
matr1.imprimirMatriz()
var op1 = operacionesMatriciales()
op1.sumarMatrices(matriz1: matr1, matriz2: matr1).imprimirMatriz()
var mtl1 = MTLoperacionesMatriciales()
var matr2 = matriz(filas: 1, columnas: 1)
for i in 0..<matr2.datos.count{
    matr2.datos[i] = Int.random(in: 1..<100)
}
matr2.imprimirMatriz()
mtl1.multiplicacionMatrices(matriz1: matr2, matriz2: matr2).imprimirMatriz()
readLine()


