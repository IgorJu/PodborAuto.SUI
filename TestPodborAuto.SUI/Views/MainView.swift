//
//  ContentView.swift
//  TestPodborAuto.SUI
//
//  Created by Igor on 04.08.2023.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var data: DataStore
    @State private var car: Car? = nil
    
    @State private var isShowingAddCarScreen = false
    @State private var sortByHighestPrice: Bool = false
    @State private var showFilterSheet: Bool = false
    
    @State private var selectedBrands: Set<String> = []
    @State private var searchText = ""
    
    let brandsToFilter: [String] = ["BMW", "Toyota", "Mercedes-Benz"]
    
    
    
    private var filteredCars: [Car] {
        var carsToShow = data.cars
        
        // Применение текстового фильтра
        if !searchText.isEmpty {
            carsToShow = carsToShow.filter { car in
                car.brand.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        // Применение фильтров по брендам
        if !selectedBrands.isEmpty {
            carsToShow = carsToShow.filter { car in
                selectedBrands.contains(car.brand)
            }
        }
        
        // Сортировка по цене
        if sortByHighestPrice {
            carsToShow.sort { $0.price > $1.price }
        } else {
            carsToShow.sort { $0.price < $1.price }
        }
        
        return carsToShow
    }
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.1)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Button(
                        action: {
                            isShowingAddCarScreen.toggle()
                        }) {
                            Image(systemName: "plus")
                        }
                        .padding(.leading, 10)
                    Button("Фильтр") {
                            showFilterSheet.toggle()
                        }
                        .padding(.horizontal)
                    //экран фильтрации
                        .sheet(isPresented: $showFilterSheet) {
                            FilterBrandView(
                                selectedBrands: $selectedBrands,
                                brandsToFilter: brandsToFilter,
                                isPresented: $showFilterSheet
                            )
                        }
                    Button(action: { sortByHighestPrice.toggle() }) {
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
                    //вызов экрана для добавления авто
                    .sheet(isPresented: $isShowingAddCarScreen) {
                        AddCarView(car: $car) { newCar in
                            data.cars.append(newCar)
                            isShowingAddCarScreen.toggle()
                        }
                    }
                }
            }
        }
        .frame(height: 70)
        TextField("Поиск", text: $searchText)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding()
        NavigationView {
            List(filteredCars) { car in
                NavigationLink(destination: CarDetailView(car: binding(for: car))) {
                    RowView(car: car)
                        .navigationTitle("Авто Подбор")
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
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
