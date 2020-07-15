//
//  SearchView.swift
//  Covid-19-Map
//
//  Created by Duc Dang on 7/10/20.
//  Copyright © 2020 Duc Dang. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        
        HStack {
            TextField("Country...", text: $searchText)
                .padding()
        }
        .frame(height: 50)
        .background(Color("cardBackgroundGray"))
        .cornerRadius(10.0)
    .padding(10)
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView(searchText: <#Binding<String>#>)
//    }
//}
