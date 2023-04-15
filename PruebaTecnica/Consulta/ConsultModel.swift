//
//  ConsultaModelo.swift
//  PruebaTecnica
//
//  Created by Rodrigo Sánchez on 15/04/23.
//

import Foundation

protocol ConsultModelProtocol:AnyObject{
    
    func itemConsult (Consult:[DetailUser])
    
}
let elToken:String = "J38b4XQNLErVatKIh4oP1jw9e_wYWkS86Y04TMNP"
let helper = Helper()

class ConsultModel: NSObject{
    
    weak var TheDelegate: ConsultModelProtocol!
    
    let url = URL(string: "https://api.devdicio.net:8444/v1/sec_dev_interview")!
    
    func downloadConsult(){
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("api.devdicio.net", forHTTPHeaderField: "Host")
        request.addValue("J38b4XQNLErVatKIh4oP1jw9e_wYWkS86Y04TMNP", forHTTPHeaderField: "xc-token")
        
        let SessionDefault = Foundation.URLSession(configuration: URLSessionConfiguration.ephemeral)
        URLCache.shared.removeAllCachedResponses()
        
        let task = SessionDefault.dataTask(with: request){
            (data, response, error)in
            if error != nil{
                print("Error al descargar la consulta")
            }else{
                print("Datos descargados")
                self.parseJSON(data!)
            }
        }
        task.resume()
        
    }
    
    func parseJSON(_ data: Data) {
        var resultFromServer: Any?
        resultFromServer = try? JSONSerialization.jsonObject(with: data, options: [])
        if let respArr = resultFromServer as? [[String:Any]] {
            let details = respArr.map { (dict) -> DetailUser in
                let detail = DetailUser()
                detail.id = dict["id"] as? Int
                detail.nombre = dict["nombre"] as? String
                detail.apellidoPaterno = dict["apellidoPaterno"] as? String
                detail.apellidoMaterno = dict["apellidoMaterno"] as? String
                detail.edad = dict["edad"] as? Int
                detail.email = dict["email"] as? String
                detail.fechaNac = dict["fechaNac"] as? String
                let datosDict = dict["datos"] as? [String:Any]
                
                let datos = Datos()
                datos.calle = datosDict?["calle"] as? String
                datos.numero = datosDict?["numero"] as? String
                datos.colonia = datosDict?["colonia"] as? String
                datos.delegacion = datosDict?["delegacion"] as? String
                datos.estado = datosDict?["estado"] as? String
                datos.cp = datosDict?["cp"] as? String
                datos.imagen = datosDict?["imagen"] as? String
                
                detail.datos = datos
                
                return detail
            }
            
            DispatchQueue.main.async {
                self.TheDelegate.itemConsult(Consult: details)
            }
        }
    }

    
    
}
