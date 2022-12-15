//
//  RelatedCarrousel.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 14.12.2022.
//
import SwiftUI
import Foundation

struct RelatedCarrousel: View {
    
    let cards: [EventModel]
    let goToDetails: (String) -> Void
    
    init(cards: [EventModel], goToDetails: @escaping (String) -> Void) {
        self.cards = cards
        self.goToDetails = goToDetails
    }
    
    var body: some View {
        VStack(alignment:.leading){
            Text("Evenimente asemanatoare")
                .padding(.leading, 10)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(cards) { card in
                        EventCardMid(cover: card.imageURL, title: card.name, date: card.date, location: card.location, participants: card.participants)
                            .onTapGesture {
                                goToDetails(card.id ?? "")
                            }
                    }
                }
            }
        }
    }
    
}

struct RelatedCarrousel_Previews: PreviewProvider{
    static var previews: some View {
        ZStack{
            Color.gray
                .edgesIgnoringSafeArea(.all)
            // RelatedCarrousel()
        }
    }
}
