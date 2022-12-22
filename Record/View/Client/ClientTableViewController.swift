//
//  ClientTableViewController.swift
//  Record
//
//  Created by Алешка on 7.06.22.
//

import UIKit

/*class ClientTableViewController: UIViewController {
    
    @IBOutlet var clientTableView: UITableView!
    let dataSource = ["Петя Петров"]
    let numberData = [+375447806668,+375336884711]//delete
    var image = UIImage(named: "2portrait") //delete
    
    let service = Service.shared
    var users = [String] ()
    // var names = [String] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.register(UINib(nibName: "ClientCellTableViewCell", bundle: nil), forCellReuseIdentifier: ClientCellTableViewCell.reuseId)
        
       // tableView.register(UINib(nibName: "PeopleTableViewCell", bundle: nil), forCellReuseIdentifier: idCell) // delete
        
       // tableView.dataSource = self
       // tableView.delegate = self
       // tableView.separatorStyle = .singleLine
        
        //getUsers ()
        
    }
  /*  func getUsers (){
        service.getAllUsers { users in
            self.users = users
            self.tableView.reloadData()
        }
    }*/
    
    

 
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return users.count
       return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let twoCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TwoTableViewCell
        cell.name
        twoCell.nameLabel.text = dataSource[indexPath.row]
        /*cell.selectionStyle = .none
        let cellname = users[indexPath.row]
        cell.congigCell(cellname)*/
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! PeopleTableViewCell
       // cell.nameLabel.text = "Иванов Иван"
        //cell.phoneNumberLabel.text = "+375447806668"
        
        
        return twoCell
    }
    /*func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print ("\(indexPath.row)")
    }*/
    
    

}*/
