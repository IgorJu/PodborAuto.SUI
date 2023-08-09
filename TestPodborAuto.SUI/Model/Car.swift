//
//  Car.swift
//  TestPodborAuto.SUI
//
//  Created by Igor on 04.08.2023.
//

import Foundation
import RealmSwift

final class Car: Object, Identifiable  {
    @Persisted var id = UUID()
    @Persisted var brand: String
    @Persisted var model: String
    @Persisted var mileage: String
    @Persisted var countOfOwners: String
    @Persisted var yearOfRelease: String
    @Persisted var price: Int
    @Persisted var imageName: String
    var fullName: String {
        brand + model
    }
    
    override class func primaryKey() -> String? {
             return "id"
         }
}
