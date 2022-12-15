//
//  EventDescription.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 08.12.2022.
//

import SwiftUI
import MapKit

struct EventDescriptionComponent: View {
    
    var description: String
    var name: String

    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image("dj")
                    .cornerRadius(50)
                VStack(alignment: .leading){
                    Text(name)
                        .bold()
                    Text("Organizator")
                }
                Spacer()
                Button{
                    print("profile")
                } label: {
                    Image("goTo")
                }
            }
            Text("Despre eveniment")
                .bold()
            Text(description)
            Text("Locatie")
                .bold()
                .padding(.top, 2)
            Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.058715, longitude: 21.927919),span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))), interactionModes: [])
                .frame(width: .infinity, height: 180)
                .cornerRadius(22)
            
        }
    }
}

//struct EventDescriptionComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        EventDescriptionComponent()
//    }
//}
