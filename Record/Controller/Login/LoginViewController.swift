//
//  LoginViewController.swift
//  Record
//
//  Created by Алешка on 24.04.22.
//

import UIKit
import GoogleSignIn
import Firebase

protocol LoginViewControllerDelegate {
    func openRegVC ()
    func openAuthVC ()
    func startApp ()
    func closeVC ()
        
    
}

class LoginViewController: UIViewController  {
    
    var collectionView: UICollectionView!
    let slidesSlider = SlidesModel()
    var authVC: AuthViewController!
    var regVC: RegViewController!
    var slides: [Slides] = []
    
    //let signInConfig = GIDConfiguration(clientID: "319988760654-ur4j3f13dd3s5e4572eb03ibkurf9jgg.apps.googleusercontent.com")
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configCollectionView()
        slides = slidesSlider.getSlides()
        
        
    }
    
    
    
    func configCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .gray
        collectionView.isPagingEnabled = true
        
        self.view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: SlideCollectionViewCell.reuceId, bundle: nil), forCellWithReuseIdentifier: SlideCollectionViewCell.reuceId)
    
    }

    }

extension LoginViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlideCollectionViewCell.reuceId, for: indexPath) as! SlideCollectionViewCell
        cell.delegate = self
        let slide = slides[indexPath.row]
        cell.configure(slide: slide)
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    
}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.view.frame.size
    }
}

extension LoginViewController: LoginViewControllerDelegate {
  
    func openAuthVC() {
        if authVC == nil {
            authVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AuthViewController") as! AuthViewController?
            
        }
     
        authVC.delegate = self
        self.view.insertSubview(authVC.view, at: 1)
    }
    
    func openRegVC() {
        if regVC == nil {
            regVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegViewController") as! RegViewController?
        }
         
        regVC.delegate = self
        self.view.insertSubview(regVC.view, at: 1)
    }
    
    func closeVC() {
        if authVC != nil {
            authVC.view.removeFromSuperview()
            authVC = nil
        }
        if regVC != nil {
            regVC.view.removeFromSuperview()
            regVC = nil
            
        }
        
        
    }
    func startApp() {
        let startVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "AppViewController")
        self.view.insertSubview(startVC.view, at: 2)
    }
    //LoginViewController
    
}

