//
//  ViewController.swift
//  PruebaTecnica
//
//  Created by Rodrigo Sánchez on 14/04/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    let helper = Helper()
    
    var dateString: String = ""
    var date = DateFormatter()
    var pickerDate: UIDatePicker!
    var laImagen: String = ""
    
    lazy var spinningActivity = MBProgressHUD.showAdded(to: self.view, animated: true)
    
    var currentTextField = UITextField()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var formPersonalData: NSLayoutConstraint!
    @IBOutlet weak var formContact: NSLayoutConstraint!
    @IBOutlet weak var formAdress: NSLayoutConstraint!
    @IBOutlet weak var formPhoto:NSLayoutConstraint!
    
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
    @IBOutlet weak var btnContinuaAdress: UIButton!
    @IBOutlet weak var btnFinaliza: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtNameUser.delegate = self
        txtApePat.delegate = self
        txtApeMat.delegate = self
        txtFechNac.delegate = self
        txtMail.delegate = self
        txtCalleAddress.delegate = self
        txtNumAddress.delegate = self
        txtColoniaAddresss.delegate = self
        txtCiudadAddress.delegate = self
        txtEstadoAdreess.delegate = self
        txtCPAddress.delegate = self
        
        cornerRadius(for:txtNameUser)
        cornerRadius(for:txtApePat)
        cornerRadius(for:txtApeMat)
        cornerRadius(for:txtFechNac)
        cornerRadius(for:txtMail)
        cornerRadius(for:txtCalleAddress)
        cornerRadius(for:txtNumAddress)
        cornerRadius(for:txtColoniaAddresss)
        cornerRadius(for:txtCiudadAddress)
        cornerRadius(for:txtEstadoAdreess)
        cornerRadius(for:txtCPAddress)
        
        cornerRadius(for:btnContinuaData)
        cornerRadius(for:btnContinuaContact)
        cornerRadius(for: btnContinuaAdress)
        cornerRadius(for:btnFinaliza)
        
        padding(for: txtNameUser)
        padding(for: txtApePat)
        padding(for: txtApeMat)
        padding(for: txtFechNac)
        padding(for: txtMail)
        padding(for: txtCalleAddress)
        padding(for: txtNumAddress)
        padding(for: txtColoniaAddresss)
        padding(for: txtCiudadAddress)
        padding(for: txtEstadoAdreess)
        padding(for: txtCPAddress)
        
        content_width.constant = self.view.frame.width * 4
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(self.handle(_:)))
        swipe.direction = .right
        self.view.addGestureRecognizer(swipe)
        
        formPersonalData.constant = self.view.frame.width
        formContact.constant = self.view.frame.width
        formAdress.constant = self.view.frame.width
        formAdress.constant = self.view.frame.width
        
        let doneButton = UIBarButtonItem(title: "Listo", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.okPicker))
        
        pickerDate = UIDatePicker()
        pickerDate.datePickerMode = .date
        pickerDate.maximumDate = Calendar.current.date(bySetting: .day, value: 0, of: Date())
        pickerDate.maximumDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())
        pickerDate.addTarget(self, action: #selector(self.datePickerDidChange(_:)), for: .valueChanged)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .tintColor
        toolBar.sizeToFit()
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        if #available(iOS 13.4, *) {
            
            pickerDate.preferredDatePickerStyle = .wheels
            
        }else{
            
        }
        
        txtFechNac.inputView = pickerDate
        txtFechNac.inputAccessoryView = toolBar
        
    }
    
    @objc func okPicker(){
        
        self.view.endEditing(true)
        
    }
    
    @IBAction func selectPhoto(_ sender: Any){
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func saveImage(image: UIImage) -> URL? {
        
        if let data = image.jpegData(compressionQuality: 1.0) {
            let filename = getDocumentsDirectory().appendingPathComponent("image.jpg")
            try? data.write(to: filename)
            return filename
        }
        
        return nil
        
    }
    
    
    func getDocumentsDirectory() -> URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
        
    }
    
    
    func scaleImageToSize(image: UIImage, size: CGSize) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
        
    }
    
    func convertImageToBase64(image: UIImage) -> String? {
        
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            let base64String = imageData.base64EncodedString(options: [])
            return base64String
        }
        
        return nil
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            
            let scaledImage = scaleImageToSize(image: image, size: CGSize(width: 300, height: 300))
            
            imageView.image = scaledImage
            
            if let base64String = convertImageToBase64(image: scaledImage) {
                print("La foto en Base64: \(base64String)")
                saveImage(image: scaledImage)
                laImagen = base64String
                
            }
            
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func padding(for textField: UITextField){
        
        let blankView = UIView.init(frame: CGRect(x:0, y:0, width: 10, height: -10))
        textField.leftView = blankView
        textField.leftViewMode = .always
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        txtFechNac.resignFirstResponder()
        
    }
    
    @objc func datePickerDidChange(_ pickerFechaStart: UIDatePicker){
        
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.full
        
        if txtFechNac.isEditing == true {
            txtFechNac.text = formatter.string(from: pickerDate.date)
            let DateSelected = DateFormatter()
            DateSelected.dateFormat = "yyyy-MM-dd"
            dateString = DateSelected.string(from: pickerDate.date)
            print("La fecha seleccionada: ", dateString)
            
        }
        
    }
    
    @IBAction func textFieldDidChangeSelection(_ textField: UITextField) {
        
    }
    
    @IBAction func formPagePersonalData_clicked(_ sender: Any){
        
        txtNameUser.resignFirstResponder()
        let position = CGPoint(x: self.view.frame.width, y: 0)
        scrollView.setContentOffset(position, animated: true)
        
    }
    
    @IBAction func formPageContact_clicked(_ sender: Any){
        
        if helper.isValid(email: txtMail.text!) == false{
            helper.showAlert(title: "Atención", message: "Mail no valido, ingrese correctamente su cuenta de correo electrónico", in: self)
        }else{
            
            let position2 = CGPoint(x: self.view.frame.width * 2, y: 0)
            scrollView.setContentOffset(position2, animated: true)
        }
        
        
    }
    
    @IBAction func formPageAddress_clicked(_ sender: Any){
        
        let position3 = CGPoint(x: self.view.frame.width * 3, y: 0)
        scrollView.setContentOffset(position3, animated: true)
        
    }
    
    @IBAction func btnFinishSaveData(_ sender: Any) {
        if laImagen == ""{
            helper.showAlert(title: "Atención", message: "Aún no has cargado una foto", in: self)
        }else{
            sendData()
        }
        
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        textField.resignFirstResponder()
        return true
        
    }
    
    @objc func handle(_ gesture: UISwipeGestureRecognizer){
        
        let current_x = scrollView.contentOffset.x
        let screen_width = self.view.frame.width
        let new_x = CGPoint(x: current_x - screen_width, y:0)
        
        if current_x > 0{
            
            scrollView.setContentOffset(new_x, animated: true)
            
        }
        
    }
    
    
    func cornerRadius(for view: UIView){
        
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        
    }
    
    
    func sendData(){
        
        let dataUsers = DataUser(nombre: txtNameUser.text!, apellidoPaterno: txtApePat.text!, apellidoMaterno: txtApeMat.text!, fechaNac: dateString, email: txtMail.text!, edad: helper.caculateAge(birthday: dateString), datos: DataDatos(calle: txtCalleAddress.text!, colonia: txtColoniaAddresss.text!, numero: txtNumAddress.text!, delegacion: txtCiudadAddress.text!, estado: txtEstadoAdreess.text!, cp: txtCPAddress.text!, imagen: laImagen))
        
        print("El body JSON es:", helper.createJSON(from: dataUsers)!)
        
        if let jsonString = helper.createJSON(from: dataUsers){
            
            let url = URL(string: helper.host)!
            let body = jsonString
            
            var request = URLRequest(url: url)
            request.httpBody = body.data(using: .utf8)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("api.devdicio.net", forHTTPHeaderField: "Host")
            request.addValue("J38b4XQNLErVatKIh4oP1jw9e_wYWkS86Y04TMNP", forHTTPHeaderField: "xc-token")
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                DispatchQueue.main.async { [self] in
                    if error != nil{
                        helper.showAlert(title: "Error de servidor", message: error!.localizedDescription, in: self)
                        return
                    }
                    do{
                        guard let data = data else{
                            
                            helper.showAlert(title: "Error de datos", message: error!.localizedDescription, in: self)
                            return
                            
                        }
                        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary
                        
                        guard let parsedJSON = json else{
                            print("Error de parseo")
                            return
                        }
                        print(parsedJSON)
                        
                        if let response = response as? HTTPURLResponse, response.isResponseOK(){
                            
                            let myAlert = UIAlertController(title: "Gracias", message: "Registro Exitoso", preferredStyle: UIAlertController.Style.alert)
                            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(alertAction) in
                                
                                let position = CGPoint(x:0, y:0)
                                self.scrollView.setContentOffset(position, animated: true)
                                
                                self.txtNameUser.text = ""
                                self.txtApePat.text = ""
                                self.txtApeMat.text = ""
                                self.txtFechNac.text = ""
                                self.txtMail.text = ""
                                self.txtCalleAddress.text = ""
                                self.txtNumAddress.text = ""
                                self.txtColoniaAddresss.text = ""
                                self.txtCiudadAddress.text = ""
                                self.txtEstadoAdreess.text = ""
                                self.txtCPAddress.text = ""
                                
                            })
                            
                            myAlert.addAction(okAction)
                            self.present(myAlert, animated:true, completion: nil)
                        }else{
                            helper.showAlert(title: "Error", message: "No se pudo registrar el usuario", in: self)
                        }
                        
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }.resume()
            
        }else{
            print("Error al crear el JSON")
        }
        
    }
}

extension HTTPURLResponse {
    
    func isResponseOK() -> Bool {
        return (200...299).contains(self.statusCode)
    }
    func isResponseFail() -> Bool{
        return (400...409).contains(self.statusCode)
    }
    
}
