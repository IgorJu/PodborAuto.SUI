//
//  CarDetailView.swift
//  TestPodborAuto.SUI
//
//  Created by Igor on 04.08.2023.
//

import SwiftUI

struct CarDetailView: View {
    var car: Car
    
    var body: some View {
        VStack.init(alignment: .leading) {
            
            Image(car.imageName)
                .resizable()
                .frame(width: 350, height: 280)
                .cornerRadius(5)
            Text("\(car.brand) \(car.model), \(car.yearOfRelease)")
                .font(.title3)
                            
            
            Text("\(formatNumber(car.price))₽")
                .font(.title2)
                .bold()
                .padding(.bottom, 10)
            Text("Характеристики")
                .bold()
                .font(.title2)
                .padding(.bottom, 20)
            VStack.init(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Пробег, км :")
                        .foregroundColor(.gray)
                    Text(formatNumber(car.mileage))
                }
                HStack {
                    Text("Владельцев по ПТС:")
                        .foregroundColor(.gray)
                    Text(car.countOfOwners.formatted())
                }
                HStack {
                    Text("Год выпуска:")
                        .foregroundColor(.gray)
                    Text(car.yearOfRelease)
                }
            }
        }
        .padding(20)
    }
}

struct CarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CarDetailView(car: DataStore().cars.first!)
    }
}
