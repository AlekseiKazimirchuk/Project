//
//  UserTableViewController.swift
//  Record
//
//  Created by Алешка on 10.08.22.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingsOptionType]
}
enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOptions)
}
//DELETE
struct SettingsSwitchOptions {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

class UserSettingsViewTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(UserSettingTableViewCell.self, forCellReuseIdentifier: "UserSettingTableViewCell")
        tableView.register(CopyToPhoneTableViewCell.self, forCellReuseIdentifier: "CopyToPhoneTableViewCell")
        
        return tableView
    }()
    
    var models = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure ()
        title = "Настройки"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        //tableView.backgroundColor = .white
        
    }
    
    func configure () {
        models.append(Section(title: "Настройки профиля", options: [
            .switchCell(model: SettingsSwitchOptions(title: "Казмирчик Алексей", icon: UIImage(systemName: "2portrait"), iconBackgroundColor: .white) {
            })),
            
            ]))
        
        models.append(Section(title: "Расписание", options: [
            .staticCell(model: SettingsOption(title: "Выходные", icon:UIImage(systemName: "wallet" ), iconBackgroundColor: .blue) {
                print("Hello Word")
            }),
            .staticCell(model: SettingsOption(title: "Место и график работы", icon: UIImage(systemName: "wallet"), iconBackgroundColor: .systemPink) {
                
            
            })
            ]))
        
        models.append(Section(title: "Услуги", options: [
            .staticCell(model: SettingsOption(title: "Услуги", icon:UIImage(systemName: "wallet" ), iconBackgroundColor: .blue) {
                print("Hello Word")
            }),
            .staticCell(model: SettingsOption(title: "Скидки", icon: UIImage(systemName: "wallet"), iconBackgroundColor: .systemPink) {
                
            
            })
            ]))
        
        models.append(Section(title: "Клиентская база", options: [
            .staticCell(model: SettingsOption(title: "Лист ожидания и сортировка", icon:UIImage(systemName: "wallet" ), iconBackgroundColor: .blue) {
                print("Hello Word")
            }),
            .staticCell(model: SettingsOption(title: "Копировать в телефон", icon: UIImage(systemName: "wallet"), iconBackgroundColor: .systemPink) {
                
            
            })
            ]))
        
        models.append(Section(title: "Уведомление", options: [
            .staticCell(model: SettingsOption(title: "SMS - уведомления", icon:UIImage(systemName: "wallet" ), iconBackgroundColor: .blue) {
                print("Hello Word")
            }),
            .staticCell(model: SettingsOption(title: "PUSH - уведомления", icon: UIImage(systemName: "wallet"), iconBackgroundColor: .systemPink) {
                
            
            }),
            .staticCell(model: SettingsOption(title: "Email - оповещения", icon:UIImage(systemName: "wallet" ), iconBackgroundColor: .blue) {
                print("Hello Word")
            }),
            .staticCell(model: SettingsOption(title: "Синхронизация с календарем", icon: UIImage(systemName: "wallet"), iconBackgroundColor: .systemPink) {
                
            
            })
            ]))
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         
         if indexPath.section == 0 {
             return 70
         } else {
             return 45
         }
         }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserSettingTableViewCell", for: indexPath) as? UserSettingTableViewCell else {
                 return UITableViewCell()
             }
            
             cell.configure(with: model)
            
             return cell
        case .staticCell(let model):
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CopyToPhoneTableViewCell", for: indexPath) as? CopyToPhoneTableViewCell else {
                 return UITableViewCell()
             }
             cell.configure(with: model)
            
             return cell
            
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
    }
    
    

    
    

}
