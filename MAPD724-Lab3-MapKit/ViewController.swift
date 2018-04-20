//
//  ViewController.swift
//  MAPD724-Lab3-MapKit
//
//  Created by Viktor Bilyk on 2018-04-20.
//  Copyright © 2018 Brogrammers. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    //ACTIONS
    @IBAction func changeMapType(_ sender: UISegmentedControl) {//change map view type
        mapView.mapType = MKMapType.init(rawValue: UInt(sender.selectedSegmentIndex)) ?? .standard

    }
    
    @IBAction func addLocation(_ sender: UIBarButtonItem) {
    }
    
    func centerMap(coords: CLLocation) { //center map on location with radius of 1.2 Km
        let region = MKCoordinateRegionMakeWithDistance(coords.coordinate, radius, radius)
        
        mapView.setRegion(region, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centerMap(coords: startingCoords)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //OUTLETS
    @IBOutlet weak var mapView: MKMapView!
    
    let startingCoords = CLLocation(latitude: 43.6514990607, longitude: -79.3834667995)
    let radius: CLLocationDistance = 1200
}

