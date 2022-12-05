//
//  CustomInputs.swift
//  EventHub
//
//  Created by internship on 17.11.2022.
//

import SwiftUI
import UIKit

struct SearchBar: View {
    
    var placeholder: String
    var icon: String
    @Binding var value: String
    
    var body: some View{
        HStack{
            HStack{
                Image(icon)
                    .padding([.leading], 10)
                ZStack(alignment: .leading){
                    if value.isEmpty{
                        Text(placeholder)
                            .foregroundColor(Color.DashTextPr)
                    }
                    TextField("", text: $value)
                }
            }
            .frame(width: 308, height: 40)
            .background(Capsule().fill(Color.DashColor1))
            Image("filter")
                .frame(width: 40, height: 40)
                .background(Capsule().fill(Color.DashColor1))
        }.frame(width: 360, height: 40)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(placeholder: "Cauta evenimente", icon: "Search" , value: .constant(""))
    }
}


