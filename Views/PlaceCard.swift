//
//  PlaceCard.swift
//  TravelApp
//
//  Created by Andrei Harnashevich on 2.09.24.
//

import SwiftUI

struct PlaceCard: View {
    var model: Place
    
    var body: some View {
        VStack(alignment: .leading) {
            // Image
            Image(model.type.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            // Title
            Text(model.title)
                .bold()
                .font(.system(size: 24))
                .padding(.bottom, 10)
            
            // Description
            Text(model.description)
                .bold()
                .foregroundStyle(Color(.secondaryLabel))
            
            // Location title
            Text(model.location.title)
                .foregroundStyle(Color(.secondaryLabel))
            
            // Type
            Text(model.type.rawValue.lowercased())
                .foregroundStyle(Color(.secondaryLabel))
        }
        .padding()
        .background(Color.white)
    }
}
