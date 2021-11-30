//
//  RouteView.swift
//  onismo
//
//  Created by Jari D'haenens on 30/11/2021.
//

import MapKit
import SwiftUI

struct RouteView: UIViewRepresentable {
  typealias UIViewType = MKMapView
  
  
  func makeCoordinator() -> MapViewCoordinator {
    return MapViewCoordinator()
  }
  
  func makeUIView(context: Context) -> MKMapView {
    let mapView = MKMapView()
    mapView.delegate = context.coordinator
    
    let region = MKCoordinateRegion(
      center: CLLocationCoordinate2D(latitude: 51.002441, longitude: 3.747810),
      span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    mapView.setRegion(region, animated: true)
    
    // NYC
    let p1 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 51.002441, longitude: 3.747810))
    
    // Boston
    let p2 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 50.994751, longitude: 3.745660))
    
    let request = MKDirections.Request()
    request.source = MKMapItem(placemark: p1)
    request.destination = MKMapItem(placemark: p2)
    request.transportType = .walking
    
    let directions = MKDirections(request: request)
    directions.calculate { response, error in
        guard let route = response?.routes.first else { return }
        mapView.addAnnotations([p1, p2])
        mapView.addOverlay(route.polyline)
        mapView.setVisibleMapRect(
            route.polyline.boundingMapRect,
            edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20),
            animated: true)
    }
    
    return mapView
  }
  
  func updateUIView(_ uiView: MKMapView, context: Context) {
  }
  
  class MapViewCoordinator: NSObject, MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
      let renderer = MKPolylineRenderer(overlay: overlay)
      renderer.strokeColor = .systemBlue
      renderer.lineWidth = 5
      return renderer
    }
  }
}

struct RouteView_Previews: PreviewProvider {
    static var previews: some View {
        RouteView()
    }
}
