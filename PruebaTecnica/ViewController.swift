//
//  ViewController.swift
//  PruebaTecnica
//
//  Created by Rodrigo Sánchez on 14/04/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    

    
    @IBOutlet weak var formPersonalData: NSLayoutConstraint!
    @IBOutlet weak var formContact: NSLayoutConstraint!
    @IBOutlet weak var formAdress: NSLayoutConstraint!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var content_width: NSLayoutConstraint!
    
    @IBOutlet weak var txtNameUser: UITextField!
    @IBOutlet weak var txtApePat: UITextField!
    @IBOutlet weak var txtApeMat: UITextField!
    @IBOutlet weak var txtFechNac: UITextField!
    @IBOutlet weak var txtMail: UITextField!
    @IBOutlet weak var txtCalleAddress: UITextField!
    @IBOutlet weak var txtNumAddress: UITextField!
    @IBOutlet weak var txtColoniaAddresss: UITextField!
    @IBOutlet weak var txtCiudadAddress: UITextField!
    @IBOutlet weak var txtEstadoAdreess: UITextField!
    @IBOutlet weak var txtCPAddress: UITextField!
    
    @IBOutlet weak var btnContinuaData: UIButton!
    @IBOutlet weak var btnContinuaContact: UIButton!
    @IBOutlet weak var btnFinaliza: UIButton!
    
    /*
     @IBOutlet weak var contactData: NSLayoutConstraint!*/
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func sendData(){
        
        
    }


}

