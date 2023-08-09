//
//  EditCarView.swift
//  TestPodborAuto.SUI
//
//  Created by Igor on 05.08.2023.
//

import SwiftUI
//import RealmSwift

struct EditCarView: View {
    @Binding var car: Car
    @Binding var isEditing: Bool
    
    @Environment(\.dismiss) private var dismiss
    
    init(car: Binding<Car>, isEditing: Binding<Bool>) {
        _car = car
        _isEditing = isEditing
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
                HStack {
                    Text("Цена")
                        .font(.title2)
                        .bold()
                    TextField("Цена", value: $car.price, formatter: NumberFormatter())
                        .font(.title2)
                }
                CarBrandField(title: "Кол-во владельцев по ПТС:", attribute: $car.countOfOwners)
                
                Spacer()
                Button(action: {
                    dismiss()
                } ) {
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

