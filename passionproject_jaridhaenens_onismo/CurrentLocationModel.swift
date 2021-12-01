//
//  CurrentLocationView.swift
//
//  Created by Jari D'haenens on 29/11/2021.
//
import MapKit

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2DMake(51.054588, 3.721880)
}

final class CurrentLocationView: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation,
                                                   latitudinalMeters: 750,
                                                   longitudinalMeters: 750
    )
    
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationManagerIsEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
//            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager!.delegate = self
        } else{
            print("no location")
        }
    }
    
    private func checkLocationAuth() {
        guard let locationManager = locationManager else {
            return
        }
        
        switch locationManager.authorizationStatus {
        
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted")
        case .denied:
            print("You have denied the location permissions")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate,
                                        latitudinalMeters: 750,
                                        longitudinalMeters: 750)
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuth()
    }
    
    
}
