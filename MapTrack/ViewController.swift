//
//  ViewController.swift
//  MapTrack
//
//  Created by ALEKSANDR GRIGOREV on 08.11.2021.
//

import UIKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController {

    var mapView: GMSMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let camera = GMSCameraPosition.camera(withLatitude: <#T##CLLocationDegrees#>, longitude: <#T##CLLocationDegrees#>, zoom: <#T##Float#>)
        mapView = GMSMapView.map(withFrame: self.view.frame, camera: GMSCameraPosition())
        self.view.addSubview(mapView)
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }


}

extension ViewController: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let coordinate = location.coordinate
            self.mapView.camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 17)
            let marker = GMSMarker(position: coordinate)
            marker.map = self.mapView
        }
    }
}
