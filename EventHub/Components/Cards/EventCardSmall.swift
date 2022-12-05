//
//  EventCardSmall.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 29.11.2022.
//

import SwiftUI
import UIKit

struct EventCardSmall: View {
    
    var cover: String = ""
    var title: String = ""
    var date: String = ""
    var time: String = ""
    
    init(cover: String, title: String, date: String, time: String) {
        self.cover = cover
        self.title = title
        self.date = date
        self.time = time
    }
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width:175, height:189)
                .foregroundColor(.white)
            VStack{
                Image(cover)
                    .cornerRadius(20)
                VStack(alignment: .leading){
                    
                    Text(title)
                        .font(.system(size:13))
                        .fontWeight(.bold)
                        .padding(.bottom, 2)
                    HStack{
                        Text(date)
                            .foregroundColor(Color.EHPurple)
                            .font(.system(size:13))
                        Circle()
                            .frame(width: 4)
                            .foregroundColor(.EHPurple)
                        
                        Text(time)
                            .foregroundColor(Color.EHPurple)
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
            EventCardSmall(cover:"vango", title:"Vincent Van Gogh: \nO experienta imersiva", date:"26 OCT", time:"17:00")
        }
    }
}
