//
//  AddCarView.swift
//  TestPodborAuto.SUI
//
//  Created by Igor on 04.08.2023.
//

import SwiftUI
import RealmSwift

struct AddCarView: View {
    @Binding var car: Car?
    @Binding var isShowingScreen: Bool
    @ObservedResults(Car.self) var cars
    
    @State private var brand: String
    @State private var model: String
    @State private var mileage: String
    @State private var yearOfRelease: String
    @State private var countOfOwners: String
    @State private var price: String
    
    private let storageManager = StorageManager.shared
    var onComplete: (Car) -> Void
    
    init(car: Binding<Car?>, isShowingScreen: Binding<Bool>, onComplete: @escaping (Car) -> Void) {
        _car = car
        _isShowingScreen = isShowingScreen
        _brand = State(initialValue: car.wrappedValue?.brand ?? "")
        _model = State(initialValue: car.wrappedValue?.model ?? "")
        _mileage = State(initialValue: car.wrappedValue?.mileage ?? "")
        _yearOfRelease = State(initialValue: car.wrappedValue?.yearOfRelease ?? "")
        _countOfOwners = State(initialValue: car.wrappedValue?.countOfOwners ?? "")
        _price = State(initialValue: car.wrappedValue?.price ?? "")
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
                       !yearOfRelease.isEmpty
                        {
                        let newCar = Car()
                        newCar.brand = brand
                        newCar.model = model
                        newCar.mileage = mileage
                        newCar.price = price
                        newCar.countOfOwners = countOfOwners
                        newCar.yearOfRelease = yearOfRelease
                        $cars.append(newCar)
                        isShowingScreen = false
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
        AddCarView(car: $car, isShowingScreen: .constant(true)) { newCar in
        }
    }
}
