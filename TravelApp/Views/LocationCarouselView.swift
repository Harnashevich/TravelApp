//
//  LocationCarouselView.swift
//  TravelApp
//
//  Created by Andrei Harnashevich on 30.08.24.
//

import SwiftUI

struct LocationCarouselView: View {
    let locations: [Location]
    
    init() {
        locations = [
            Location(title: "New York City", imageName: "location1"),
            Location(title: "London, UK", imageName: "location2"),
            Location(title: "Tokyo, Japan", imageName: "location3"),
            Location(title: "San Francisco", imageName: "location4")
        ]
    }
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(locations) { model in
                    NavigationLink {
                        LocationDetailView(title: model.title)
                        Text(model.title)
                    } label: {
                        LocationCard(model: model)
                            .frame(width: 300, height: 170, alignment: .center)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding()
                            .padding(.trailing, -25)
                    }
                }
            }
            .padding(.trailing, 25)
        }
    }
}

struct LocationDetailView: View {
    var title: String

    var body: some View {
        ScrollView {
            VStack {
                
            }
        }
        .navigationTitle(title)
    }
}

struct LocationCard: View {
    let model: Location

    var body: some View {
        ZStack {
            GeometryReader { proxy in
                Image(model.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width,
                           height: proxy.size.height,
                           alignment: .center)
            }

            VStack(alignment: .leading) {
                Spacer()
                HStack {
                    Text(model.title)
                        .bold()
                        .foregroundColor(Color.white)
                        .font(.system(size: 32))
                        .padding(.leading, 4)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    LocationCarouselView()
}
