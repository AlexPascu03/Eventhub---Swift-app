//
//  MidCarrousel.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 30.11.2022.
//

import SwiftUI
import Foundation

struct MidCarrousel: View {
    var body: some View {
        VStack(alignment:.leading){
            Text("Evenimente populare")
                .padding(.leading, 10)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    EventCardMid(cover:"depeche", title:"Depeche Modee in Bucuresti -\nMemento Mori Tour", date:"26 OCT",time:"17:00", location: "Arena Nationala")
                    EventCardMid(cover:"depeche", title:"Depeche Modee in Bucuresti -\nMemento Mori Tour", date:"26 OCT",time:"17:00", location: "Arena Nationala")
                    EventCardMid(cover:"depeche", title:"Depeche Modee in Bucuresti -\nMemento Mori Tour", date:"26 OCT",time:"17:00", location: "Arena Nationala")
                }.padding(.leading, 10)
            }
        }
    }
}

struct MidCarrousel_Previews: PreviewProvider{
    static var previews: some View {
        MidCarrousel()
    }
}
