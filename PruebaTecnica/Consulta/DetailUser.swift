//
//  DetailUser.swift
//  PruebaTecnica
//
//  Created by Rodrigo Sánchez on 15/04/23.
//

import Foundation

class DetailUser {
    var id: Int?
    var nombre: String?
    var apellidoPaterno: String?
    var apellidoMaterno: String?
    var edad: Int?
    var email: String?
    var fechaNac: String?
    var datos: Datos?
}

class Datos {
    var calle: String?
    var numero: String?
    var colonia: String?
    var delegacion: String?
    var estado: String?
    var cp: String?
    var imagen: String?
}
