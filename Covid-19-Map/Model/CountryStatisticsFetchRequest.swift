//
//  CountryStatisticsFetchRequest.swift
//  Covid-19-Map
//
//  Created by Duc Dang on 7/12/20.
//  Copyright © 2020 Duc Dang. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CountryStatisticsFetchRequest: ObservableObject {
    
    // Return function is calling it
    // For everything that listen to this function
    
    @Published var countryDetailsData: CountryDetailsData?
    
    let headers: HTTPHeaders = [
        
        "x-rapidapi-host": "covid-193.p.rapidapi.com",
        
        "x-rapidapi-key": "d172e810e7msh47584ae043c146dp12d8eejsnb0b3c42c4a59"
        
    ]
    
    init() {
        // return model
//        getStatsFor(country: "usa")
        
    }
    
    func getStatsFor(country: String) {
        
        AF.request("https://covid-193.p.rapidapi.com/statistics?country=\(country)", headers: headers).responseJSON { response in
            
            let result = response.data
            
            if result != nil {
                let json = JSON(result!)
//                print(json["response"])
                
                let country = json["response"][0]["country"].stringValue
                let deaths = json["response"][0]["deaths"]["total"].intValue
                let newDeaths = json["response"][0]["deaths"]["new"].intValue
                
                let tests = json["response"][0]["tests"]["total"].intValue
                let criticalCases = json["response"][0]["cases"]["critical"].intValue
                let totalCases = json["response"][0]["cases"]["total"].intValue
                let activeCases = json["response"][0]["cases"]["active"].intValue
                let newCases = json["response"][0]["cases"]["new"].intValue
                let recoveredCases = json["response"][0]["cases"]["recovered"].intValue
//                let testDone = json["response"][0]["tests"]["total"]
                
                self.countryDetailsData = CountryDetailsData(country: country,confirmedCases: totalCases , newCases: newCases, recoveredCases: recoveredCases, criticalCases: criticalCases, activeCases: activeCases, deaths: deaths, newDeaths: newDeaths, testDone: tests)
            } else {
                
            }
        }
    }
}
