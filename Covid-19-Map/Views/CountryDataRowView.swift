//
//  CountryDataRowView.swift
//  Covid-19-Map
//
//  Created by Duc Dang on 7/10/20.
//  Copyright © 2020 Duc Dang. All rights reserved.
//

import SwiftUI

struct CountryDataRowView: View {
    
    var countryData: CountryData
    
    var body : some View {
        
        HStack {
            Text(countryData.country)
                .font(.subheadline)
                .frame(width: 90, height: 30, alignment: .leading)
                .padding(.leading, 5)
            
            Spacer()
            
            Text(countryData.confirmed.formatNumber())
                .lineLimit(1)
                .minimumScaleFactor(0.7)
                .font(.subheadline)
                .frame(width: 90, height: 30)
                .padding(.leading, 5)
            
            Spacer()
            
            Text(countryData.deaths.formatNumber())
                .lineLimit(1)
                .minimumScaleFactor(0.7)
                .font(.subheadline)
                .frame(width: 60,height: 30).foregroundColor(.red)
                .padding(.leading, 5)
            
            Spacer()
            
            Text(countryData.recovered.formatNumber())
                .lineLimit(1)
                .minimumScaleFactor(0.7)
                .font(.subheadline).frame(width: 100,height: 30).foregroundColor(.green)
                .padding(.trailing , 0)
            
            
        }
    }
}

struct CountryDataRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDataRowView(countryData: testCountryData)
    }
}
