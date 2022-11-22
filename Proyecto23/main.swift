//
//  main.swift
//  Proyecto23
//
//  Created by Jorge Castilla on 19/11/22.
//

import Foundation



print("Hello, World!")
var matr1 = matriz(filas: 3, columnas: 3)
matr1.imprimirMatriz()
matr1.modificarElemento(filas: 3, columnas: 2, nuevoElemento: 10)
print("")
matr1.imprimirMatriz()
var op1 = operacionesMatriciales()
op1.sumarMatrices(matriz1: matr1, matriz2: matr1).imprimirMatriz()


var mtl1 = MTLoperacionesMatriciales()
var matr2 = matriz(filas: 9999, columnas: 9999)
for i in 0..<matr2.datos.count{
    matr2.datos[i] = Int.random(in: 1..<100)
}

let start = DispatchTime.now()
mtl1.multiplicacionMatrices(matriz1: matr2, matriz2: matr2)
let end = DispatchTime.now()
let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
let timeInterval = Double(nanoTime) / 1_000_000_000
print(timeInterval)
readLine()


