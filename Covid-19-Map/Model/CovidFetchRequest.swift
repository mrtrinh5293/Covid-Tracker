//
//  CovidFetchRequest.swift
//  Covid-19-Map
//
//  Created by Duc Dang on 7/9/20.
//  Copyright © 2020 Duc Dang. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class CovidFetchRequest: ObservableObject {
    
    // Return function is calling it
    // For everything that listen to this function
    
    @Published var totalData: TotalData = testTotalData // totalData has type of TotalData
    @Published var allCountries: [CountryData] = []
    
    let headers: HTTPHeaders = [
        
        "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
        
        "x-rapidapi-key": "d172e810e7msh47584ae043c146dp12d8eejsnb0b3c42c4a59"
        
    ]
    
    init() {
        
        getAllCountries()
        getCurrentTotal()
    }
    
    func getCurrentTotal() {
        
        AF.request("https://covid-19-data.p.rapidapi.com/totals?format=undefined", headers: headers).responseJSON { response in
            
            let result = response.data
            
            if result != nil {
                let json = JSON(result!)
                print(json)
                
                let confirmed = json[0]["confirmed"].intValue
                let deaths = json[0]["deaths"].intValue
                let recovered = json[0]["recovered"].intValue
                let critical = json[0]["critical"].intValue
                let lastUpdate = json[0]["lastUpdate"].stringValue
                
                //            let lastChange = json[0]["lastChange"].stringValue
                
                // When/Whereever call this data is going to inform this piece of information
                
                
                self.totalData = TotalData(confirmed: confirmed, critical: critical, deaths: deaths, recovered: recovered,lastUpdate:lastUpdate)
                
            } else {
                self.totalData = testTotalData
            }
        }
    }
    
    func getAllCountries() {
        
        AF.request("https://covid-19-data.p.rapidapi.com/country/all?format=undefined", headers: headers).responseJSON { response in
            
            let result = response.value
            var allCount: [CountryData] = []
            
            if result != nil {
                
                // Specify result
                let dataDictonary = result as! [Dictionary<String, AnyObject>]
                
                for countryData in dataDictonary
                {
                    let country = countryData["country"] as? String ?? "Error"
                    let longitude = countryData["longitude"] as? Double ?? 0.0
                    let latitude = countryData["latitude"] as? Double ?? 0.0
                    
                    let confirmed = countryData["confirmed"] as? Int64 ?? 0
                    let deaths = countryData["deaths"] as? Int64 ?? 0
                    let recovered = countryData["recovered"] as? Int64 ?? 0
                    let critical = countryData["critical"] as? Int64 ?? 0
                    
                    let countryObject = CountryData(country: country, confirmed: confirmed, critical: critical, deaths: deaths, recovered: recovered, longitude: longitude, latitude: latitude)
                    
                    allCount.append(countryObject)
                }
            }
            
            // bring the most confirmed cases to the top
            // sort by the first imte $0 is more than second $1
            self.allCountries = allCount.sorted(by: {$0.confirmed > $1.confirmed})
            
            
        }
    }
}
