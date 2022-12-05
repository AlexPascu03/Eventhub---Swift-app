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
    var date: String = ""
    var time: String = ""
    var location: String = ""
    
    init(cover: String, title: String, date: String, time: String, location: String) {
        self.cover = cover
        self.title = title
        self.date = date
        self.time = time
        self.location = location
    }
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width:306, height:306)
                .foregroundColor(.white)
            VStack(alignment: .leading){
                Image(cover)
                    .resizable()
                    .frame(width:300, height: 160)
                    .cornerRadius(20)
                    .padding(.bottom, 25)
                VStack(alignment: .leading){
                    Text(title)
                        .font(.system(size:16))
                        .fontWeight(.bold)
                        .padding(.bottom, 4)
                    HStack{
                        Text(date)
                            .foregroundColor(Color.EHPurple)
                            .font(.system(size:14))
                        Circle()
                            .frame(width: 4)
                            .foregroundColor(.EHPurple)
                        Text(time)
                            .foregroundColor(Color.EHPurple)
                            .font(.system(size:14))
                        Circle()
                            .frame(width: 4)
                            .foregroundColor(.EHPurple)
                        Text(location)
                            .foregroundColor(Color.EHPurple)
                            .font(.system(size:14))
                    }
                    Text("bubbles 2.5k participanti")
                        .font(.system(size:13))
                        .foregroundColor(Color.gray)
                        .padding(.bottom, 12)
                    
                    
                }.frame(width: .infinity)
                    .padding(.leading, 5)
            }
        }
    }
}

struct EventCardMid_Previews: PreviewProvider{
    static var previews: some View{
        ZStack{
            Color.gray
                .edgesIgnoringSafeArea(.all)
            EventCardMid(cover:"depeche", title:"Depeche Modee in Bucuresti -\nMemento Mori Tour", date:"26 OCT",time:"17:00", location: "Arena Nationala")
        }
    }
}
