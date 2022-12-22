//
//  SettingsClientsProfileTableViewController.swift
//  Record
//
//  Created by Алешка on 29.10.22.
//

import UIKit

class SettingsClientsProfileTableViewController: UITableViewController {

    
    let idOptionsSheduleCell = "idOptionsSheduleCell"
    let idOptionsSheduleHeader = "idOptionsSheduleHeader"

    override func viewDidLoad() {
            super.viewDidLoad()
        
            tableView.delegate = self
            tableView.dataSource = self
            tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            tableView.separatorStyle = .singleLine //DELETE
            //tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
            tableView.register(SettingsClientsProfileTableViewCell.self, forCellReuseIdentifier: idOptionsSheduleCell)
       
        
            tableView.register(SmsNotificationViewHeader.self, forHeaderFooterViewReuseIdentifier: idOptionsSheduleHeader)
    }
    
    
        
    override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch section {
            case 0: return 7
            
            
            default:
                return 1
            }
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsSheduleCell, for: indexPath) as! SettingsClientsProfileTableViewCell
            cell.cellConfigure(indexPath: indexPath)
            
           return cell
            
        }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "idOptionsSheduleHeader") as! SmsNotificationViewHeader
        header.headerConfigure(section: section)
        return header
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        } else {
    return 44
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! SettingsClientsProfileTableViewCell
        
        switch indexPath {
            
        case [0,0]: alertPhotoCamera { [self] source in
            chooseImagePicker(source: source) }
        case [0,1]: alertForCellName(label: cell.nameUserLabel, name: "Имя", placeholder: "Введите имя") { text in
            print (text)
        }
        case [0,2]: alertForCellName(label: cell.surNameLabel, name: "Фамилия", placeholder: "Введите Фамилию") { text in
            print (text)
        }
        case [0,3]: alertTimeWatch(label: cell.dateLabel) { (date) in
            print (date)}
        case [0,4]: alertForCellName(label: cell.phoneUserLabel, name: "Номер телефона", placeholder: "Введите номер телефона") { text in
            print (text)
        }
        case [0,5]: alertForCellName(label: cell.nameUserLabel, name: "Instagram", placeholder: "Ссылка на Instagram") { text in
            print (text)
        }
        case [0,6]: alertForCellName(label: cell.surNameLabel, name: "Facebook", placeholder: "Ссылка на Facebook") { text in
            print (text)
        }
        
        default:
            print ("Error")
        }
           
        
    }
    
    
    @IBAction func addClients(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    }

extension SettingsClientsProfileTableViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func chooseImagePicker(source:UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let cell = tableView.cellForRow(at: [0,0]) as! SettingsClientsProfileTableViewCell
        
        cell.imageCell.image = info[.editedImage] as? UIImage
        cell.imageCell.contentMode = .scaleAspectFit
        cell.imageCell.clipsToBounds = true
        dismiss(animated: true)
    }
}

