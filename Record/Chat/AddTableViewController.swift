//
//  AddTableViewController.swift
//  Record
//
//  Created by Алешка on 13.07.22.
//

import UIKit
import BLTNBoard

class AddTableViewController: UITableViewController {

    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var surnameText: UITextField!
    
    @IBOutlet weak var phoneText: UITextField!
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var instagramText: UITextField!
    
    @IBOutlet weak var notesText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
    }
    @IBAction func closedButton(_ sender: Any) {
    }
    @IBAction func readyButton(_ sender: Any) {
    }
    @IBAction func addPhoto(_ sender: Any) {
    }
    
    }

