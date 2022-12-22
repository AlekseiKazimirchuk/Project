//
//  RegViewController.swift
//  Record
//
//  Created by Алешка on 7.05.22.
//

import UIKit
import GoogleSignIn
import Firebase
import FirebaseAuth

class RegViewController: UIViewController {
    
    var delegate: LoginViewControllerDelegate!
    var checkField = CheckField.shared
    var service = Service.shared
    let signInConfig = GIDConfiguration(clientID: "319988760654-ur4j3f13dd3s5e4572eb03ibkurf9jgg.apps.googleusercontent.com")
    
    @IBOutlet weak var mainView: UIView!
    
    var tapGest: UITapGestureRecognizer?
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var rePasswordView: UIView!
    @IBOutlet weak var rePasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGest = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        mainView.addGestureRecognizer(tapGest!)
        
    }
    
    @IBAction func googleBtn(_ sender: Any) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { user, error in
            guard error == nil else { return }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { [weak self] authResult, error in
                print(authResult, error)
                print("smth")
            }
        }
        
    }
    @IBAction func closeRegVC(_ sender: Any) {
        delegate.closeVC()
    }
    
    @objc func endEditing () {
        self.view.endEditing(true)
    }
    @IBAction func regBtnClick(_ sender: Any) {
        if checkField.validField(emailView, emailField),
           checkField.validField(passwordView, passwordField) {
            
            if passwordField.text == rePasswordField.text {
                
                service.createnewUser(LoginField(email: emailField.text!, password: passwordField.text!)) { [weak self] code in
                    switch code.code {
                    case 0:
                        print("Произошла ошибка в регистрации")
                    case 1:
                        self?.service.confrimEmail()
                        let alert = UIAlertController(title: "Вы", message: "зарегестрировались", preferredStyle: .alert)
                        let okBtn = UIAlertAction(title: "Ok", style: .default) { _ in
                            self?.delegate.closeVC()
                        }
                        alert.addAction(okBtn)
                        self?.present(alert, animated: true)
                    default:
                        print("Неизвестная ошибка")
                    }
                }
                
            } else {
                print ("пароли не совпадают")
            }
            
        }
    }
    
    
}


