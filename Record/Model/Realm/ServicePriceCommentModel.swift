//
//  ServicePriceCommentModel.swift
//  Record
//
//  Created by Алешка on 10.12.22.
//

import RealmSwift

class ServicePriceCommentModel: Object {
    
    @Persisted  var haircat: String = ""
    @Persisted  var priceService: String = ""
    @Persisted  var comment: String = ""
    @Persisted  var haircatTest: Data!
    
   
}
