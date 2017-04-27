//
//  Restaurante.swift
//  CasoPracticoTelefonica
//
//  Created by user125877 on 27/4/17.
//  Copyright © 2017 user125877. All rights reserved.
//

import Foundation

class Restaurante: NSObject {
    var nombre: String = ""
    var descripcion: String = ""
    var longitud: Double = 0
    var latitud: Double = 0
    var nombre_imagen: String = ""
    var direccion: String = ""
    
    override init() {
    }
    
    init(nombre:String, descripcion: String, longitud: Double, latitud: Double, nombre_imagen: String, direccion:String) {
        self.nombre = nombre
        self.descripcion = descripcion
        self.longitud = longitud
        self.latitud = latitud
        self.nombre_imagen = nombre_imagen
        self.direccion = direccion
    
    }
    
}
