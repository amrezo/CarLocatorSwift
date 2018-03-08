//
//  MapViewController.swift
//  CarLocator
//
//  Created by Amr Al-Refae on 3/8/18.
//  Copyright © 2018 Amr Al-Refae. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager: CLLocationManager!
    var userLocation: CLLocation!
    var alertTextField: UITextField!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        determineCurrentLocation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func determineCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
        let currentUserLocation: CLLocation = locations[0]
        userLocation = currentUserLocation

        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        mapView.setRegion(region, animated: true)
    }
    

    @IBAction func dropPin(_ sender: UIBarButtonItem) {

        let alert = UIAlertController(title: "Add a location", message: "What are you adding?", preferredStyle: .alert)
        alert.addTextField { (textField) in
            self.alertTextField = textField
            textField.placeholder = "E.g. My Car"
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (addAction) in
            let myAnnotation: MKPointAnnotation = MKPointAnnotation()
            myAnnotation.coordinate = CLLocationCoordinate2DMake(self.userLocation.coordinate.latitude, self.userLocation.coordinate.longitude);
            myAnnotation.title = self.alertTextField.text
            self.mapView.addAnnotation(myAnnotation)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (cancel) in }
        
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
}

