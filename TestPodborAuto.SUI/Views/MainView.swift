//
//  ContentView.swift
//  TestPodborAuto.SUI
//
//  Created by Igor on 04.08.2023.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var data: DataStore
    @State private var isShowingAddCarScreen = false
    @State private var car: Car? = nil
    @State private var sortByHighestPrice: Bool = false
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.1)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Button(action: {
                        isShowingAddCarScreen.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                    .padding(.leading, 10)
                    Spacer()
                    Button(action: {
                        sortByPrice()
                        sortByHighestPrice.toggle()
                    }) {
                        Text("Сортировка по цене")
                            .foregroundColor(.blue)
                        if !sortByHighestPrice {
                            Image(systemName: "arrow.up")
                                .padding(.trailing, 10)
                        } else {
                            Image(systemName: "arrow.down")
                                .padding(.trailing, 10)
                        }
                    }
                }
                .sheet(isPresented: $isShowingAddCarScreen) {
                    AddCarView(car: $car) { newCar in
                        data.cars.append(newCar)
                        isShowingAddCarScreen.toggle()
                    }
                }
                NavigationView {
                    List(data.cars) { car in
                        NavigationLink(destination: CarDetailView(car: binding(for: car))) {
                            RowView(car: car)
                                .navigationTitle("Авто Подбор")
                        }
                    }
                }
            }
        }
    }
    
    //функция для создания Binding для car
    private func binding(for car: Car) -> Binding<Car?> {
        guard let carIndex = data.cars.firstIndex(where: { $0.id == car.id }) else {
            fatalError("Car not found")
        }
        return Binding<Car?>(
            get: { data.cars[carIndex] },
            set: { data.cars[carIndex] = $0 ?? Car(id: UUID(), brand: "", model: "", mileage: 0, countOfOwners: 0, yearOfRelease: "", price: 0, imageName: "") }
        )
    }
    
    private func sortByPrice() {
        if sortByHighestPrice {
            data.cars.sort { $0.price < $1.price }
        } else {
            data.cars.sort { $0.price > $1.price }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
