//
//  TopCarrousel.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 29.11.2022.
//

import SwiftUI
import UIKit


struct TopCarrousel: View {
    
    let cards: [EventModel]
    let goToDetails: (String) -> Void
    
    init(cards: [EventModel], goToDetails: @escaping (String) -> Void) {
        self.cards = cards
        self.goToDetails = goToDetails
    }
    
    var body: some View {
        VStack(alignment:.leading){
            Text("Top 10 evenimente in aceasta saptmana")
                .padding(10)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(cards) { card in
                        EventCardSmall(cover:card.imageURL, title:card.name, date:card.date)
                            .onTapGesture {
                                goToDetails(card.id ?? "")
                            }
                    }
                }.padding(.leading, 10)
            }
        }
    }
}
