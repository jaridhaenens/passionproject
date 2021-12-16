//
//  RouteView.swift
//  onismo
//
//  Created by Jari D'haenens on 30/11/2021.
//

import MapKit
import SwiftUI

struct RouteView: UIViewRepresentable {
    @ObservedObject private var locationManager = LocationManager()
    
    
    typealias UIViewType = MKMapView
    
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
//
//        let region = MKCoordinateRegion(
//            center: CLLocationCoordinate2D(latitude: 51.002441, longitude: 3.747810),
//            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
//        mapView.setRegion(region, animated: true)
//
//        // NYC
//        let p1 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 51.002441, longitude: 3.747810))
//
//        // Boston
//        let p2 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 50.994751, longitude: 3.745660))
//
//        let p2Pin = MKPointAnnotation()
//        p2Pin.coordinate = CLLocationCoordinate2D(latitude: 50.994751, longitude: 3.745660)
//        p2Pin.title = "End Location"
//        p2Pin.subtitle = "Straatnaam"
//
//
//        let request = MKDirections.Request()
//        request.source = MKMapItem(placemark: p1)
//        request.destination = MKMapItem(placemark: p2)
//        request.transportType = .walking
//
//        let directions = MKDirections(request: request)
//        directions.calculate { response, error in
//            guard let route = response?.routes.first else { return }
//            mapView.addAnnotations([p1, p2])
//            mapView.addAnnotations([p2Pin])
//            mapView.addOverlay(route.polyline)
//            mapView.setVisibleMapRect(
//                route.polyline.boundingMapRect,
//                edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20),
//                animated: true)
//        }
//
//
//
//
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = self.locationManager.userCoords != nil ? self.locationManager.userCoords!.coordinate : CLLocationCoordinate2D()

//        print("\(coordinate.latitude) in routeview")
        
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.384998, longitude: -122.106689),
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        mapView.setRegion(region, animated: false)
        
        // NYC
        let p1 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude))
        
        // Boston
        let p2 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 37.384998, longitude: -122.106689))
        
        let p2Pin = MKPointAnnotation()
        p2Pin.coordinate = CLLocationCoordinate2D(latitude: 37.384998, longitude: -122.106689)
        p2Pin.title = "End Location"
        p2Pin.subtitle = "Straatnaam"
        
        uiView.removeOverlays(uiView.overlays)
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: p1)
        request.destination = MKMapItem(placemark: p2)
        request.transportType = .walking
        
        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            guard let route = response?.routes.first else { return }
//            mapView.addAnnotations([p1, p2])
            uiView.addAnnotations([p2Pin])
            uiView.addOverlay(route.polyline)
            uiView.setVisibleMapRect(
                route.polyline.boundingMapRect,
                edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20),
                animated: true)
        }
        
        
        
        
//        return uiView
    }
    
    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = UIColor(red: 46/255, green: 40/255, blue: 103/255, alpha: 1)
            renderer.lineWidth = 5
            return renderer
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            guard !(annotation is MKUserLocation) else {
                return nil
            }
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")
            
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
                annotationView?.canShowCallout = true
            } else {
                annotationView?.annotation = annotation
            }
            
            annotationView?.image = UIImage(named: "mapDot")
            
            return annotationView
        }
    }
}

struct RouteView_Previews: PreviewProvider {
    static var previews: some View {
        RouteView()
    }
}
