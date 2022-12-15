//
//  EventDetailsHeaderComponent.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 08.12.2022.
//

import SwiftUI

struct EventDetailsHeaderComponent: View {
    
    let title: String
    let participants: Int
    
    var body: some View {
        VStack(alignment:.leading){
            Text(title)
                .font(.system(size: 24))
                .frame(width: .infinity, height: 58)
                .bold()
            HStack{
                Image("Frame 78")
                Text(String(participants) + " participanti")                    .font(.system(size: 14))
            }
            
            DetailsButton(text: "VREAU SA PARTICIP", leftIcon: "", rightIcon: "star", btnType: .blue, action: {
                print("print")
            })
        }
    }
}

struct EventDetailsHeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailsHeaderComponent(title: "Title", participants: 22)
    }
}
