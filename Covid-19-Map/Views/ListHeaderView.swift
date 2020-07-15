//
//  ListHeaderView.swift
//  Covid-19-Map
//
//  Created by Duc Dang on 7/10/20.
//  Copyright © 2020 Duc Dang. All rights reserved.
//

import SwiftUI

struct ListHeaderView: View {
    var body: some View {
        
        HStack {
            
            Text("Country").fontWeight(.bold)
                .font(.subheadline)
                .frame(width: 90, height: 40, alignment: .leading)
                .padding(.leading, 10)
            
            Spacer()
            
            Text("Confirmed").fontWeight(.bold)
            .font(.subheadline)
            .padding(.leading, 5)
            
            Spacer()
            
            Text("Deaths").fontWeight(.bold)
            .font(.subheadline)
            .padding(.leading, 5)
            
            Spacer()
            
            Text("Recovered").fontWeight(.bold)
            .font(.subheadline)
            .padding(.trailing, 30)
            
        }
        .background(Color("cardBackgroundGray"))
        
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView()
    }
}
