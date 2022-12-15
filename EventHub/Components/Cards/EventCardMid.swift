//
//  EventCardMid.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 29.11.2022.
//

import SwiftUI
import UIKit

struct EventCardMid: View {
    
    var cover: String = ""
    var title: String = ""
    var date: Date = Date()
    var location: String = ""
    var participants: Int = 0
    
    init(cover: String, title: String, date: Date, location: String, participants: Int) {
        self.cover = cover
        self.title = title
        self.date = date
        self.location = location
        self.participants = participants
    }
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width:306, height:282)
                .foregroundColor(.white)
            VStack{
                AsyncImage(url: URL(string: cover)) { image in
                    image.resizable(resizingMode: .stretch)
                } placeholder: {
                    Color.black
                }
                .scaledToFill()
                .frame(width:300, height: 160)
                .cornerRadius(20)
                VStack(alignment: .leading){
                    Text(title)
                        .font(.system(size:16))
                        .fontWeight(.bold)
                    HStack{
                        Text(DateFormatter.dayAndMonth.string(from: date).uppercased())
                            .foregroundColor(Color.ehPurple)
                            .font(.system(size:14))
                        Circle()
                            .frame(width: 4)
                            .foregroundColor(.ehPurple)
                        
                        Text(DateFormatter.hourAndMinutes.string(from: date).uppercased())
                            .foregroundColor(Color.ehPurple)
                            .font(.system(size:14))
                        Circle()
                            .frame(width: 4)
                            .foregroundColor(.ehPurple)
                        Text(location)
                            .foregroundColor(Color.ehPurple)
                            .font(.system(size:14))
                    }
                    HStack {
                        Image("Frame 78")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 64, height: 24)
                            .padding(.leading, 10)
                        
                        Text(String(participants) + " participanti")
                            .font(.system(size:13))
                            .padding(.leading, 10)
                    }
                }.frame(width: .infinity)
                    .padding(.leading, 5)
                    .padding(.trailing, 55)
            }
        }
    }
}

struct EventCardMid_Previews: PreviewProvider{
    static var previews: some View{
        ZStack{
            Color.gray
                .edgesIgnoringSafeArea(.all)
            EventCardMid(cover:"depeche", title:"Depeche Modee in Bucuresti -\nMemento Mori Tour", date:Date(), location: "Arena Nationala", participants: 23)
        }
    }
}
