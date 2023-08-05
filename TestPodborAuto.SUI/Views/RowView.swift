//
//  RowView.swift
//  TestPodborAuto.SUI
//
//  Created by Igor on 04.08.2023.
//

import SwiftUI

struct RowView: View {
    let car: Car
    var body: some View {
        VStack.init(alignment: .leading) {
            Image(car.imageName ?? "bmwX5")
                .resizable()
                .frame(width: 280, height: 200)
                .cornerRadius(5)
            Text("\(car.brand) \(car.model), \(car.yearOfRelease), \(formatNumber(car.mileage)) км")
                .font(.system(size: 14))
                .frame(width: 280, alignment: .leading)
            Text("\(formatNumber(car.price))₽")
                .font(.headline)
                .padding(.bottom, 10)
        }
        .padding(.leading, 10)
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(car: DataStore().cars.first!)
    }
}
