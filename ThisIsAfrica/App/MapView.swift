//
//  MapView.swift
//  ThisIsAfrica
//
//  Created by IKAKOOO on 12/20/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: PROPERTIES
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: - BODY
    var body: some View {
        Map(coordinateRegion: $region,annotationItems: locations,annotationContent: { item in
          //  MapPin(coordinate: item.location, tint: .accentColor)
          //  MapMarker(coordinate: item.location, tint: .accentColor)
            
//            MapAnnotation(coordinate: item.location){
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32,height: 32,alignment: .center)
//            }
            
            MapAnnotation(coordinate: item.location){
                MapAnotationView(location: item)
            }
        }) // MAP:
        .overlay(
            HStack( alignment: .center, spacing: 12 ) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3){
                    HStack {
                        Text("Latitute:")
                            .font(.footnote)
                            .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                        
                        Spacer()
                        Text("\(region.center.latitude)")
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                        
                        Spacer()
                        Text("\(region.center.longitude)")
                    }
                }
            } //: HStack
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(Color.black.cornerRadius(8).opacity(0.6))
                .padding()
            , alignment: .top
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
