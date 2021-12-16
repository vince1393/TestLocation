//
//  ContentView.swift
//  TestLocation
//
//  Created by Vincent Romani on 2021-12-15.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    var locations: [Location]
    
    var body: some View {
        List {
            ForEach(locations, id: \.self) { location in
                Text("[\(location.date.formatted(date: .abbreviated, time: .standard))]  \(location.location.coordinate.latitude), \(location.location.coordinate.longitude)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(locations: [])
    }
}
