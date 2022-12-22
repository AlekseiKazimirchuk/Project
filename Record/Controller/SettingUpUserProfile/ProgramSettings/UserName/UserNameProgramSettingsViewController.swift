//
//  UserNameProgramSettingsViewController.swift
//  Record
//
//  Created by Алешка on 4.09.22.
//

import UIKit

class UserNameProgramSettingsViewController: UITableViewController {
    
    let idOptionsSheduleCell = "idOptionsSheduleCell"
    let idOptionsSheduleHeader = "idOptionsSheduleHeader"

    override func viewDidLoad() {
            super.viewDidLoad()
        
            tableView.delegate = self
            tableView.dataSource = self
            tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            tableView.separatorStyle = .singleLine
        
            tableView.register(UserNameProgramSettingsTableViewCell.self, forCellReuseIdentifier: idOptionsSheduleCell)
        
            tableView.register(UserNameProgramSettingsHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: idOptionsSheduleHeader)
    }
        
    override func numberOfSections(in tableView: UITableView) -> Int {
            return 5
        }
    
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch section {
            case 0: return 1
            case 1: return 5
            case 2: return 1
            case 3: return 2
            case 4: return 1
            default:
                return 1
            }
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsSheduleCell, for: indexPath) as! UserNameProgramSettingsTableViewCell
            cell.cellConfigure(indexPath: indexPath)
            
           return cell
            
        }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "idOptionsSheduleHeader") as! UserNameProgramSettingsHeaderFooterView
        header.headerConfigure(section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 120
        } else if indexPath.section == 4{
         return 120
        } else {
    return 44
        
    }
}
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! UserNameProgramSettingsTableViewCell
        
        switch indexPath {
            
        case [0,0]: alertPhotoCamera { [self] source in
            chooseImagePicker(source: source) }
            
        case [1,0]: alertForCellName(label: cell.labelCell, name: "Имя", placeholder: "Введите имя") { text in
            print (text)
        }
            
        case [1,1]: alertForCellName(label: cell.labelCell, name: "Фамилия", placeholder: "Введите Фамилию") { text in
            print (text)
        }
            
        case [1,2]: alertTimeWatch(label: cell.labelCell) { (date) in
            print (date)}
            
        case [1,3]: alertForCellName(label: cell.labelCell, name: "Номер телефона", placeholder: "Введите номер телефона") { text in
            print (text)
        }
            
        case [1,4]: alertForCellName(label: cell.labelCell, name: "Email", placeholder: "Введите email") { text in
            print (text)
        }
            
        case [2,0]: alertForCellName(label: cell.labelCell, name: "Специализация", placeholder: "Введите специализацию") { text in
            print (text)
        }
            
        case [3,0]: alertForCellName(label: cell.labelCell, name: "Instagram", placeholder: "Введите ссылку на Instagram") { text in
            print (text)
        }
            
        case [3,1]: alertForCellName(label: cell.labelCell, name: "Facebook", placeholder: "Введите ссылку на Facebook") { text in
            print (text)
        }
            
        case [4,0]: alertForCellName(label: cell.labelCellTwo, name: "О себе", placeholder: "Расскажите о себе") { text in
            print (text)
        }
            
        default:
            print ("Error")
        }
           
    }
    
    @IBAction func readyAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    }

extension UserNameProgramSettingsViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
        
        let cell = tableView.cellForRow(at: [0,0]) as! UserNameProgramSettingsTableViewCell
        
        cell.imageCell.image = info[.editedImage] as? UIImage
        cell.imageCell.contentMode = .scaleAspectFit
        cell.imageCell.clipsToBounds = true
        dismiss(animated: true)
    }
}
