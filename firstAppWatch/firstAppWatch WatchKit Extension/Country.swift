//
//  Country.swift
//  firstAppWatch
//
//  Created by Felipe Rodrigues on 04/09/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import Foundation
import CoreLocation

enum Country: Int {
    case canada = 0, england, japan, newZealand
    
    var name: String {
        let names = ["Canadá", "Inglaterra", "Japão", "Nova Zelândia"]
        
        return names[rawValue]
    }
    
    var anthem: String {
        let anthems = ["canada_hino", "inglaterra_hino", "japao_hino", "nova_zelandia_hino"]
        
        return anthems[rawValue]
    }
    
    var latitude: CLLocationDegrees {
        let latitudes = [56.130366, 52.3555177, 36.204824, -71.762426]
        
        return latitudes[rawValue]
    }
    
    var longitude: CLLocationDegrees {
        let longitudes = [-106.346771, -1.1743197, 138.252924, 171.386719]
        
        return longitudes[rawValue]
    }
}
