//
//  EditCarView.swift
//  TestPodborAuto.SUI
//
//  Created by Igor on 05.08.2023.
//

import SwiftUI
import RealmSwift

struct EditCarView: View {
    @Binding var car: Car
    @Binding var isEditing: Bool
    
    var carToedit: Car?
    @Environment(\.dismiss) private var dismiss
    
    
    @State private var mileageString: String
    @State private var countOfOwnersString: String
    @State private var priceString: String
    private let storageManager = StorageManager.shared
    
    init(car: Binding<Car>, isEditing: Binding<Bool>, carToedit: Car? = nil) {
        _car = car
        _isEditing = isEditing
        _mileageString = State(initialValue: String(car.wrappedValue.mileage))
        _countOfOwnersString = State(initialValue: String(car.wrappedValue.countOfOwners))
        _priceString = State(initialValue: String(car.wrappedValue.price))
    }
    var body: some View {
        ZStack {
            Color.blue.opacity(0.1)
                .ignoresSafeArea()
            VStack {
                Spacer()
                CarBrandField(title: "Марка: ", attribute: $car.brand)
                CarBrandField(title: "Модель: ", attribute: $car.model)
                CarBrandField(title: "Пробег: ", attribute: $car.mileage)
                CarBrandField(title: "Год выпуска:", attribute: $car.yearOfRelease)
                CarBrandField(title: "Цена: ", attribute: $car.price)
                CarBrandField(title: "Кол-во владельцев по ПТС:", attribute: $car.countOfOwners)
                
                Spacer()
                Button(
                    action: {
                        
                                dismiss()
                        
                    }
                ) {
                    Text("Сохранить")
                        .font(.title2)
                }
                
            }
            .padding()
        }
    }
    
    private func update() {
        if let car = carToedit {
            
            do {
                let realm = try Realm()
                guard let objectToUpdate = realm.object(ofType: Car.self, forPrimaryKey: car.id) else { return }
                try realm.write {
                    objectToUpdate.brand = car.brand
                    objectToUpdate.mileage = car.mileage
                    objectToUpdate.price = car.price
                    objectToUpdate.countOfOwners = car.countOfOwners
                    objectToUpdate.model = car.model
                    objectToUpdate.yearOfRelease = car.yearOfRelease
                    objectToUpdate.imageName = car.imageName
                }
            }
            catch {
                print(error)
            }
            
        }
    }

}

struct CarBrandField: View {
    let title: String
    @Binding var attribute: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .bold()
            TextField(title, text: $attribute)
                .font(.title2)
        }
    }
}

//struct EditCarView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditCarView(car: .constant(DataManager.shared.createTempData(completion: {
//            <#code#>
//        }). isEditing: .constant(true))
//    }
//}
