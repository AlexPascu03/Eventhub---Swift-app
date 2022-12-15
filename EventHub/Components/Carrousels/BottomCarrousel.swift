//
//  BottomCarrousel.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 30.11.2022.
//

import SwiftUI
import Foundation

struct BottomCarrousel: View {
    
    let cards: [EventModel]
    let goToDetails: (String) -> Void
    
    init(cards: [EventModel], goToDetails: @escaping (String) -> Void) {
        self.cards = cards
        self.goToDetails = goToDetails
    }
    
    var body: some View {
        VStack(alignment:.leading){
            Text("Eveniment recomandat 🌟")
                .padding(.leading, 10)
            HStack{
                ForEach(cards) { card in
                    EventCardBig(cover: card.imageURL, title: card.name, date: card.date, location: card.location, participants: card.participants)
                        .onTapGesture {
                            goToDetails(card.id ?? "")
                        }
                }
            }
        }
    }
    
}

struct BottomCarrousel_Previews: PreviewProvider{
    static var previews: some View {
        ZStack{
            Color.gray
                .edgesIgnoringSafeArea(.all)
           // BottomCarrousel()
        }
    }
}
