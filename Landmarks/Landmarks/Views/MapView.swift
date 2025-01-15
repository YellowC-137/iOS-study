//
//  MapView.swift
//  Landmarks
//
//  Created by 황준성 on 1/14/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinator: CLLocationCoordinate2D
    
    var body: some View {
        Map(position: .constant(.region(region)))
    }
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(center: coordinator, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    }
}

#Preview {
    MapView(coordinator: CLLocationCoordinate2D(latitude: 37.5, longitude: 127.5))
}
