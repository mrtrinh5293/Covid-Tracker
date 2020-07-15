//
//  CountryDetailView.swift
//  Covid-19-Map
//
//  Created by Duc Dang on 7/10/20.
//  Copyright © 2020 Duc Dang. All rights reserved.
//

import SwiftUI

struct CountryDetailView: View {
    
    @ObservedObject var countryStatisticsRequest = CountryStatisticsFetchRequest()
    var countryName: String
    
    var body: some View {
        
        VStack {
            
            Text("\(countryName)").font(.headline).padding(.bottom, 20)
            
            VStack {
                CountryDetailRow(number: countryStatisticsRequest.countryDetailsData?.confirmedCases.formatNumber() ?? "Error", name: "Total Cases", color: .primary).font(.title)
                
                CountryDetailRow(number: countryStatisticsRequest.countryDetailsData?.recoveredCases.formatNumber() ?? "Error", name: "Recovered", color: .green)
                
                
                CountryDetailRow(number: countryStatisticsRequest.countryDetailsData?.activeCases.formatNumber() ?? "Error", name: "Active Cases", color: .yellow)
                
                
                CountryDetailRow(number: countryStatisticsRequest.countryDetailsData?.newCases.formatNumber() ?? "Error", name: "New Cases", color: .orange)
                
                
                CountryDetailRow(number: countryStatisticsRequest.countryDetailsData?.criticalCases.formatNumber() ?? "Error", name: "Critical Cases", color: .yellow)
                
                
                CountryDetailRow(number: (countryStatisticsRequest.countryDetailsData?.deaths.formatNumber() ?? "Error"), name: "Deaths", color: .red)
                
                CountryDetailRow(number: "+" +  (countryStatisticsRequest.countryDetailsData?.newDeaths.formatNumber() ?? "Error"), name: "New Deaths", color: .red)
                
                CountryDetailRow(number: countryStatisticsRequest.countryDetailsData?.testDone.formatNumber() ?? "Error", name: "Test Done", color: .primary)
                
                
            } .background(Color("cardBackgroundGray"))
                .cornerRadius(10.0)
                .padding()
            
            Spacer()
        }
        .padding(.top, 50)
        .onAppear() {
            self.getStatistics()
        }
        
    }
    
    private func getStatistics() {
        countryStatisticsRequest.getStatsFor(country: self.countryName.replacingOccurrences(of: " ", with: "-"))
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
