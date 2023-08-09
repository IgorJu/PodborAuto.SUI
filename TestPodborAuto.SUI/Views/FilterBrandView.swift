//
//  FilterBrandView.swift
//  TestPodborAuto.SUI
//
//  Created by Igor on 07.08.2023.
//

import SwiftUI

struct FilterBrandView: View {
    @Binding var selectedBrands: Set<String>
    @Binding var isPresented: Bool
    
    let brandsToFilter: [String]
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.1)
                .ignoresSafeArea()
            VStack(alignment: .center) {
                ForEach(brandsToFilter, id: \.self) { brand in
                    Button(action: {
                        if selectedBrands.contains(brand) {
                            selectedBrands.remove(brand)
                        } else {
                            selectedBrands.insert(brand)
                        }
                    }) {
                        HStack {
                            Text(brand)
                                .font(.title)
                                .foregroundColor(.black)
                            Spacer()
                            if selectedBrands.contains(brand) {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.blue)
                                    .font(.title2)
                            }
                        }
                        .padding(10)
                    }
                    .padding(.horizontal)
                }
                Button(action: {
                    isPresented = false
                }) {
                    Text("Применить")
                        .font(.title)
                        .padding(.top, 50)
                }
            }
        }
    }
}

struct FilterBrandView_Previews: PreviewProvider {
    @State static var selectedBrands: Set<String> = []
    
    static var previews: some View {
        FilterBrandView(selectedBrands: $selectedBrands, isPresented: .constant(true), brandsToFilter: ["BMW", "Toyota", "Mercedes"])
    }
}
