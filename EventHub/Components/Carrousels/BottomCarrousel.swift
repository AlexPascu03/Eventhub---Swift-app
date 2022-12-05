//
//  BottomCarrousel.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 30.11.2022.
//

import SwiftUI
import Foundation

struct BottomCarrousel: View {
    var body: some View {
        VStack(alignment:.leading){
            Text("Eveniment recomandat")
                .padding(.leading, 10)
            HStack{
                EventCardBig(cover:"gastro", title:"Curs de gastronomie: Cooking Around the World", date:"26 OCT",time:"17:00", location: "Arena Nationala")
            }
        }
    }
    
}

struct BottomCarrousel_Previews: PreviewProvider{
    static var previews: some View {
        ZStack{
            Color.gray
                .edgesIgnoringSafeArea(.all)
            BottomCarrousel()
        }
    }
}
