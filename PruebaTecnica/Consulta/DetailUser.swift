//
//  DetailUser.swift
//  PruebaTecnica
//
//  Created by Rodrigo Sánchez on 15/04/23.
//

import Foundation

class DetailUser: NSObject {
    
    var id: Int?
    var nombre: String?
    var apellidoPaterno: String?
    var apellidoMaterno: String?
    var edad: Int?
    var email: String?
    var fechaNac: String?
    var datos: String?
    
/**    struct Datos: Decodable {
 let calle: String?
 let numero: String?
 let colonia: String?
 let delegacion: String?
 let estado: String?
 let cp: String?
 let imagen: String?
}*/
    
    override init(){
        
    }
    
    init(id: Int?, nombre: String?, apellidoPaterno: String?, apellidoMaterno: String?, edad: Int?, email: String?, fechaNac: String?, datos: String?) {
        
        self.id = id
        self.nombre = nombre
        self.apellidoPaterno = apellidoPaterno
        self.apellidoMaterno = apellidoMaterno
        self.edad = edad
        self.email = email
        self.fechaNac = fechaNac
        self.datos = datos
        
    }
    
    override var description: String{
        
        return "id: \(id), nombre: \(nombre), apellidoPaterno: \(apellidoPaterno), apellidoMaterno: \(apellidoMaterno), edad: \(edad), email: \(email), fechaNac: \(fechaNac), datos: \(datos)"
    }


}
