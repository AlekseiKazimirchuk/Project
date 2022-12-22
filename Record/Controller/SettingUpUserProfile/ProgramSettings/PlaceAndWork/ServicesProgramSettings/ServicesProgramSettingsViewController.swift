//
//  ServicesProgramSettingsViewController.swift
//  Record
//
//  Created by Алешка on 2.09.22.
//

import UIKit
import RealmSwift

class ServicesProgramSettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let localRealm = try! Realm()
    var servicePriceCommentArray: Results<ServicePriceCommentModel>!
    
    var cellNameServiceArray = ["Название услгуи","Стоймость","Комментарий"]
 
         let idOptionsSheduleCell = "idOptionsSheduleCell"
         let idOptionsSheduleHeader = "idOptionsSheduleHeader"
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         self.tableView.reloadData()
    }
        
    override func viewDidLoad() {
                super.viewDidLoad()
            
         title = "Услуги"
        
        
         tableView.delegate = self
         tableView.dataSource = self
         tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
         tableView.separatorStyle = .none //DELETE
            
         tableView.register(ServicesProgramSettingsTableViewCell.self, forCellReuseIdentifier: idOptionsSheduleCell)
                
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(addService))
        //(title: "Добавить услугу",style: .done, target: self, action: #selector(addService))
            
         servicePriceCommentArray = localRealm.objects(ServicePriceCommentModel.self)
                
        }
    
         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             
         return servicePriceCommentArray.count
     }
   
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsSheduleCell, for: indexPath) as! ServicesProgramSettingsTableViewCell
        
        let model = servicePriceCommentArray[indexPath.row]
        
         cell.configure(model: model)
         
        return cell
                
            }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
             return 60
            
         }
    
    private func setService (service: String, servicePrice: String) {
        let scheduleOptions = self.navigationController?.viewControllers[1] as? NewClientsRecordTableViewController
        scheduleOptions?.newClientsModel.titleService = service
        scheduleOptions?.newClientsModel.priceService = servicePrice
        scheduleOptions?.cellNameArray[1] = service
        scheduleOptions?.cellNameArray[2] = servicePrice
        scheduleOptions?.tableView.reloadRows(at:[[1,0]],with:.none)
        scheduleOptions?.tableView.reloadRows(at:[[2,0]],with:.none)
        self.navigationController?.popViewController(animated: true)
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let model = servicePriceCommentArray[indexPath.row]
         setService (service: model.haircat, servicePrice: model.priceService)
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let editingRow = servicePriceCommentArray[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { _, _, completionHandler in
            RealmManager.shared.deleteServicePriceCommentModell(model: editingRow)
            self.tableView.reloadData()
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    @objc func addService() {
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "AddServiceTableViewController") as! AddServiceTableViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
