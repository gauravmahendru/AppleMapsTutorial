//
//  MapViewController.swift
//  MapsTutorial
//
//  Created by User on 7/8/20.
//  Copyright © 2020 gaurav. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    func focusOn(annotation: MKAnnotation) {
        mapView.selectAnnotation(annotation, animated: true)
    
        let zoomRegion = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(mapView.regionThatFits(zoomRegion),animated: true)
    }

}
