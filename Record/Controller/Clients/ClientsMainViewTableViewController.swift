//
//  ClientsMainViewTableViewController.swift
//  Record
//
//  Created by Алешка on 18.10.22.
//

import UIKit
import RealmSwift

class ClientsMainViewTableViewController: UITableViewController{
    
    let clientsId = "clientsId"
    let arrayName = ["Push"]
    
    let localRealm = try! Realm()
    var contactsArray: Results<ContactMode>!
    
    //var model = ContactMode()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Клиенты"
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        //tableView.separatorStyle = .singleLine //DELETE
        //tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        tableView.register(ClientMainViewTableViewCell.self, forCellReuseIdentifier: clientsId)
        
        contactsArray = localRealm.objects(ContactMode.self)//.filter("nameClients = 'Nastya'")
        
       
        //print (contactsArray)
    }
    
    private func setClients (clients: String) {
        let scheduleOptions = self.navigationController?.viewControllers[1] as? NewClientsRecordTableViewController
        scheduleOptions?.newClientsModel.newNameClients = clients
        scheduleOptions?.cellNameArray[0] = clients
        scheduleOptions?.tableView.reloadRows(at:[[0,0]],with:.automatic)
        self.navigationController?.popViewController(animated: true)
    }
    
    /*override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }*/
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: clientsId, for: indexPath) as! ClientMainViewTableViewCell
        let model = contactsArray[indexPath.row]
        cell.configure(model:model)
        
        cell.imageUserCell.clipsToBounds = true
        //cell.imageUserCell.layer.masksToBounds = true
        cell.imageUserCell.contentMode = .scaleAspectFit
        cell.imageUserCell.layer.cornerRadius = 15
        
        return cell
        
    }
  
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let model = contactsArray[indexPath.row]
        setClients (clients: model.nameClients)
        
        
    }
    
  }
    
    
    
