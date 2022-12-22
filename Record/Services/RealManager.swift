//
//  RealManager.swift
//  Record
//
//  Created by Алешка on 22.11.22.
//

import RealmSwift


class RealmManager {
    
    static let shared = RealmManager()
    
    private init () {}
    
    let realm = try! Realm()
    
    func  saveNewClientsModel(model: NewClientsModel){
        try! realm.write {
            realm.add(model)
        }
    }
    
    func  deleteNewClientsModel(model: NewClientsModel){
        try! realm.write {
            realm.delete(model)
        }
    }
    
    func  saveAddClientsModel(model: ContactMode){
        try! realm.write {
            realm.add(model)
        }
    }
    
    func  deleteAddClientsModel(model: ContactMode){
        try! realm.write {
            realm.delete(model)
        }
    }
    
    func  saveServicePriceCommentModel(model: ServicePriceCommentModel){
        try! realm.write {
            realm.add(model)
        }
    }
    
    func  deleteServicePriceCommentModell(model: ServicePriceCommentModel){
        try! realm.write {
            realm.delete(model)
        }
    }
    
    func  updateContactModel(model: ContactMode, nameArray: [String], imageData: Data?){
        try! realm.write {
            model.imageClients = imageData
            model.nameClients = nameArray[1]
            model.phoneClients = nameArray[2]
            model.instagramClients = nameArray[3]
            model.facebookClients = nameArray[4]
        }
    }
}
