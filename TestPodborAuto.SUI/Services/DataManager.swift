//
//  DataManager.swift
//  TestPodborAuto.SUI
//
//  Created by Igor on 07.08.2023.
//

import Foundation
import RealmSwift

final class DataManager: ObservableObject {
    static let shared = DataManager()
    private let storageManager = StorageManager.shared
    
    @Published var cars = []
    
    
    private init() {
        createTempData {
        }
    }
    
    
    func createTempData(completion: @escaping () -> Void) {
        if !UserDefaults.standard.bool(forKey: "done") {
            let cars: [Car] = [
                Car(value: [UUID(), "BMW", "X5", "180000", "3", "2014", "2100000", "bmwX5"]),
                Car(value: [UUID(),"BMW", "X3", "120000", "2", "2018", "3100000", "bmwX3"]),
                Car(value: [UUID(),"BMW", "5 Series", "210000", "5", "2014", "1910000", "bmw5"]),
                Car(value: [UUID(),"Mercedes-Benz", "S63", "87000", "1", "2019", "6800000", "mbS63"]),
                Car(value: [UUID(),"Mercedes-Benz","E200", "215000", "3", "2012", "1730000", "mbE200"]),
                Car(value: [UUID(),"Mercedes-Benz", "C180", "130000", "1", "2016", "2300000", "mbC180"]),
                Car(value: [UUID(),"Toyota", "Camry", "350000", "5", "2008", "1100000", "tCamry"]),
                Car(value: [UUID(),"Toyota", "Corolla", "183000", "3", "2015", "1700000", "tCorolla"]),
                Car(value: [UUID(),"Toyota", "Land Cruiser 200", "73000", "1", "2020", "7100000", "tLC"])
            ]
            
            DispatchQueue.main.async { [unowned self] in
                storageManager.save(cars)
                UserDefaults.standard.set(true, forKey: "done")
                completion()
            }
        }
    }
}
    

