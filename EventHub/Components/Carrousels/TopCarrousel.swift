//
//  TopCarrousel.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 29.11.2022.
//

import SwiftUI
import UIKit


struct TopCarrousel: View {
    
    var body: some View {
        VStack(alignment:.leading){
            Text("Top 10 evenimente in aceasta saptmana")
                .padding(.leading, 10)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    EventCardSmall(cover:"vango", title:"Vincent Van Gogh: \nO experienta imersiva", date:"26 OCT", time:"17:00" )
                    EventCardSmall(cover:"vango", title:"Vincent Van Gogh: \nO experienta imersiva", date:"26 OCT", time:"17:00")
                    EventCardSmall(cover:"vango", title:"Vincent Van Gogh: \nO experienta imersiva", date:"26 OCT", time:"17:00")
                }.padding(.leading, 10)
            }
        }
    }
}

struct TopCarrousel_Previews: PreviewProvider{
    static var previews: some View {
        TopCarrousel()
    }
}
