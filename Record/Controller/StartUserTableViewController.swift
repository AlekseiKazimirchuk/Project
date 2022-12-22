//
//  StartUserTableViewController.swift
//  Record
//
//  Created by Алешка on 15.08.22.
//

import UIKit

class StartUserTableViewController: UITableViewController {
    
    var sectionTitles = ["Профиль", "Расписание","Услуги", "Клиентская база","Уведомления", "Язык и регион", "О нас"]
    var sectionContent = [["Казимирчик Алексей"],["Выходные","Место и график работы"],["Услуги","Скидки"],["Лист ожидания и сортировки","Копировать в телефон"],["SMS-уведомления","PUSH-уведомления","E-mail оповещения","Синхронизация с календарем"],["Язык","Регион"],["О нас","Пользователское соглашение","Помощь"]]
        
    override func viewDidLoad() {
        super.viewDidLoad()

          tableView.delegate = self
        tableView.dataSource = self
        
        // remove bottom blank cells in the table view
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        //iPad Layout: adds blank space to the left and right of the table view
        tableView.cellLayoutMarginsFollowReadableWidth = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
              case 0:
                  return sectionContent[0].count      // section 0 is the 1st/Top section 'Setup'
              case 1:
                  return sectionContent[1].count      // section 1 is the 2nd section 'Support'
      //        case 2:
      //            return sectionContent[2].count      // section 2 is the 3rd section 'Socially Yours'
              default:
                  return sectionContent[0].count
              }
          }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
              
          return sectionTitles[section]  // section 0 is the 1st section
      }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
            // Configure the cell...array of content within array of headers
            cell.textLabel?.text = sectionContent[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
    switch (indexPath as NSIndexPath).section {
                
    case 0: // Section 0 Setup
        switch (indexPath as NSIndexPath).row {
        case 0:
           performSegue(withIdentifier: "showCloud", sender: self)
        case 1:
           performSegue(withIdentifier: "showDataIntegrityReset", sender: self)
        default:
        print(#function, "Error in Switch")
        } // end case section 0 switch
                
    case 1: // section 1 Support
    switch (indexPath as NSIndexPath).row {
    case 0:
          performSegue(withIdentifier: "showAppInfo", sender: self)
    case 1:
          performSegue(withIdentifier: "showCredits", sender: self)
    case 2:
          performSegue(withIdentifier: "showPrivacy", sender: self)
    case 3:
          performSegue(withIdentifier: "showBlog", sender: self)
    default:
          performSegue(withIdentifier: "showAppInfo", sender: self)
    }
                
    default: break
    } // end case section 1switch
            
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    switch segue.identifier {
        
    case "showCloud":
    let SettingsUserProfileViewController = segue.destination as! SettingsUserProfileViewController
        SettingsUserProfileViewController.title = "AppsGym Books Info"
        
    case "showDataIntegrityReset":
    let WeekendsSettingsViewController = segue.destination as! WeekendsSettingsViewController
        WeekendsSettingsViewController.title = "AppsGym Books Info"
      
    case "showAppInfo":
    let PlaceAndWorkScheduleViewController = segue.destination as! PlaceAndWorkScheduleViewController
        PlaceAndWorkScheduleViewController.title = "AppsGym Books Info"
      
    /*case "showCredits":
    _ = segue.destination as! CreditsViewController
    case "showPrivacy":
    _ = segue.destination as! PrivacyViewController
    case "showBlog":
    _ = segue.destination as! BlogViewController*/
    default:
    _ = segue.destination as! StartUserTableViewController
    }
    
    }
}

   
    



