//
//  QuizInterfaceController.swift
//  firstAppWatch
//
//  Created by Rachaus on 04/09/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import WatchKit
import Foundation
import CoreLocation

class QuizInterfaceController: WKInterfaceController {
    
    var country: Country!
    var coordinate: MKCoordinateRegion!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        country = context as! Country
        
        print(country.name)
        
        let locationCoordinate = CLLocationCoordinate2D(latitude: country.latitude, longitude: country.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: 0)
        
        coordinate = MKCoordinateRegion(center: locationCoordinate, span: span)
    }

    
    // MARK: - Buttons Methods
    
    
    @IBAction func pressedCanada() {
        let result = isRightAnswer(userAnswer: .canada, rightAnswer: country)
        presentNextPage(result)
    }
    
    
    @IBAction func pressedEngland() {
        let result = isRightAnswer(userAnswer: .england, rightAnswer: country)
        presentNextPage(result)
    }
    
    @IBAction func pressedJapan() {
        let result = isRightAnswer(userAnswer: .japan, rightAnswer: country)
        presentNextPage(result)
    }
    
    @IBAction func pressedNewZealand() {
        let result = isRightAnswer(userAnswer: .newZealand, rightAnswer: country)
        presentNextPage(result)
    }
    
    
    // MARK: - Pressed Auxiliar Methods
    
    
    private func isRightAnswer(userAnswer: Country, rightAnswer: Country) -> Bool {
        return userAnswer == rightAnswer
    }
    
    private func presentNextPage(_ result: Bool) {
        if result {
            pushController(withName: "map", context: coordinate)
        }
        else {
            pushController(withName: "Errou", context: nil)
        }
    }
}
