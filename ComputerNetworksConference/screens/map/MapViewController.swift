//
//  MapViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 10/15/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    private let locationManager = CLLocationManager()
    private var latitude: Double = 0
    private var longitude: Double = 0
    var address: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        checkLocationServices()
    }
    
    func getDirections() {
        if let location = locationManager.location?.coordinate {
            let request = createDirectionsRequest(from: location)
            let directions = MKDirections(request: request)
            
            directions.calculate { [unowned self] (response, error) in
                if let response = response {
                    for route in response.routes {
                        self.mapView.addOverlay(route.polyline)
                        self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                    }
                }
            }
        }
    }
    
    func getMarkerLocation() -> CLLocation {
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    func createDirectionsRequest(from coordinate: CLLocationCoordinate2D) -> MKDirections.Request {
        let destinationCoordinate = getMarkerLocation().coordinate
        let startingLocation = MKPlacemark(coordinate: coordinate)
        let destination = MKPlacemark(coordinate: destinationCoordinate)
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: startingLocation)
        request.destination = MKMapItem(placemark: destination)
        request.transportType = .any
        request.requestsAlternateRoutes = true
        
        return request
    }
    
    func centerViewOnPlace(completion: @escaping () -> ()) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = address
        let activeSearch = MKLocalSearch(request: searchRequest)
        activeSearch.start(completionHandler: { (response, error) in
            if error != nil {
                print(error)
            } else {
                if let response = response {
                    //remove previous annotations
                    let annotations = self.mapView.annotations
                    self.mapView.removeAnnotations(annotations)
                    
                    self.latitude = response.boundingRegion.center.latitude
                    self.longitude = response.boundingRegion.center.longitude
                    
                    let annotation = MKPointAnnotation()
                    annotation.title = self.address
                    annotation.coordinate = CLLocationCoordinate2DMake(self.latitude, self.longitude)
                    self.mapView.addAnnotation(annotation)
                }
            }
            completion()
        })
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            checkLocationAuthorization()
        } else {
            //TODO alert
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            centerViewOnPlace() {
                DispatchQueue.main.async {
                    self.getDirections()
                }
            }
            locationManager.startUpdatingLocation()
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension MapViewController: CLLocationManagerDelegate, MKMapViewDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        renderer.strokeColor = .blue
        return renderer
    }
}
