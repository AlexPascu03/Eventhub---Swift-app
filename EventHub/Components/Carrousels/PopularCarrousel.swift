//
//  MidCarrousel.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 30.11.2022.
//

import SwiftUI
import Foundation

struct PopularCarrousel: View {
    
    let cards: [EventModel]
    let goToDetails: (String) -> Void
    
    init(cards: [EventModel], goToDetails: @escaping (String) -> Void) {
        self.cards = cards
        self.goToDetails = goToDetails
    }    
    
    var body: some View {
        VStack(alignment:.leading){
            Text("Evenimente populare 🔥")
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


