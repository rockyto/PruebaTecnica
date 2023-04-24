//
//  DatosUserViewController.swift
//  PruebaTecnica
//
//  Created by Rodrigo Sánchez on 23/04/23.
//

import UIKit
import ImageRow
import Eureka


class DatosUserViewController: FormViewController {
    
    let helper = Helper()
    var userData: [String: Any] = [:]
    
    var userName: String = ""
    var userApePat: String = ""
    var userApeMat: String = ""
    
    var userEdad: Int = 0
    var userFechaNac: String = ""
    
    var userMail: String = ""
    
    var userCalle: String = ""
    var userNumero: String = ""
    var userColonia: String = ""
    var userEstado: String = ""
    var userDelegacion: String = ""
    var userCP: String = ""
    var userImagen: String = ""
    
    var selfieImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        form +++ Section()
        <<< ImageRow() { row in
            row.title = "Foto de usuario"
            row.value = userData["selfieImage"] as? UIImage
            
            
        }.cellUpdate { cell, row in
            cell.accessoryView?.layer.cornerRadius = 25
        }
        +++ Section("Datos personales")
        
        <<< TextRow(){ row in
            row.title = "Nombre"
            row.value =  userData["userName"] as? String
            
        }.onChange({ (row) in
            
            
        })
        
        <<< TextRow(){ row in
            row.title = "Apellido Paterno"
            row.value = userData["userApePat"] as? String
        }
        
        <<< TextRow(){ row in
            row.title = "Apellido Materno"
            row.value = userData["userApeMat"] as? String
        }
        
        +++ Section("Edad y cumpleaños")
        <<< TextRow(){ row in
            row.title = "Edad"
            row.value = userData["userEdad"] as? String
        }
        
        <<< DateRow(){ row in
            
            row.title = "Fecha de nacimiento"
            if userFechaNac != nil{
                row.value = helper.stringToDate(birthday: userData["userFechaNac"] as! String)
            }else{
                
            }
            
        }
        
        +++ Section("Contacto")
        <<< TextRow(){ row in
            row.title = "Correo electrónico"
            
            row.value = userData["userMail"] as? String
        }
        
        +++ Section("Domicilio")
        <<< TextRow(){ row in
            row.title = "Calle"
            row.value = userData["userCalle"] as? String
        }
        <<< TextRow(){ row in
            row.title = "Número"
            row.value = userData["userNumero"] as? String
        }
        <<< TextRow(){ row in
            row.title = "Colonia"
                row.value = userData["userColonia"] as? String
          
            
        }
        <<< TextRow(){ row in
            row.title = "Delegación"
            row.value = userData["userDelegacion"] as? String
       
        }
        <<< TextRow(){ row in
            row.title = "Estado"
            row.value = userData["userEstado"] as? String
        }
        <<< TextRow(){ row in
            row.title = "Código postal"
            row.value = userData["userCP"] as? String
        }
        // Do any additional setup after loading the view.
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension UIViewController{
    
    func escondeTecladoTap(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard(){
        self.view.endEditing(true)
    }
}
