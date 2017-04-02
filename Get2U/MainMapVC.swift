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

    @IBOutlet weak var MainMap: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
