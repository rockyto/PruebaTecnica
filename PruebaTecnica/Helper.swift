//
//  Helper.swift
//  PruebaTecnica
//
//  Created by Rodrigo Sánchez on 14/04/23.
//

import Foundation
import UIKit

class Helper{
    
    let host: String = "https://api.devdicio.net:8444/v1/sec_dev_interview/"
    
    func isValid(email: String) -> Bool{
        
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        let result = test.evaluate(with: email)
        return result
        
    }
    
    func isValid(nombre: String) -> Bool{
        
        let regex = "[A-Za-z ]{2,}"
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        let result = test.evaluate(with: nombre)
        return result
        
    }
    
    func createJSON(from dataUser: DataUser) -> String? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        guard let jsonData = try? encoder.encode(dataUser),
              let jsonString = String(data: jsonData, encoding: .utf8) else {
            return nil
        }
        
        return jsonString
    }

    
    func showAlert(title: String, message: String, in vc: UIViewController) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(ok)
        vc.present(alert, animated: true, completion: nil)
        
    }
    
    
}
