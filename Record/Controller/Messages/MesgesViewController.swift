//
//  MessagesViewController.swift
//  Record
//
//  Created by Алешка on 26.07.22.
//

import UIKit
import BLTNBoard

class MesgesViewController: UIViewController {

    private lazy var boardManager: BLTNItemManager = {
        
        let item = BLTNPageItem(title: " ")
        item.actionButtonTitle = "Новое сообщение"
        item.actionButtonTitle2 = "Гпупповая рассылка"
        
        item.appearance.actionButtonColor = #colorLiteral(red: 0.4274509804, green: 0.462745098, blue: 0.5411764706, alpha: 1)
        item.appearance.actionButtonTitleColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
        item.actionHandler = { _ in
            self.newMessage()
        }
        item.actionHandler = { _ in
            self.groupMailing()
        }
       
        
        return BLTNItemManager(rootItem: item)
    }()
    
    
    
    
    
let idCell = "Cell"
    
  
    @IBOutlet weak var tableView: UITableView!
    
  
    
    @IBOutlet weak var dotsBar: UIBarButtonItem!
    
    @IBOutlet weak var editBar: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.dataSource = self
       tableView.delegate = self
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
        
        
        
        // Button Shadow
        
        
        
      
        
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
   
    @IBAction func editAction(_ sender: Any) {
        boardManager.showBulletin(above: self)
        //let vc = storyboard?.instantiateViewController(withIdentifier: "AddTableViewController") as! AddTableViewController
        //self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func newMessage () {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddTableViewController") as! AddTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
     func groupMailing () {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddTableViewController") as! AddTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let swipeDelete = UIContextualAction(style: .normal, title: " Удалить") { (action, view, success) in
            print ("Delete")
        }
        swipeDelete.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        swipeDelete.image = UIImage(named: "swipeDelete")
        return UISwipeActionsConfiguration(actions: [swipeDelete])
    }
    
}
extension MesgesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as! MessagesTableViewCell
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95.0
    }
    
}

extension MesgesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print (searchController.searchBar.text)
    }
    
    
}
