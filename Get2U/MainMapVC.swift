//
//  MainMapVC.swift
//  Get2U
//
//  Created by Yoshi on 1/4/17.
//  Copyright © 2017 Yoshi. All rights reserved.
//
//  setting up MKMap https://www.youtube.com/watch?v=wU1XN-Gk1LM   learned how to set up constraint
//
// Taipei 101  -  25.033611, 121.565

// Tutorial  https://www.youtube.com/watch?v=vWTrTHlt6Pk&list=PLZhNP5qJ2IA2z5ntmXoWhn8eCRstWfvu2  Ausome Tus




import UIKit
import MapKit

class MainMapVC: UIViewController , MKMapViewDelegate, CLLocationManagerDelegate {

    class CustomPointAnnotation: MKMapView{
        var imageName: String!
    }
    
    @IBOutlet weak var mainMap: MKMapView!
    
    let locManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locManager.delegate = self
        self.mainMap.delegate = self
        
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
        let userLoc = CLLocationCoordinate2D(latitude: loc!.coordinate.latitude, longitude: loc!.coordinate.longitude)
        let region  = MKCoordinateRegion(center: userLoc, span:MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)) // zoon level
        self.mainMap.setRegion(region, animated: true)
    
     // hard cording for testing 
        
        let coffeeLoc = CLLocationCoordinate2D(latitude: loc!.coordinate.latitude * 1.0001, longitude: loc!.coordinate.longitude)
        
        
        
     //   mainMap.removeAnnotations(mainMap.annotations)
        
        let coffeeAnnotation = MKPointAnnotation()
        coffeeAnnotation.coordinate = coffeeLoc
        coffeeAnnotation.title = "test coffee"
        
        let userAnnotation = MKPointAnnotation()
        userAnnotation.coordinate = userLoc
        userAnnotation.title = "test mee"
   
        
        mainMap.addAnnotation(coffeeAnnotation)
        mainMap.addAnnotation(userAnnotation)
        
        
       self.locManager.stopUpdatingLocation()
        
    }
  
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        if !(annotation is MKPointAnnotation) {
            print("NOT REGISTERED AS MKPOINTANNOTATION")
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "pokemonIdentitfier")
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "pokemonIdentitfier")
            annotationView!.canShowCallout = true
        }
            
        else {
            annotationView!.annotation = annotation
        }
        
        //  let cpa = annotation as! CustomPointAnnotation
        annotationView!.image = UIImage(named: "pikachu.png")
        
        return annotationView
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error" + error.localizedDescription)
    }
    
}
