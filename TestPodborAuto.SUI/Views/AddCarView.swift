//
//  AddCarView.swift
//  TestPodborAuto.SUI
//
//  Created by Igor on 04.08.2023.
//

import SwiftUI

struct AddCarView: View {
    @Binding var car: Car?
    
    @State private var brand: String
    @State private var model: String
    @State private var mileage: String
    @State private var yearOfRelease: String
    @State private var countOfOwners: String
    @State private var price: String
    
    var onComplete: (Car) -> Void
    
    init(car: Binding<Car?>, onComplete: @escaping (Car) -> Void) {
        _car = car
        _brand = State(initialValue: car.wrappedValue?.brand ?? "")
        _model = State(initialValue: car.wrappedValue?.model ?? "")
        _mileage = State(initialValue: car.wrappedValue?.mileage.formatted() ?? "")
        _yearOfRelease = State(initialValue: car.wrappedValue?.yearOfRelease ?? "")
        _countOfOwners = State(initialValue: car.wrappedValue?.countOfOwners.formatted() ?? "")
        _price = State(initialValue: car.wrappedValue?.price.formatted() ?? "")
        self.onComplete = onComplete
    }
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.1)
                .ignoresSafeArea()
            VStack {
                Spacer()
                TextField("Марка", text: $brand)
                TextField("Модель", text: $model)
                TextField("Пробег", text: $mileage)
                    .keyboardType(.numberPad)
                TextField("Год выпуска", text: $yearOfRelease)
                TextField("Количество владельцев по ПТС", text: $countOfOwners)
                    .keyboardType(.numberPad)
                TextField("Цена", text: $price)
                    .keyboardType(.numberPad)
                Spacer()
                Button(action: {
                    if !brand.isEmpty,
                       !model.isEmpty,
                       let mileage = Int(mileage),
                       !yearOfRelease.isEmpty,
                       let countOfOwners = Int(countOfOwners),
                       let price = Int(price) {
                        
                        let newCar = Car(id: UUID(),
                                         brand: brand,
                                         model: model,
                                         mileage: mileage,
                                         countOfOwners: countOfOwners,
                                         yearOfRelease: yearOfRelease,
                                         price: price,
                                         imageName: "")
                        onComplete(newCar)
                    }
                }
                ) {
                    Text("Добавить авто")
                        .font(.title2)
                }
            }
            .padding()
        }
    }
}




struct AddCarView_Previews: PreviewProvider {
    @State static private var car: Car? = nil
    
    static var previews: some View {
        AddCarView(car: $car) { newCar in
        }
    }
}
