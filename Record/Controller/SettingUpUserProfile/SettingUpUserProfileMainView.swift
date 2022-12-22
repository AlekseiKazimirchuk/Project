//
//  TestUserSettingsViewController.swift
//  Record
//
//  Created by Алешка on 24.08.22.
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

struct SettingsSwitchOptions {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    //var button: UIButton
    //var isOn:Bool
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

class SettingUpUserProfileMainView: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var WeekendsClose: WeekendsProgramSettings!
    
    var models = [Section]()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(ServicesSettingsTableViewCell.self, forCellReuseIdentifier: "ServicesSettingsTableViewCell")
        tableView.register(DiscountsSettingsTableViewCell.self, forCellReuseIdentifier: "DiscountsSettingsTableViewCell")
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure ()
        title = "Настройки"
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.backgroundColor = .white
        
    }
    
    func configure () {
        models.append(Section(title: "Настройки профиля", options: [
            .switchCell(model: SettingsSwitchOptions(title: "Казмирчик Алексей", icon: UIImage(named: "2portrait"), iconBackgroundColor: .white ) {
                
                let vc = self.storyboard!.instantiateViewController(withIdentifier: "UserNameProgramSettingsViewController") as! UserNameProgramSettingsViewController
                self.present(vc, animated: true, completion: nil)
                
            })
            
            ]))
        
        models.append(Section(title: "Расписание", options: [
            .staticCell(model: SettingsOption(title: "Выходные", icon:UIImage(named: "calendar" ), iconBackgroundColor: .white) {
                
                let vc = self.storyboard!.instantiateViewController(withIdentifier: "WeekendsProgramSettings") as! WeekendsProgramSettings
                let navController = UINavigationController(rootViewController: vc)
                self.present(navController, animated: true, completion: nil)
               
            }),
            
            .staticCell(model: SettingsOption(title: "Место и график работы", icon: UIImage(named: "location"), iconBackgroundColor: .white) {
                
                let vc = self.storyboard!.instantiateViewController(withIdentifier: "PlaceAndWorkScheduleViewController") as! PlaceAndWorkScheduleViewController
                self.present(vc, animated: true, completion: nil)
            
            })
            ]))
        
        models.append(Section(title: "Услуги", options: [
            .staticCell(model: SettingsOption(title: "Услуги", icon:UIImage(named: "barber" ), iconBackgroundColor: .white) {
                
                let vc = self.storyboard!.instantiateViewController(withIdentifier: "ServicesProgramSettingsViewController") as! ServicesProgramSettingsViewController
                self.navigationController?.pushViewController(vc, animated: true)
                
            }),
            
            .staticCell(model: SettingsOption(title: "Скидки", icon: UIImage(named: "percent"), iconBackgroundColor: .white) {
                
                let vc = self.storyboard!.instantiateViewController(withIdentifier: "DiscountsProgramSettingsViewController") as! DiscountsProgramSettingsViewController
                self.present(vc, animated: true, completion: nil)
            
            })
            ]))
        
        models.append(Section(title: "Клиентская база", options: [
            .staticCell(model: SettingsOption(title: "Лист ожидания и сортировка", icon:UIImage(named: "layers" ), iconBackgroundColor: .white) {
                
                let vc = self.storyboard!.instantiateViewController(withIdentifier: "WaitingListAndSortingProgramSettingsViewController") as! WaitingListAndSortingProgramSettingsViewController
                self.present(vc, animated: true, completion: nil)
            }),
            
            .staticCell(model: SettingsOption(title: "Копировать в телефон", icon: UIImage(named: "phone"), iconBackgroundColor: .white) {
                
                let vc = self.storyboard!.instantiateViewController(withIdentifier: "CopyToPhoneProgramSettingsViewController") as! CopyToPhoneProgramSettingsViewController
                self.present(vc, animated: true, completion: nil)
            
            })
            ]))
        
        models.append(Section(title: "Уведомление", options: [
            .staticCell(model: SettingsOption(title: "SMS - уведомления", icon:UIImage(named: "messeges" ), iconBackgroundColor: .white) {
               
                let vc = self.storyboard!.instantiateViewController(withIdentifier: "SmsNotificationProgramSettingsViewController") as! SmsNotificationProgramSettingsViewController
                self.present(vc, animated: true, completion: nil)
            }),
            
            .staticCell(model: SettingsOption(title: "PUSH - уведомления", icon: UIImage(named: "comment"), iconBackgroundColor: .white) {
                
                let vc = self.storyboard!.instantiateViewController(withIdentifier: "PushNotificationProgramSettingsViewController") as! PushNotificationProgramSettingsViewController
                self.present(vc, animated: true, completion: nil)
            
            }),
            
            .staticCell(model: SettingsOption(title: "Email - оповещения", icon:UIImage(named: "email" ), iconBackgroundColor: .white) {
                
                let vc = self.storyboard!.instantiateViewController(withIdentifier: "EmailNotificationProgramSettingsViewController") as! EmailNotificationProgramSettingsViewController
                self.present(vc, animated: true, completion: nil)
            }),
            
            .staticCell(model: SettingsOption(title: "Синхронизация с календарем", icon: UIImage(named: "recycle"), iconBackgroundColor: .white) {
                
                let vc = self.storyboard!.instantiateViewController(withIdentifier: "CalendarSynchronizationProgramSettingsViewController") as! CalendarSynchronizationProgramSettingsViewController
                self.present(vc, animated: true, completion: nil)
            
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
             return 44
         }
         }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ServicesSettingsTableViewCell", for: indexPath) as? ServicesSettingsTableViewCell else {
                 return UITableViewCell()
             }
            
             cell.configure(with: model)
            
             return cell
            
        case .switchCell(let model):
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DiscountsSettingsTableViewCell", for: indexPath) as? DiscountsSettingsTableViewCell else {
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
