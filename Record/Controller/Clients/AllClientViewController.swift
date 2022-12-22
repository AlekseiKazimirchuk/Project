//
//  AllClientViewController.swift
//  Record
//
//  Created by Алешка on 13.07.22.
//

import UIKit
import RealmSwift

class AllClientViewController: UIViewController {
    
    
    let idCell = "Cell"
    
     let localRealm = try! Realm()
    
     var contactsArray: Results<ContactMode>!
    var filterArray: Results<ContactMode>!
    
    var search = UISearchController()
    
    var searchBarIsEmpty: Bool {
        guard let text = search.searchBar.text else {return true}
        return text.isEmpty
    }
    
    var isFiltring: Bool {
        return search.isActive && !searchBarIsEmpty
    }
    
    @IBOutlet weak var ClientTableView: UITableView!
    
    @IBOutlet weak var allClients: UIButton!
    
    @IBOutlet weak var newClients: UIButton!
    
    @IBOutlet weak var waitingList: UIButton!
    
    @IBOutlet weak var sleepingClietns: UIButton!
    
    @IBOutlet weak var birthdays: UIButton!
    
    @IBOutlet weak var blockedClients: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.ClientTableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
       ClientTableView.dataSource = self
       ClientTableView.delegate = self
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        search.searchBar.placeholder = "Поиск"
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
        search.obscuresBackgroundDuringPresentation = false
        
        // Button Shadow
        allClients.addShadow()
        newClients.addShadow()
        waitingList.addShadow()
        sleepingClietns.addShadow()
        birthdays.addShadow()
        blockedClients.addShadow()
        
        contactsArray = localRealm.objects(ContactMode.self)
       
       // ClientTableView.register(TwoTableViewCell.self, forCellReuseIdentifier: idCell)
        
}
 
    func pushController(vc:UITableViewController) {
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Назад"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
   
    @IBAction func addClient(_ sender: Any) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "AddNewClientsRecordSuperTableViewController") as! AddNewClientsRecordSuperTableViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
       
        
    }
    
    @objc private func editingModel (contactModel:ContactMode) {
        let contactOption = AddNewClientsRecordSuperTableViewController()
        contactOption.contactModel = contactModel
        contactOption.editBool = true
        //contactOption.tableView.separatorStyle = .none
        
        contactOption.cellNameArray = [
            "",
            contactModel.nameClients,
            contactModel.phoneClients,
            contactModel.instagramClients,
            contactModel.facebookClients
        ]
        contactOption.imageIsChanged = true
        navigationController?.pushViewController(contactOption, animated: true)
            
    }
    
    func addClient () {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddTableViewController") as! AddTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
     func fromContact () {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddTableViewController") as! AddTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func addGroup () {
       let vc = storyboard?.instantiateViewController(withIdentifier: "AddTableViewController") as! AddTableViewController
       self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension AllClientViewController: UITableViewDataSource, UITableViewDelegate {
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (isFiltring ? filterArray.count : contactsArray.count)
        //return contactsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ClientTableView.dequeueReusableCell(withIdentifier: idCell) as! TwoTableViewCell
        let model = (isFiltring ? filterArray[indexPath.row] : contactsArray[indexPath.row])
        //let model = contactsArray[indexPath.row]
        cell.configure(model:model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let editingRow = contactsArray[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { _, _, completionHandler in
            RealmManager.shared.deleteAddClientsModel(model: editingRow)
            self.ClientTableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = contactsArray[indexPath.row]
        editingModel(contactModel: model)
        
    }
    
}

extension AllClientViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    private func filterContentForSearchText (_ searchText: String){
        filterArray = contactsArray.filter("nameClients CONTAINS[c] %@", searchText)
       
        self.ClientTableView.reloadData()
    }
    
}

