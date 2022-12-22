//
//  AddNewClientsRecordTableViewController.swift
//  Record
//
//  Created by Алешка on 26.11.22.
//

import UIKit
import RealmSwift

class AddNewClientsRecordSuperTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let idOptionsSheduleCell = "idOptionsSheduleCell"
    let idOptionsSheduleHeader = "idOptionsSheduleHeader"
    var cellNameArray = ["","Имя","Номер телефона","Instagram","Facebook"]
    
     var imageIsChanged = false
    //let localRealm = try! Realm()
    
     var contactModel = ContactMode()
     var editBool = false
     var dataImage: Data?
    
   private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)

        return tableView
    }()
      
   override func viewDidLoad() {
            super.viewDidLoad()
        
        title = "Новый клиент"
        view.addSubview(tableView)
        tableView.frame = view.bounds
        //tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .white
        tableView.bounces = false
        tableView.delegate = self
        tableView.dataSource = self
       
    tableView.register(AddNewClientsRecordSuperTableViewCell.self, forCellReuseIdentifier: idOptionsSheduleCell)
        
    tableView.register(AddNewClientsRecordSuperHeader.self, forHeaderFooterViewReuseIdentifier: idOptionsSheduleHeader)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Готово",style: .plain, target: self, action: #selector(saveButton))
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
            return 5
        }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
           return 1
           
        }
        
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
      let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsSheduleCell, for: indexPath) as! AddNewClientsRecordSuperTableViewCell
            
      if editBool == false {
        
        cell.cellConfigure(nameArray:cellNameArray,indexPath: indexPath, image: nil)
    } else if let data = contactModel.imageClients, let image = UIImage(data: data) {
                cell.cellConfigure(nameArray: cellNameArray, indexPath: indexPath, image: image)
    } else {
        cell.cellConfigure(nameArray: cellNameArray, indexPath: indexPath, image: nil)
           
    }
            return cell
            
        }
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "idOptionsSheduleHeader") as! AddNewClientsRecordSuperHeader
        header.headerConfigure(section: section)
        return header
    }
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 80
        } else {
    return 44
        }
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! AddNewClientsRecordSuperTableViewCell
        
        switch indexPath {
            
        case [0,0]: alertPhotoCamera { [self] source in
            chooseImagePicker(source: source) }
            
        case [1,0]: alertForCellName(label: cell.nameUserLabel, name: "Имя", placeholder: "Введите имя") { text in
            self.cellNameArray[1] = text
        }
        
      case [2,0]: alertForCellName(label: cell.nameUserLabel, name: "Номер телефона", placeholder: "Введите номер телефона") { text in
            self.cellNameArray[2] = text
            
        }
            
        case [3,0]: alertForCellName(label: cell.nameUserLabel, name: "Instagram", placeholder: "Ссылка на Instagram") { text in
            self.cellNameArray[3] = text
        }
            
        case [4,0]: alertForCellName(label: cell.nameUserLabel, name: "Facebook", placeholder: "Ссылка на Facebook") { text in
            self.cellNameArray[4] = text
        }
        
        default:
            print ("Error")
        }
           
    }
    
    @objc func saveButton (){
        if cellNameArray[1] == "Имя" || cellNameArray[2] == "Номер телефона" {
            alertOk(title: "Ошибка", message: "Имя и Номерт телефона обязательны для заполнения")
        } else if editBool == false {
            setImageModel()
            setModel()
            
            RealmManager.shared.saveAddClientsModel(model: contactModel)
            contactModel = ContactMode()
            self.navigationController?.popViewController(animated: true)
            //dismiss(animated: true)
            //tableView.reloadData()
        } else {
            setImageModel()
            RealmManager.shared.updateContactModel(model: contactModel, nameArray: cellNameArray, imageData: dataImage)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func setModel () {
        contactModel.imageClients = dataImage
        contactModel.nameClients = cellNameArray[1]
        contactModel.phoneClients = cellNameArray[2]
        contactModel.instagramClients = cellNameArray[3]
        contactModel.facebookClients = cellNameArray[4]
    }
    @objc private func setImageModel() {
        
        if imageIsChanged {
            let cell = tableView.cellForRow(at: [0,0]) as! AddNewClientsRecordSuperTableViewCell
            let image = cell.imageCell.image
            guard let imageData = image?.pngData() else {return}
            dataImage = imageData
            
            cell.imageCell.contentMode = .scaleAspectFit
            imageIsChanged = false
        } else {
            dataImage = nil
        }
    }
}

extension AddNewClientsRecordSuperTableViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
        
        let cell = tableView.cellForRow(at: [0,0]) as! AddNewClientsRecordSuperTableViewCell
        
        cell.imageCell.image = info[.editedImage] as? UIImage
        cell.imageCell.contentMode = .scaleAspectFit
        cell.imageCell.clipsToBounds = true
        imageIsChanged = true
        dismiss(animated: true)
    }
}
