//
//  ContentView.swift
//  FindMyCoach
//
//  Created by Yannis Kessas on 21/03/2023.
//

import SwiftUI
import MapKit

struct Map: UIViewRepresentable {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 43.5661, longitude: 1.3982),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = false
        mapView.delegate = context.coordinator
        return mapView
    }


    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.setRegion(region, animated: true)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: Map

        init(_ parent: Map) {
            self.parent = parent
        }

        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            parent.region = MKCoordinateRegion(
                center: userLocation.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = userLocation.coordinate
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotation(annotation)
        }
    }

}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        Map()
    }
}

