//
//  ContentView.swift
//  TestPodborAuto.SUI
//
//  Created by Igor on 04.08.2023.
//

import SwiftUI

struct MainView: View {
    
    @State private var cars = DataStore().cars
    @State private var isShowingAddCarScreen = false
    @State private var car: Car? = nil
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    isShowingAddCarScreen.toggle()
                }) {
                    Image(systemName: "plus")
                }
                .padding(.leading, 10)
                
                Spacer()
                Text("Сортировка по цене")
                    .foregroundColor(.blue)
                Button(action: sortByLowestPrice) {
                    Image(systemName: "arrowtriangle.up")
                }
                .font(.title2)
                Button(action: sortByHighestPrice) {
                    Image(systemName: "arrowtriangle.down")
                }
                .font(.title2)
                .padding(.trailing, 10)
            }
            .sheet(isPresented: $isShowingAddCarScreen) {
                AddCarView(car: $car) { newCar in
                    cars.append(newCar)
                    isShowingAddCarScreen.toggle()
                }
            }
            NavigationView {
                List(cars) { car in
                    NavigationLink(destination: CarDetailView(car: car)) {
                        RowView(car: car)
                            .navigationTitle("Авто Подбор")
                    }
                }
            }
        }
    }
    
    private func sortByLowestPrice() {
        cars.sort { $0.price < $1.price }
    }
    
    private func sortByHighestPrice() {
        cars.sort { $0.price > $1.price }
    }
}
    
    


//
//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView(car: DataStore().cars.first!)
//
//    }
//}
