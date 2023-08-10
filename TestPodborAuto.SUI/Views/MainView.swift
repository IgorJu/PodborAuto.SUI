//
//  ContentView.swift
//  TestPodborAuto.SUI
//
//  Created by Igor on 04.08.2023.
//

import SwiftUI
import RealmSwift

struct MainView: View {
    @State private var car: Car? = nil
    
    @State private var isShowingAddCarScreen = false
    @State private var sortByHighestPrice: Bool = false
    @State private var showFilterSheet: Bool = false
    
    @State private var selectedBrands: Set<String> = []
    
    private let brandsToFilter = ["BMW", "Toyota", "Mercedes-Benz"]
    private var storageManager = StorageManager.shared
    private var dataManager = DataManager.shared
    
    @ObservedResults(Car.self) var cars
    
    private var filteredCars: [Car] {
        
        //фильтр по брендам
        var sortedCars = Array(cars)
        if !selectedBrands.isEmpty {
            sortedCars = sortedCars.filter { car in
                selectedBrands.contains(car.brand)
            }
        }
        
        // Сортировка по цене
        if sortByHighestPrice {
            sortedCars = sortedCars.sorted { $0.price > $1.price }
        } else {
            sortedCars = sortedCars.sorted { $0.price < $1.price }
        }
        return sortedCars
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
                            isPresented: $showFilterSheet,
                            brandsToFilter: brandsToFilter
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
                        AddCarView(car: $car, isShowingScreen: $isShowingAddCarScreen) { newCar in
                            storageManager.save(newCar)
                            isShowingAddCarScreen.toggle()
                        }
                    }
                }
            }
        }
        .frame(height: 70)
        NavigationView {
            List{
                ForEach(filteredCars, id: \.id) { car in
                    NavigationLink(destination: CarDetailView(car: binding(for: car))) {
                        RowView(car: car)
                            .navigationTitle("Авто Подбор")
                    }
                }
            }
        }
    }
    
    //функция для создания Binding для car
    private func binding(for car: Car) -> Binding<Car?> {
        guard let carIndex = filteredCars.firstIndex(where: { $0.id == car.id }) else {
            fatalError("Car not found")
        }
        return .init(
            get: { filteredCars[carIndex] },
            set: { updatedCar in
                guard let updatedCar = updatedCar else { return }
                storageManager.updateCar(updatedCar)
            }
        )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
