//
//  CloseCarrousel.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 08.12.2022.
//

import SwiftUI
import Foundation

struct CloseCarrousel: View {
    
    let cards: [EventModel]
    let goToDetails: (String) -> Void
    
    init(cards: [EventModel], goToDetails: @escaping (String) -> Void) {
        self.cards = cards
        self.goToDetails = goToDetails
    }
    
    var body: some View {
        VStack(alignment:.leading){
            Text("Evenimente aproape de tine")
                .padding(.leading, 10)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(cards) { card in
                        EventCardMid(cover: card.imageURL, title: card.name, date: card.date, location: card.location, participants: card.participants)
                            .onTapGesture {
                                goToDetails(card.id ?? "")
                            }
                    }
                }.padding(.leading, 10)
            }
        }
    }
}
