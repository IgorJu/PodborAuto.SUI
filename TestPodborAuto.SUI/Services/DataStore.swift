//
//  DataStorage.swift
//  TestPodborAuto.SUI
//
//  Created by Igor on 04.08.2023.
//

import SwiftUI

final class DataStore {
    @Published var cars = [
        Car(
            id: UUID(),
            brand: "BMW",
            model: "X5",
            mileage: 180000,
            countOfOwners: 3,
            yearOfRelease: "2014",
            price: 2100_000,
            imageName: "bmwX5"
        ),
        Car(
            id: UUID(),
            brand: "BMW",
            model: "X3",
            mileage: 120000,
            countOfOwners: 2,
            yearOfRelease: "2018",
            price: 3100_000,
            imageName: "bmwX3"
           ),
        Car(
            id: UUID(),
            brand: "BMW",
            model: "5 Series",
            mileage: 210000,
            countOfOwners: 5,
            yearOfRelease: "2014",
            price: 1910_000,
            imageName: "bmw5"
           ),
        Car(
            id: UUID(),
            brand: "Mercedes-Benz",
            model: "E200",
            mileage: 215000,
            countOfOwners: 3,
            yearOfRelease: "2012",
            price: 1730_000,
            imageName: "mbE200"
           ),
        Car(
            id: UUID(),
            brand: "Mercedes-Benz",
            model: "C180",
            mileage: 130000,
            countOfOwners: 1,
            yearOfRelease: "2016",
            price: 2300_000,
            imageName: "mbC180"
           ),
        Car(
            id: UUID(),
            brand: "Mercedes-Benz",
            model: "S63",
            mileage: 87000,
            countOfOwners: 1,
            yearOfRelease: "2019",
            price: 6800_000,
            imageName: "mbS63"
           ),
        Car(
            id: UUID(),
            brand: "Toyota",
            model: "Camry",
            mileage: 350000,
            countOfOwners: 5,
            yearOfRelease: "2008",
            price: 1100_000,
            imageName: "tCamry"
           ),
        Car(
            id: UUID(),
            brand: "Toyota",
            model: "Corolla",
            mileage: 183000,
            countOfOwners: 3,
            yearOfRelease: "2015",
            price: 1700_000,
            imageName: "tCorolla"
           ),
        Car(
            id: UUID(),
            brand: "Toyota",
            model: "Land Cruiser 200",
            mileage: 73000,
            countOfOwners: 1,
            yearOfRelease: "2020",
            price: 7100_000,
            imageName: "tLC"
           )
        ]
}
