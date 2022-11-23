//
//  menu.swift
//  Proyecto23
//
//  Created by Jorge Castilla on 23/11/22.
//

import Foundation
class menu{
    init(){
        var seleccion: NSString
        var banderaSalida = 0
        var matrices = [matriz]()
        while banderaSalida == 0{
            print("Seleccione una opcion: ")
            print("1 Crear Matriz")
            print("2 Sumar Matrices")
            print("3 restar matrices")
            print("4 multiplicar matriz")
            print("5 matriz traspuesta")
            print("6 determinante de la matriz(solo en los casos 1x1, 2x2, 3x3 y 4x4)")
            print("7 salir")
            seleccion = readLine()! as NSString
            switch seleccion{
            case "1":
                print("Indique las filas ")
                let filas = Int(readLine()!)
                print("Indique las columnas")
                let columnas = Int(readLine()!)
                let matriz1 = matriz(filas: filas!-1, columnas: columnas!-1)
                for i in 0..<matriz1.filas{
                    for j in 0..<matriz1.columnas{
                        print("introduzca el elemento: \(i+1)x\(j+1)")
                        let elemento = Int(readLine()!)
                        matriz1.modificarElemento(filas: i, columnas: j, nuevoElemento: elemento!)
                    }
                }
                matrices.append(matriz1)
                matriz1.imprimirMatriz()
            case "2":
                if matrices.count >= 2{
                    var posicionMatriz = 0
                    for matriz in matrices{
                        print("Matriz \(posicionMatriz)")
                        posicionMatriz=posicionMatriz+1
                        matriz.imprimirMatriz()
                    }
                    print("Indique la matriz a sumar 1")
                    let matrizAlpha = Int(readLine()!)
                    print("Indique la matriz a sumar 2")
                    let matrizBravo = Int(readLine()!)
                    let op1 = operacionesMatriciales()
                    matrices.append(op1.sumarMatrices(matriz1: matrices[matrizAlpha!], matriz2: matrices[matrizBravo!]))
                    matrices.last?.imprimirMatriz()
                }else{
                    print("Deben de existir al menos dos matrices")
                }
            case "3":
                if matrices.count >= 2{
                    var posicionMatriz = 0
                    for matriz in matrices{
                        print("Matriz \(posicionMatriz)")
                        posicionMatriz=posicionMatriz+1
                        matriz.imprimirMatriz()
                    }
                    print("Indique la matriz a restar 1")
                    let matrizAlpha = Int(readLine()!)
                    print("Indique la matriz a restar 2")
                    let matrizBravo = Int(readLine()!)
                    let op1 = operacionesMatriciales()
                    matrices.append(op1.restarMatrices(matriz1: matrices[matrizAlpha!], matriz2: matrices[matrizBravo!]))
                    matrices.last?.imprimirMatriz()
                }else{
                    print("Deben de existir al menos dos matrices")
                }
            case "4":
                if matrices.count >= 2{
                    var posicionMatriz = 0
                    for matriz in matrices{
                        print("Matriz \(posicionMatriz)")
                        posicionMatriz=posicionMatriz+1
                        matriz.imprimirMatriz()
                    }
                    print("Indique la matriz a multiplicar 1")
                    let matrizAlpha = Int(readLine()!)
                    print("Indique la matriz a multiplicar 2")
                    let matrizBravo = Int(readLine()!)
                    let mtlop1 = MTLoperacionesMatriciales()
                    matrices.append(mtlop1.multiplicacionMatrices(matriz1: matrices[matrizAlpha!], matriz2: matrices[matrizBravo!]))
                    matrices.last?.imprimirMatriz()
                }else{
                    print("Deben de existir al menos dos matrices")
                }
            case "5":
                if matrices.count >= 1{
                    var posicionMatriz = 0
                    for matriz in matrices{
                        print("Matriz \(posicionMatriz)")
                        posicionMatriz=posicionMatriz+1
                        matriz.imprimirMatriz()
                    }
                    print("Indique la matriz a transponer")
                    let matrizAlpha = Int(readLine()!)
                    let op1 = operacionesMatriciales()
                    matrices.append(op1.transponerMatriz(matriz1: matrices[matrizAlpha!]))
                    matrices.last?.imprimirMatriz()
                }else{
                    print("Debe de existir al menos una matriz")
                }
            case "6":
                if matrices.count >= 1{
                    var posicionMatriz = 0
                    for matriz in matrices{
                        print("Matriz \(posicionMatriz)")
                        posicionMatriz=posicionMatriz+1
                        matriz.imprimirMatriz()
                    }
                    print("Indique la matriz a calcular su determinante")
                    let matrizAlpha = Int(readLine()!)
                    let smd1 = SMIDoperacionesMatriciales()
                    print("el determinante es  \(smd1.calcularDeterminantes(matriz1: matrices[matrizAlpha!]))")
                }else{
                    print("Debe de existir al menos una matriz")
                }
            case "7":
                banderaSalida=1
            default:
                print("Selecione una opcion permitida")
            }
        }
    }
}
