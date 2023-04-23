//
//  DatosUserViewController.swift
//  PruebaTecnica
//
//  Created by Rodrigo Sánchez on 23/04/23.
//

import UIKit
import Eureka

class DatosUserViewController: FormViewController {
    
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

    override func viewDidLoad() {
        
       
        super.viewDidLoad()
        
        form +++ Section("Datos personales")

        <<< TextRow(){ row in
            row.title = "Nombre"
            row.value = userName
            
        }.onChange({ (row) in
            
            
        })
        
        <<< TextRow(){ row in
            row.title = "Apellido Paterno"
            row.value = userApePat
        }
        
        <<< TextRow(){ row in
            row.title = "Apellido Materno"
            row.value = userApeMat
        }
        
        +++ Section("Edad y cumpleaños")
        <<< TextRow(){ row in
            row.title = "Edad"
            row.value = "\(userEdad)"
        }
        
        <<< TextRow(){ row in
            row.title = "Fecha de nacimiento"
            row.value = userFechaNac
        }
        
        +++ Section("Contacto")
        <<< TextRow(){ row in
            row.title = "Correo electrónico"
            row.value = userMail
        }
        
        +++ Section("Domicilio")
        <<< TextRow(){ row in
            row.title = "Calle"
            row.value = userCalle
        }
        <<< TextRow(){ row in
            row.title = "Número"
            row.value = userNumero
        }
        <<< TextRow(){ row in
            row.title = "Colonia"
            row.value = userColonia
        }
        <<< TextRow(){ row in
            row.title = "Delegación"
            row.value = userDelegacion
        }
        <<< TextRow(){ row in
            row.title = "Estado"
            row.value = userEstado
        }
        <<< TextRow(){ row in
            row.title = "Código postal"
            row.value = userCP
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
