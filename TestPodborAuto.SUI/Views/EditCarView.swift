//
//  EditCarView.swift
//  TestPodborAuto.SUI
//
//  Created by Igor on 05.08.2023.
//

import SwiftUI

struct EditCarView: View {
    @Binding var car: Car
    @Binding var isEditing: Bool
    
    @State private var mileageString: String
    @State private var countOfOwnersString: String
    @State private var priceString: String
    
    init(car: Binding<Car>, isEditing: Binding<Bool>) {
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
                CarBrandField(title: "Пробег: ", attribute: $mileageString)
                CarBrandField(title: "Год выпуска:", attribute: $car.yearOfRelease)
                CarBrandField(title: "Цена: ", attribute: $priceString)
                CarBrandField(title: "Кол-во владельцев по ПТС:", attribute: $countOfOwnersString)
                
                Spacer()
                Button(
                    action: {
                        car.mileage = Int(mileageString) ?? 0
                        car.countOfOwners = Int(countOfOwnersString) ?? 0
                        car.price = Int(priceString) ?? 0
                        isEditing.toggle()
                    }
                ) {
                    Text("Сохранить")
                        .font(.title2)
                }
                
            }
            .padding()
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

struct EditCarView_Previews: PreviewProvider {
    static var previews: some View {
        EditCarView(car: .constant(DataStore().cars.first!), isEditing: .constant(true))
    }
}
