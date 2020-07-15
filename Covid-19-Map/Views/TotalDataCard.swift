//
//  TotalDataCard.swift
//  Covid-19-Map
//
//  Created by Duc Dang on 7/10/20.
//  Copyright © 2020 Duc Dang. All rights reserved.
//

import SwiftUI

struct TotalDataCard: View {
    
    var number: String = "Err"
    var name: String = "Confirmed"
    var color: Color = .primary
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack {
                Text("\(self.number)")
                    .font(.subheadline)
                    .padding(5)
                    .foregroundColor(self.color)
                Text("\(self.name)")
                    .font(.subheadline)
                    .padding(5)
                    .foregroundColor(self.color)
            } // End of VStack
                .frame(width: geometry.size.width, height: 80, alignment: .center)
                .background(Color("cardBackgroundGray"))
                .cornerRadius(10.0)
        } // End of View
    }
}

struct TotalDataCard_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataCard()
    }
}
