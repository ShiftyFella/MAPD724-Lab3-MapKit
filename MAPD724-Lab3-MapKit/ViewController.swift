//
//  ViewController.swift
//  MAPD724-Lab3-MapKit
//
//  Created by Viktor Bilyk on 2018-04-20.
//  Copyright © 2018 Brogrammers. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITextFieldDelegate {

    //ACTIONS
    @IBAction func changeMapType(_ sender: UISegmentedControl) {//change map view type
        mapView.mapType = MKMapType.init(rawValue: UInt(sender.selectedSegmentIndex)) ?? .standard
    }
    
    @IBAction func addLocation(_ sender: UIBarButtonItem) {
        addCoordsPopUp.isHidden = false
    }
    @IBAction func dismissPopUp(_ sender: UIButton) {
        
        latitudeTF.text = ""
        longitudeTF.text = ""
        
        addCoordsPopUp.isHidden = true
    }
    @IBAction func addLocationMarker(_ sender: UIButton) {
        
        lat = Double(latitudeTF.text!)!
        long = Double(longitudeTF.text!)!
        
        latitudeTF.text = ""
        longitudeTF.text = ""
        
        addMarkerOnMap(lat: lat, long: long)
        addCoordsPopUp.isHidden = true
    }
    
    func centerMap(coords: CLLocation) { //center map on location with radius of 1.2 Km
        let region = MKCoordinateRegionMakeWithDistance(coords.coordinate, radius, radius)
        
        mapView.setRegion(region, animated: true)
    }
    
    func addMarkerOnMap(lat: Double, long: Double) {//create marker with select coords
        let pos = CLLocation(latitude: lat, longitude: long)
        
        let marker = MKPointAnnotation()
        
        marker.title = "My Location"
        marker.coordinate = pos.coordinate
        
        mapView.addAnnotation(marker)
        centerMap(coords: pos)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        longitudeTF.delegate = self
        latitudeTF.delegate = self
        
        //style-popup
        addCoordsPopUp.isHidden = true
        addCoordsPopUp.layer.cornerRadius = 10
        addCoordsPopUp.layer.masksToBounds = true
        
        centerMap(coords: startingCoords)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    //OUTLETS
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addCoordsPopUp: UIView!
    
    @IBOutlet weak var latitudeTF: UITextField!
    @IBOutlet weak var longitudeTF: UITextField!
    
    var lat: CLLocationDegrees = 0
    var long: CLLocationDegrees = 0
    
    let startingCoords = CLLocation(latitude: 43.6514990607, longitude: -79.3834667995)
    let radius: CLLocationDistance = 1200
}

