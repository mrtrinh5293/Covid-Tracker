//
//  RecentUIView.swift
//  Covid-19-Map
//
//  Created by Duc Dang on 7/10/20.
//  Copyright © 2020 Duc Dang. All rights reserved.
//

import SwiftUI


struct RecentUIView: View {
    
    @ObservedObject var covidFetch = CovidFetchRequest()
//    @ObservedObject var test = CountryS
    
    @State var searchText = ""
    @State var isSearchVisible = false
    
    var body: some View {
        
        NavigationView{
            
            VStack {
                
                if isSearchVisible {
                    SearchView(searchText: $searchText)
                }
                
                TotalDataView(totalData: covidFetch.totalData)
                ListHeaderView()
                
                List {
                    ForEach(covidFetch.allCountries.filter {
                        self.searchText.isEmpty ? true: $0.country.lowercased().contains(self.searchText.lowercased())
                    }, id: \.country) { countryData in
                        
                        NavigationLink(destination: CountryDetailView(countryName: countryData.country)) {
                            CountryDataRowView(countryData: countryData)
                        }
                    }
                }
            } // End of VStack
                .navigationBarTitle("Covid Tracker - Alpha", displayMode: .inline)
                .navigationBarItems(trailing:
                    Button(action: {
                        self.isSearchVisible.toggle()
                        
                        if !self.isSearchVisible {
                            // When search, text will be blanked
                            self.searchText = ""
                        }
                        
                    }, label: {
                        Image(systemName: "magnifyingglass")
                    }))
        } // end of NavView
        
    }
}

struct RecentUIView_Previews: PreviewProvider {
    static var previews: some View {
        RecentUIView()
    }
}
