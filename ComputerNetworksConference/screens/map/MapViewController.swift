//
//  MapViewController.swift
//  ComputerNetworksConference
//
//  Created by Michal on 10/15/20.
//  Copyright © 2020 OtherCoders. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    private let GOOGLE_URL = URL(string: "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=Zawiercie,geometry&key=AIzaSyAxzKO-jtBEhwXXRAtOrFURkyjD2TkkUtc")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchTask = URLSession.shared.dataTask(with: GOOGLE_URL) {(data, response, error) in
            guard let data = data else {return}
            print(String(data: data, encoding: .utf8)!)
        }
        searchTask.resume()
        
        let camera = GMSCameraPosition.camera(withLatitude: 52, longitude: 21, zoom: 6)
        let view = GMSMapView.map(withFrame: CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 100, height: 100)), camera: camera)
        
        let currentLocation = CLLocationCoordinate2D(latitude: 52, longitude: 21)
        let marker = GMSMarker(position: currentLocation)
        marker.map = mapView
        
        mapView.moveCamera(GMSCameraUpdate.setCamera(camera))
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
