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
    
    func parseJSON(_ data: Data){
        
        var resultFromServer: Any?
        resultFromServer = try? JSONSerialization.jsonObject(with: data, options: [])
        if let respdict = resultFromServer as? [String:Any]{
            
            var jsonDi = NSDictionary()
            
            do{
                jsonDi = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! NSDictionary
                
                let parsedJSON = jsonDi
                print("ParsedJSON: ", parsedJSON)
            }catch{
                
            }
        }else if let respArr = resultFromServer as? [Any]{
            
            var jsonResult = NSArray()
            do{
                jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            }catch let error as NSError{
                print(error)
            }
            
            var jsoneElement = NSDictionary()
            print(jsoneElement)
            
            let details = NSMutableArray()
            
            for i in 0 ..< jsonResult.count{
                jsoneElement = jsonResult[i] as! NSDictionary
                
                let detail = DetailUser()
                
                let id = jsoneElement["id"]
                let nombre = jsoneElement["nombre"]
                let apellidoPaterno = jsoneElement["apellidoPaterno"]
                let apellidoMaterno = jsoneElement["apellidoMaterno"]
                let edad = jsoneElement["edad"]
                let email = jsoneElement["email"]
                let fechaNac = jsoneElement["fechaNac"]
                let datos = jsoneElement["datos"]
                
                detail.id = id as? Int
                detail.nombre = nombre as? String
                detail.apellidoPaterno = apellidoPaterno as? String
                detail.apellidoMaterno = apellidoMaterno as? String
                detail.edad = edad as? Int
                detail.email = email as? String
                detail.fechaNac = fechaNac as? String
                detail.datos = datos as? String
                
                details.add(detail)
            }
            DispatchQueue.main.async(execute: { () -> Void in
                self.TheDelegate.itemConsult(Consult: details as! [DetailUser])
            })
        }
        
        else if let stringRespt = String(data: data, encoding: .utf8){
            
        }
    }
    
    
}
