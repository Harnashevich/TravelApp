//
//  FilterButtonsView.swift
//  TravelApp
//
//  Created by Andrei Harnashevich on 2.09.24.
//

import SwiftUI

struct FilterButtonsView: View {
    @Binding var filterType: PlaceType?
    
    init(type: Binding<PlaceType?>) {
        _filterType = type
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(PlaceType.allCases, id: \.self) { type in
                    let name = type.rawValue.uppercased()
                    
                    Button(action: {
                        filterType = type
                    }, label: {
                        Text(name)
                            .bold()
                            .frame(width: 150, height: 50, alignment: .center)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                    .padding(.leading, 10)
                }
            }
        }
    }
}
