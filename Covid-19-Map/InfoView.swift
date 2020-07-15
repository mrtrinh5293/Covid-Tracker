//
//  InfoView.swift
//  Covid-19-Map
//
//  Created by Duc Dang on 7/10/20.
//  Copyright © 2020 Duc Dang. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        HStack {
            
            VStack {
                Text("Description").padding(10).frame(width: 120, height: 100)
                Text("Credit").padding(10).frame(width: 120)
                Text("Version").padding(10).frame(width: 120)
                
            }.font(.headline)
            VStack {
                Text("A simple Covid19 Statistics tracking app by Country").padding(10).frame(width: 200, alignment: .center)
                Text("Duc Dang").padding(10).frame(width: 200, alignment: .leading)
                Text("1.0.0-alpha").padding(10).frame(width: 200, alignment: .leading)
                
            }
        }.background(Color("cardBackgroundGray"))
        .cornerRadius(10.0)
        .padding(10)
        
    }

}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
