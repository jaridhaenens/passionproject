
import Foundation
import UIKit
import CoreLocation

class LocationManager: NSObject, ObservableObject {
   
    private let locationManager = CLLocationManager()
    @Published var userCoords: CLLocation? = nil
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else {
            return
        }
        
//        print("\(self.locationManager.location!.coordinate) in update")
        self.userCoords = location
    }
    
}
