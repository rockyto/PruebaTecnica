//
//  Models.swift
//  PruebaTecnica
//
//  Created by Rodrigo Sánchez on 14/04/23.
//

import Foundation

struct DataUser: Codable{
    var nombre: String
    var apellidoPaterno: String
    var apellidoMaterno: String
    var fechaNac: String
    var email: String
    var edad: Int
    var datos: DataDatos
}

struct DataDatos: Codable{
    var calle: String
    var colonia: String
    var numero: String
    var delegacion: String
    var estado: String
    var cp: String
}
