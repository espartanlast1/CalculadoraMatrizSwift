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
matr1.modificarElemento(filas: 2, columnas: 2, nuevoElemento: 10)
print("")
matr1.imprimirMatriz()
var op1 = operacionesMatriciales()
op1.sumarMatrices(matriz1: matr1, matriz2: matr1).imprimirMatriz()


