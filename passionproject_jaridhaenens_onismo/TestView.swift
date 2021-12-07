//
//  TestView.swift
//  passionproject_jaridhaenens_onismo
//
//  Created by Jari D'haenens on 07/12/2021.
//

import SwiftUI
import MapKit

struct TestView: View {
    
    @ObservedObject private var locationManager = LocationManager()
    
    
    var body: some View {
        let coordinate = self.locationManager.userCoords != nil ? self.locationManager.userCoords!.coordinate : CLLocationCoordinate2D()
        
        
//        let coordinate = self.locationManager.location.coordinate : CLLocationCoordinate2D()
        Text("\(coordinate.latitude)")
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
