import SwiftUI
import MapKit

struct Map: UIViewRepresentable {
    var coachesLocations: [MapLocation] = [
        MapLocation(name: "Chad", latitude: 43.5690, longitude: 1.3976)
    ]

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

        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: coachesLocations[0].latitude, longitude: coachesLocations[0].longitude)
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotation(annotation)
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
        }

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation is MKUserLocation {
                return nil
            }

            let identifier = "pin"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = false
            } else {
                annotationView?.annotation = annotation
            }

            let pinImage = UIImage(named: "GigachadImage")
            let imageView = UIImageView(image: pinImage)
            imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            imageView.layer.cornerRadius = 15
            imageView.clipsToBounds = true
            annotationView?.addSubview(imageView)

            let label = UILabel(frame: CGRect(x: -10, y: 32, width: 50, height: 12))
            label.font = UIFont.boldSystemFont(ofSize: 10)
            label.text = "Ernest"
            label.textAlignment = .center
            label.textColor = .black
            annotationView?.addSubview(label)

            return annotationView
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapWrapper()
    }
}


struct MapWrapper: View {
    @State private var navigateToProfile = false

    var body: some View {
        NavigationStack {
            VStack {
                Map()
            }
        }
    }
}



