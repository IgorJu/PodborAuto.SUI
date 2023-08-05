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
                HStack {
                    Text("Марка:")
                        .font(.title2)
                        .bold()
                    TextField("Марка", text: $car.brand)
                        .font(.title2)
                }
                HStack {
                    Text("Модель:")
                        .font(.title2)
                        .bold()
                    TextField("Модель", text: $car.model)
                        .font(.title2)
                }
                HStack {
                    Text("Пробег:")
                        .font(.title2)
                        .bold()
                    TextField("Пробег", text: $mileageString)
                        .font(.title2)
                }
                HStack {
                    Text("Год выпуска:")
                        .font(.title2)
                        .bold()
                    TextField("Год выпуска", text: $car.yearOfRelease)
                        .font(.title2)
                }
                HStack {
                    Text("Цена:")
                        .font(.title2)
                        .bold()
                    TextField("Цена", text: $priceString)
                        .font(.title2)
                }
                HStack {
                    Text("Кол-во владельцев по ПТС:")
                        .bold()
                        .font(.title2)
                        .frame(width: 295, alignment: .leading)
                    TextField("Кол-во владельцев", text: $countOfOwnersString)
                        .font(.title2)
                }
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

    


struct EditCarView_Previews: PreviewProvider {
    static var previews: some View {
        EditCarView(car: .constant(DataStore().cars.first!), isEditing: .constant(true))
    }
}
