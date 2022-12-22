//
//  NewClientsModel.swift
//  Record
//
//  Created by Алешка on 22.11.22.
//

import RealmSwift

class NewClientsModel: Object {
    @Persisted  var newNameClients: String = "Oskar Fly Fantasy"
    @Persisted  var titleService: String = "Haircut+beard"
    @Persisted  var priceService: String = ""
    @Persisted  var dateService: Date?
    @Persisted  var timeService: Date?
    @Persisted  var endTimeService: Date?
    @Persisted  var repeatDay: Bool = true
    @Persisted  var weekDay: Int = 1
    //@Persisted var status: String = ""
    //@Persisted var ownerId: String
}
