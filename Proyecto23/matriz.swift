//
//  matriz.swift
//  Proyecto23
//
//  Created by Jorge Castilla on 19/11/22.
//

import Foundation
class matriz{
    var filas: NSInteger
    var columnas: NSInteger
    var datos = [NSInteger]()
    
    init(filas: NSInteger, columnas: NSInteger) {
        self.filas = filas+1
        self.columnas = columnas+1
        let iteraciones = (self.columnas*self.filas)
        for _ in 0..<iteraciones{
            self.datos.append(0)
        }
    }
    func selecionarElemento(fila: NSInteger, columna: NSInteger) -> NSInteger {
        var base: NSInteger
        base = fila*columnas+columna;
        return base;
    }
    func imprimirMatriz() -> Void {
        var elementoActual = 0
        for _ in 0...filas-1{
            for _ in 0...columnas-1{
                print(" \(datos[elementoActual]) ", terminator: "")
                elementoActual=elementoActual+1
            }
            print("")
        }
                
    }
    func modificarElemento(filas: NSInteger, columnas: NSInteger, nuevoElemento: NSInteger) -> Void{
        datos[selecionarElemento(fila: filas, columna: columnas)] = nuevoElemento
    }
    func verElemento(filas: NSInteger, columnas: NSInteger) -> NSInteger{
        return datos[selecionarElemento(fila: filas, columna: columnas)]
    }
}
