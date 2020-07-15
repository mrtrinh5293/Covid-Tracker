//
//  TotalDataView.swift
//  Covid-19-Map
//
//  Created by Duc Dang on 7/10/20.
//  Copyright © 2020 Duc Dang. All rights reserved.
//

import SwiftUI

struct TotalDataView: View {
    
    var totalData: TotalData
    
    var body: some View {
        VStack {
            Text("Last Update: \(totalData.lastUpdate)").font(.footnote)
            
            HStack {
                TotalDataCard(number: totalData.confirmed.formatNumber(), name: "Case Confirmed", color: .primary)
                
                TotalDataCard(number: totalData.critical.formatNumber(), name: "Critical", color: .yellow)
                
                TotalDataCard(number: totalData.deaths.formatNumber(), name: "Deaths", color: .red)
            } .padding(.bottom, 20)
            
            HStack {
                TotalDataCard(number: String(format: "%.2f", totalData.fatalityRate), name: "Death %", color: .red)
                
                TotalDataCard(number: totalData.confirmed.formatNumber(), name: "Recovered", color: .green)
                
                TotalDataCard(number: String(format: "%.2f", totalData.recoverRate), name: "Recovered %", color: .green)
            }
            
        } .frame( height: 185 )
            .padding(10)
    }
}

struct TotalDataView_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataView(totalData: testTotalData)
    }
}
