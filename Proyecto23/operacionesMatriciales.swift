//
//  operacionesMatriciales.swift
//  Proyecto23
//
//  Created by Jorge Castilla on 20/11/22.
//

import Foundation
class operacionesMatriciales{
    func sumarMatrices(matriz1: matriz, matriz2: matriz) -> matriz{
        let matrizResultado = matriz(filas: matriz1.filas-1, columnas: matriz1.columnas-1)
        for i in 0...matriz1.columnas-1{
            for j in 0...matriz1.filas-1{
                matrizResultado.modificarElemento(filas: j, columnas: i, nuevoElemento: matriz1.verElemento(filas: j, columnas: i)+matriz2.verElemento(filas: j, columnas: i))
            }
        }
        return matrizResultado
    }
    func restarMatrices(matriz1: matriz, matriz2: matriz) -> matriz{
        let matrizResultado = matriz(filas: matriz1.filas-1, columnas: matriz1.columnas-1)
        for i in 0...matriz1.columnas-1{
            for j in 0...matriz1.filas-1{
                matrizResultado.modificarElemento(filas: j, columnas: i, nuevoElemento: matriz1.verElemento(filas: j, columnas: i)-matriz2.verElemento(filas: j, columnas: i))
            }
        }
        return matrizResultado
    }
    func transponerMatriz(matriz1: matriz) -> matriz{
        let matrizResultado = matriz(filas: matriz1.filas-1, columnas: matriz1.columnas-1)
        for i in 0...matriz1.columnas-1{
            for j in 0...matriz1.filas-1{
                matrizResultado.modificarElemento(filas: i, columnas: j, nuevoElemento: matriz1.verElemento(filas: j, columnas: i))
            }
        }
        return matrizResultado
    }
}
