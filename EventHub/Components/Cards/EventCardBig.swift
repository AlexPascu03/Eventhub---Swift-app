//
//  EventCardBig.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 30.11.2022.
//

import SwiftUI
import UIKit

struct EventCardBig: View {
    
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
                .frame(width:366, height: 379)
                .foregroundColor(.white)
            VStack(alignment: .leading){
                AsyncImage(url: URL(string: cover)) { image in
                    image.resizable(resizingMode: .stretch)
                } placeholder: {
                    Color.black
                }
                .scaledToFill()
                .frame(width:350, height: 260)
                .cornerRadius(20)
                
                VStack(alignment: .leading){
                    Text(title)
                        .frame(width:350, height: 40, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .font(.system(size:16))
                        .fontWeight(.bold)
//                        .padding(.bottom, 4)
                    HStack{
                        Text(DateFormatter.dayAndMonth.string(from: date).uppercased())
                            .foregroundColor(Color.ehPurple)
                            .font(.system(size:13))
                        Circle()
                            .frame(width: 4)
                            .foregroundColor(.ehPurple)
                        
                        Text(DateFormatter.hourAndMinutes.string(from: date).uppercased())
                            .foregroundColor(Color.ehPurple)
                            .font(.system(size:13))
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
            }
            
        }
    }
}

struct EventCardBig_Previews: PreviewProvider{
    static var previews: some View{
        ZStack{
            Color.gray
                .edgesIgnoringSafeArea(.all)
            EventCardBig(cover:"gastro", title:"Curs de gastronomie - Cooking around the world", date:Date(), location: "Arena Nationala", participants: 100)
        }
    }
}
