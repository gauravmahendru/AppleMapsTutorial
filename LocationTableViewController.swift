//
//  LocationTableViewController.swift
//  MapsTutorial
//
//  Created by User on 7/8/20.
//  Copyright © 2020 gaurav. All rights reserved.
//

import UIKit
import MapKit

class LocationTableViewController: UITableViewController, NewLocationDelegate {

    
    var mapViewController: MapViewController?
    var locationList = [LocationAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var location = LocationAnnotation(newTitle: "Flinders Station", newSubtitle: "Flinders Station, Melbourne CBD", lat: -37.818210, long: 144.967200)
        locationList.append(location)
        mapViewController?.mapView.addAnnotation(location)
        
        location = LocationAnnotation(newTitle: "Brighton Beach", newSubtitle: "Brighton Beach, Bathing Boxes", lat: -37.929700, long: 144.990990)
        locationList.append(location)
    }
    
    func locationAnnotationAdded(annotation: LocationAnnotation) {
        locationList.append(annotation)
        mapViewController?.mapView.addAnnotation(annotation)
        tableView.insertRows(at: [IndexPath(row: locationList.count - 1,section: 0)], with: .automatic)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return locationList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
        let annotation = self.locationList[indexPath.row]

        cell.textLabel?.text = annotation.title
        cell.detailTextLabel?.text = "Lat: \(annotation.coordinate.latitude) Long: \(annotation.coordinate.longitude)"

        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mapViewController?.focusOn(annotation: self.locationList[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle:
        UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            locationList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addLocationSegue" {
            let controller = segue.destination as! NewLocationViewController
            controller.delegate = self
        }
    }

}
