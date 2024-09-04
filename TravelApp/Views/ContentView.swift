//
//  ContentView.swift
//  TravelApp
//
//  Created by Andrei Harnashevich on 30.08.24.
//

import SwiftUI

struct ContentView: View {
    @State var searchTerm = ""
    @State var filterType: PlaceType?
    
    @State var models: [Place] = [
        Place(type: .mall,
              location: Location(title: "New York",
                                 imageName: "location1"),
              title: "New York City Macys Mall",
              description: "Huge mall with tons of things to do for the whole family."),
        Place(type: .restaurant,
              location: Location(title: "Japan",
                                 imageName: "location3"),
              title: "Japanese Food Frenzy",
              description: "Great japanese food to go for everyone."),
        Place(type: .airport,
              location: Location(title: "London",
                                 imageName: "location2"),
              title: "London City Airport",
              description: "Neat and clean airport that services city of London"),
        Place(type: .sportingVenue,
              location: Location(title: "San Francisco",
                                 imageName: "location4"),
              title: "49ers Stadium",
              description: "Beautiful football field for home games."),
        Place(type: .unknown,
              location: Location(title: "New York",
                                 imageName: "location1"),
              title: "Central Park",
              description: "Enormous park in the middle of the city; great for family visits.")
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        .blue,
                        .white
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                ScrollView {
                    VStack {
                        TextField(
                            "",
                            text: $searchTerm,
                            prompt: Text("Search")
                                .foregroundStyle(Color.gray)
                        )
                            .padding(12)
                            .background(.white)
                            .foregroundStyle(Color.black)
                            .accentColor(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                            .padding()
                        
                        LocationCarouselView()
                        
                        FilterButtonsView(type: $filterType)
                        
                        VStack {
                            ForEach(models) { place in
                                if searchTerm.isEmpty {
                                    if filterType == nil {
                                        NavigationLink(
                                            destination: WebView(string: "https://www.google.com/search?q=new+york+city"),
                                            label: {
                                                PlaceCard(model: place)
                                                    .cornerRadius(12)
                                                    .padding()
                                            }
                                        )
                                    }
                                    else if let filterType = self.filterType, filterType == place.type {
                                        NavigationLink(
                                            destination: WebView(string: "https://www.google.com/search?q=new+york+city"),
                                            label: {
                                                PlaceCard(model: place)
                                                    .cornerRadius(12)
                                                    .padding()
                                            }
                                        )
                                    }
                                }
                                else {
                                    if place.title.lowercased().hasPrefix(searchTerm.lowercased()) {
                                        if filterType == nil {
                                            NavigationLink(
                                                destination: WebView(string: "https://www.google.com/search?q=new+york+city"),
                                                label: {
                                                    PlaceCard(model: place)
                                                        .cornerRadius(12)
                                                        .padding()
                                                }
                                            )
                                        }
                                        else if let filterType = self.filterType, filterType == place.type {
                                            NavigationLink(
                                                destination: WebView(string: "https://www.google.com/search?q=new+york+city"),
                                                label: {
                                                    PlaceCard(model: place)
                                                        .cornerRadius(12)
                                                        .padding()
                                                }
                                            )
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Travel")
        }
    }
}

#Preview {
    ContentView()
}
