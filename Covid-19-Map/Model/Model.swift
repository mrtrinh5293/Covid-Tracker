//
//  Model.swift
//  Covid-19-Map
//
//  Created by Duc Dang on 7/9/20.
//  Copyright © 2020 Duc Dang. All rights reserved.
//

import Foundation

struct TotalData {
    
    let confirmed: Int
    let critical: Int
    let deaths: Int
    let recovered: Int
    let lastUpdate: String
    
//    let lastChange = String
    
    var fatalityRate: Double {
        return (100.00 * Double(deaths)) / Double(confirmed)
    }

    
    var recoverRate: Double {
        return (100.00 * Double(recovered)) / Double(confirmed)
        
    }
}
struct CountryData {
    
    let country: String
    let confirmed: Int64
    let critical: Int64
    let deaths: Int64
    let recovered: Int64
    let longitude: Double
    let latitude: Double
    
    var fatalityRate: Double {
        return (100.00 * Double(deaths)) / Double(confirmed)
    }
    
    var recoverRate: Double {
        return (100.00 * Double(recovered)) / Double(confirmed)
    }
    
}

struct CountryDetailsData {
    
    let country: String
    let confirmedCases: Int
    let newCases: Int
    let recoveredCases: Int
    let criticalCases: Int
    let activeCases: Int
    
    let deaths: Int
    let newDeaths: Int
    let testDone: Int
    
}

let testTotalData = TotalData(confirmed: 200, critical: 100, deaths: 20, recovered: 50,lastUpdate: "today")

let testCountryData = CountryData(country: "VietNam", confirmed: 3000, critical: 3000, deaths: 3000, recovered: 3000, longitude: 3000, latitude: 3000)
