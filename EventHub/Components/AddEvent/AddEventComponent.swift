//
//  AddEventComponent.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 30.11.2022.
//

import Foundation
import SwiftUI

struct AddEventComponent: View {
    
    
    var body: some View {
        HStack{
            VStack(alignment:.leading){
                Text("Nu ai gasit nimic pe placul tau?")
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .bold(true)
                    .padding(.horizontal, 20)
                    .padding(.top, 19)
                Text("Organizeaza un eveniment!")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 19)
            }
            Spacer()
            Image("Add")
                .padding(.horizontal, 20)
        }.frame(width: .infinity , height: .infinity)
            .background(LinearGradient(colors: [Color.DashColor1, Color.DashColor2], startPoint: .top, endPoint: .bottom))
            .cornerRadius(15)
            .shadow(radius: 5)
            .padding(.horizontal, 10)
    }
}

struct AddEventComponent_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            VStack{
                Spacer()
                AddEventComponent()
                Spacer()
            }
        }.ignoresSafeArea()
    }
}
