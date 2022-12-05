//
//  TopComponentView.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 29.11.2022.
//

import SwiftUI

struct TopComponent: View {
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    VStack (alignment: .leading){
                        DateTemp()
                        Text("Oradea, Romania")
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                            .bold(true)
                    }
                    Spacer()
                    Label("Schimba", image:"papperplane" )
                        .font(.system(size:13))
                        .foregroundColor(Color.DashTextPr)
                }
                SearchBar(placeholder: "Cauta evenimente", icon: "Search", value: .constant(""))
                    .padding(.bottom, 16)
                FilterButtons()
            }
            .padding(.horizontal, 18)
            .padding(.top, 60)
            .padding(.bottom, 25)
        }
        .frame(width: .infinity , height: .infinity)
        .background(LinearGradient(colors: [Color.DashColor1, Color.DashColor2], startPoint: .top, endPoint: .bottom))
        .cornerRadius(30)
        .shadow(radius: 5)
    }
}

struct TopComponent_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            VStack{
                ZStack{
                    Color.gray
                        .edgesIgnoringSafeArea(.all)
                    TopComponent()
                    Spacer()
                }
            }
        }.ignoresSafeArea()
    }
}


