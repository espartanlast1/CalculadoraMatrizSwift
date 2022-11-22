//
//  MTLoperacionesMatriciales.swift
//  Proyecto23
//
//  Created by Jorge Castilla on 21/11/22.
//

import Foundation
import MetalPerformanceShaders

let device = MTLCreateSystemDefaultDevice()
let commandQueue = device?.makeCommandQueue()
let commandBuffer = commandQueue?.makeCommandBuffer()

class MTLoperacionesMatriciales{
    func multiplicacionMatrices(matriz1: matriz, matriz2: matriz) -> matriz{
        let resultRows = matriz1.filas
        let resultColumns = matriz2.columnas
        let interiorColumns = matriz1.columnas
        
        var Matriz1Float = [Float32]()
        for i in 0..<matriz1.datos.capacity{
            Matriz1Float.append(Float32(matriz1.datos[i]))
        }
        
        var Matriz2Float = [Float32]()
        for i in 0..<matriz2.datos.capacity{
            Matriz2Float.append(Float32(matriz2.datos[i]))
        }
        

        let mmKernel = MPSMatrixMultiplication(device: device!,
                                               transposeLeft: false,
                                               transposeRight: false,
                                               resultRows: resultRows,
                                               resultColumns: resultColumns,
                                               interiorColumns: interiorColumns,
                                               alpha: 1.0,
                                               beta: 0.0)
        
        let totalBytes = MemoryLayout<Float32>.stride * matriz1.datos.capacity
        let bufferA = device?.makeBuffer(bytes: Matriz1Float, length: totalBytes, options: .storageModeShared)
        let descriptorA = MPSMatrixDescriptor(rows: matriz1.filas, columns: matriz1.columnas, rowBytes: (totalBytes / matriz1.filas), dataType: .float32)
        
        let A = MPSMatrix(buffer: bufferA!, descriptor: descriptorA)
        
        
        let totalBytesB = MemoryLayout<Float32>.stride * matriz2.datos.capacity
        let bufferB = device?.makeBuffer(bytes: Matriz2Float, length: totalBytes, options: .storageModeShared)
        let descriptorB = MPSMatrixDescriptor(rows: matriz2.filas, columns: matriz2.columnas, rowBytes: totalBytesB / matriz2.filas, dataType: .float32)
        
        let B = MPSMatrix(buffer: bufferB!, descriptor: descriptorB)
        
        let totalBytesC = MemoryLayout<Float32>.stride * resultRows * resultColumns
        let bufferC = device?.makeBuffer(length: totalBytesC, options: .storageModeShared)
        let descriptorC = MPSMatrixDescriptor(rows: resultRows, columns: resultColumns, rowBytes: totalBytesC/resultRows, dataType: .float32)
        
        let C = MPSMatrix(buffer: bufferC!, descriptor: descriptorC)
        
        mmKernel.encode(commandBuffer: commandBuffer!, leftMatrix: A, rightMatrix: B, resultMatrix: C)
        
        commandBuffer?.commit()
        commandBuffer?.waitUntilCompleted()
        
        var output = [Float32]()
        
        let rawPointer = C.data.contents()
        let typePointer = rawPointer.bindMemory(to: Float32.self, capacity: resultRows*resultColumns)
        let bufferPointer = UnsafeBufferPointer(start: typePointer, count: resultRows*resultColumns)
        
        bufferPointer.map {value in
            output += [value]
        }
        let resultado = matriz(filas: resultRows-1, columnas: resultColumns-1)
        
        var resultadoInt = [NSInteger]()
        for i in 0..<output.capacity{
            resultadoInt.append(Int(output[i]))
        }
        
        resultado.datos = resultadoInt
        return resultado
    }
}
