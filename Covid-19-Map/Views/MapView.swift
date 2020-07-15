//
//  MapView.swift
//  Covid-19-Map
//
//  Created by Duc Dang on 7/10/20.
//  Copyright © 2020 Duc Dang. All rights reserved.
//

import SwiftUI
import UIKit
import MapKit


struct MapView: UIViewRepresentable {
    
    @Binding var countryData: [CountryData]
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        
        var allAnnotations: [CoronanCaseAnootation] = []
        
        for data in countryData {
            
            let title = data.country + "\n Confirmed:  " + data.confirmed.formatNumber() + "\n Recovered: " + data.recovered.formatNumber() + "\n Death: " +  data.deaths.formatNumber()
            
            let coordinate = CLLocationCoordinate2D(latitude: data.latitude, longitude: data.longitude)
            
            allAnnotations.append(CoronanCaseAnootation(title: title, coordinate: coordinate))
        }
        uiView.annotations.forEach {uiView.removeAnnotation($0)}
        uiView.addAnnotations(allAnnotations)
    }
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        return MKMapView()
    }
}


class CoronanCaseAnootation: NSObject, MKAnnotation {
    
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, coordinate:CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
