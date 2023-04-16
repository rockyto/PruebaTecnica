//
//  ListUserViewController.swift
//  PruebaTecnica
//
//  Created by Rodrigo Sánchez on 15/04/23.
//
import UIKit

class ListUserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ConsultModelProtocol, UISearchBarDelegate {
    
    lazy var spinningActivity = MBProgressHUD.showAdded(to: self.view, animated: true)
    @IBOutlet var tableUsers: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    var feedItems = [DetailUser]()
    var filteredItems = [DetailUser]()
    
    var selectData: DetailUser = DetailUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let consultModel = ConsultModel()
        consultModel.TheDelegate = self
        consultModel.downloadConsult()
        
        self.tableUsers.reloadData()
        self.tableUsers.delegate = self
        self.tableUsers.dataSource = self
        
        self.searchBar.delegate = self
        spinningActivity?.labelText = "Descargando"
        spinningActivity?.detailsLabelText = "un momento por favor"
    }
    
    func itemConsult(Consult: [DetailUser]) {
        self.feedItems = Consult
        self.filteredItems = Consult
        self.tableUsers.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.filteredItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellUser", for: indexPath) as! ConsultTableViewCell
        
        let item : DetailUser = self.filteredItems[indexPath.row]
        
        cell.lblName!.text = item.nombre! + " " + item.apellidoPaterno! + " " + item.apellidoMaterno!
        cell.lblEdad!.text = "\(item.edad!)"
        cell.lblMail!.text = item.email
        
        if item.datos?.imagen != nil{
            if let base64String = item.datos?.imagen, let imageData = Data(base64Encoded: base64String.replacingOccurrences(of: "data:image/jpeg;base64,", with: "")), let image = UIImage(data: imageData) {
                cell.imageSelfie.image = image
            }else{
                cell.imageSelfie.image = UIImage(named: "defaultImage")
            }
        }
        
    
        spinningActivity?.hide(true)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let item: DetailUser = self.filteredItems[indexPath.row]
        print(item.datos?.imagen ?? "")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filteredItems = self.feedItems.filter({ (item) -> Bool in
            if let nombre = item.nombre {
                return nombre.lowercased().contains(searchText.lowercased())
            }
            return false
        })
        self.tableUsers.reloadData()
    }
    
    public func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }

    public func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.searchBar.text = ""
        self.filteredItems = self.feedItems
        self.tableUsers.reloadData()
    }
    
    
}
