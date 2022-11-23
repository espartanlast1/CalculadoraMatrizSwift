//
//  SMIDoperacionesMatriciales.swift
//  Proyecto23
//
//  Created by Jorge Castilla on 23/11/22.
//

import Foundation
import simd

class SMIDoperacionesMatriciales{
    func calcularDeterminantes(matriz1: matriz) -> NSInteger{
        var salida = -1
            switch matriz1.columnas{
            case 1:
                salida = matriz1.verElemento(filas: 0, columnas: 0)
            case 2:
                let x = simd_double2(Double(matriz1.verElemento(filas: 0, columnas: 0)), Double(matriz1.verElemento(filas: 0, columnas: 1)))
                let y = simd_double2(Double(matriz1.verElemento(filas: 1, columnas: 0)), Double(matriz1.verElemento(filas: 1, columnas: 1)))
                let a = simd_double2x2(rows: [x, y])
                salida = Int(a.determinant)
            case 3:
                let x = simd_double3(Double(matriz1.verElemento(filas: 0, columnas: 0)), Double(matriz1.verElemento(filas: 0, columnas: 1)), Double(matriz1.verElemento(filas: 0, columnas: 2)))
                let y = simd_double3(Double(matriz1.verElemento(filas: 1, columnas: 0)), Double(matriz1.verElemento(filas: 1, columnas: 1)), Double(matriz1.verElemento(filas: 1, columnas: 2)))
                let z = simd_double3(Double(matriz1.verElemento(filas: 2, columnas: 0)), Double(matriz1.verElemento(filas: 2, columnas: 1)), Double(matriz1.verElemento(filas: 2, columnas: 2)))
                let a = simd_double3x3(rows: [x, y, z])
                salida = Int(a.determinant)
            case 4:
                let x = simd_double4(Double(matriz1.verElemento(filas: 0, columnas: 0)), Double(matriz1.verElemento(filas: 0, columnas: 1)), Double(matriz1.verElemento(filas: 0, columnas: 2)), Double(matriz1.verElemento(filas: 0, columnas: 3)))
                let y = simd_double4(Double(matriz1.verElemento(filas: 1, columnas: 0)), Double(matriz1.verElemento(filas: 1, columnas: 1)), Double(matriz1.verElemento(filas: 1, columnas: 2)), Double(matriz1.verElemento(filas: 1, columnas: 3)))
                let z = simd_double4(Double(matriz1.verElemento(filas: 2, columnas: 0)), Double(matriz1.verElemento(filas: 2, columnas: 1)), Double(matriz1.verElemento(filas: 2, columnas: 2)), Double(matriz1.verElemento(filas: 2, columnas: 3)))
                let w = simd_double4(Double(matriz1.verElemento(filas: 3, columnas: 0)), Double(matriz1.verElemento(filas: 3, columnas: 1)), Double(matriz1.verElemento(filas: 3, columnas: 2)), Double(matriz1.verElemento(filas: 3, columnas: 3)))
                let a = simd_double4x4(rows: [x, y, z, w])
                salida = Int(a.determinant)
                
            default:
                print("La Matriz debe se ser cuadrada")
            }
        return salida
        }
}
