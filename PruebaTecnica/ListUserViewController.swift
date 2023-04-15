//
//  ListUserViewController.swift
//  PruebaTecnica
//
//  Created by Rodrigo Sánchez on 15/04/23.
//
import UIKit

class ListUserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ConsultModelProtocol, UISearchBarDelegate {

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
        
            cell.lblName!.text = item.nombre
            cell.lblApePa!.text = item.apellidoPaterno
            cell.lblApeMa!.text = item.apellidoMaterno
       
        return cell
    }

    // MARK: - Search Bar

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filteredItems = self.feedItems.filter({ (item) -> Bool in
            if let nombre = item.nombre {
                return nombre.lowercased().contains(searchText.lowercased())
            }
            return false
        })
        self.tableUsers.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.text = ""
        self.filteredItems = self.feedItems
        self.tableUsers.reloadData()
    }


}
