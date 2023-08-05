//
//  Car.swift
//  TestPodborAuto.SUI
//
//  Created by Igor on 04.08.2023.
//

import Foundation

struct Car: Identifiable  {
    var id: UUID
    var brand: String
    var model: String
    var mileage: Int
    var countOfOwners: Int
    var yearOfRelease: String
    var price: Int
    let imageName: String
}
