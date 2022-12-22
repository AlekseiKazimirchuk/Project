//
//  AddClientsModel.swift
//  Record
//
//  Created by Алешка on 26.11.22.
//

import RealmSwift

class ContactMode: Object {
    
    @Persisted  var nameClients: String = ""
    @Persisted  var phoneClients: String = ""
    @Persisted  var instagramClients: String = ""
    @Persisted  var facebookClients: String = ""
    @Persisted  var dateService: Date?
    @Persisted  var imageClients: Data?
    
}
