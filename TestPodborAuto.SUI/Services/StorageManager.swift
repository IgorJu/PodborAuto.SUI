//
//  StorageManager.swift
//  TestPodborAuto.SUI
//
//  Created by Igor on 07.08.2023.
//

import Foundation
import RealmSwift

final class StorageManager {
    static let shared = StorageManager()
    
    let realm: Realm
    
    private init() {
        do {
            realm = try Realm()
            print("Realm is located at:", realm.configuration.fileURL!)
        } catch {
            fatalError("Failed to initialize Realm: \(error)")
        }
    }
    
//MARK: - crud
    func save(_ cars: [Car]) {
        write {
            realm.add(cars)
        }
    }

    func save(_ car: Car) {
        write {
            realm.add(car)
        }
    }
    
    func getAllCars() -> Results<Car> {
           return realm.objects(Car.self)
       }
    
    func updateCar(_ car: Car) {
            do {
                try realm.write {
                    realm.add(car, update: .modified) // Используем метод add с update: .modified для обновления машины
                }
            } catch {
                print("Error updating car: \(error)")
            }
        }
            
    func delete(_ car: Car) {
        write {
            realm.delete(car)
        }
    }
    

    private func write(completion: () -> Void) {
        do {
            try realm.write {
                completion()
            }
        } catch {
            print(error)
        }
    }
}
