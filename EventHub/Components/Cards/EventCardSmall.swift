//
//  EventCardSmall.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 29.11.2022.
//

import SwiftUI
import UIKit

struct EventCardSmall: View {
    
    var cover: String
    var title: String
    var date: Date
    
    init(cover: String, title: String, date: Date) {
        self.cover = cover
        self.title = title
        self.date = date
    }
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width:175, height:189)
                .foregroundColor(.white)
            VStack{
                AsyncImage(url: URL(string: cover)) { image in
                    image.resizable(resizingMode: .stretch)
                } placeholder: {
                    Color.black
                }
                .scaledToFit()
                .frame(width: 159, height: 109)
                .cornerRadius(20)
                VStack(alignment: .leading){
                    Text(title)
                        .font(.system(size:13))
                        .fontWeight(.bold)
                        .frame(width: 155, height: 36, alignment: .topLeading)
                        .padding(.bottom, 2)
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
                    }
                }
            }
        }
    }
}

struct EventCardSmall_Previews: PreviewProvider{
    static var previews: some View{
        ZStack{
            Color.gray
                .edgesIgnoringSafeArea(.all)
            EventCardSmall(cover:"vango", title:"Vincent Van Gogh: \nO experienta imersiva", date:Date() )
        }
    }
}
