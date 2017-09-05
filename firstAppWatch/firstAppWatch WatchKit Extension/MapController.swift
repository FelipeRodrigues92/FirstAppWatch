//
//  MapController.swift
//  firstAppWatch
//
//  Created by Miguel Nery on 04/09/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit
import WatchKit

class MapController: WKInterfaceController {
    @IBOutlet var map: WKInterfaceMap!
 
    override func awake(withContext context: Any?) {
        var regionCoordinate: MKCoordinateRegion
        if let coordinate = context as? MKCoordinateRegion {
            regionCoordinate = coordinate
        } else {
            regionCoordinate = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -15, longitude: -47), span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20))
        }
        map.setRegion(regionCoordinate)
        map.addAnnotation(regionCoordinate.center, with: .purple)
    }

    @IBAction func playAgain() {
        popToRootController()
    }
}
