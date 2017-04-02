//
//  MainMapVC.swift
//  Get2U
//
//  Created by Yoshi on 1/4/17.
//  Copyright © 2017 Yoshi. All rights reserved.
//

import UIKit
import MapKit

class MainMapVC: UIViewController , MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mainMap: MKMapView!
    
    let locManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locManager.delegate = self
        
        self.locManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locManager.requestWhenInUseAuthorization()
        self.locManager.startUpdatingLocation()
        self.mainMap.showsUserLocation = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // location delgate method
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let loc = locations.last
        let userCenter = CLLocationCoordinate2D(latitude: loc!.coordinate.latitude, longitude: loc!.coordinate.longitude)
        let region  = MKCoordinateRegion(center: userCenter, span:MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)) // zoon level
        self.mainMap.setRegion(region, animated: true)
        self.locManager.stopUpdatingLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error" + error.localizedDescription)
    }
    
}
