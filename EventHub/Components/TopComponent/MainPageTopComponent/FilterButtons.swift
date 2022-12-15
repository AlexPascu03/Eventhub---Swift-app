//
//  FilterButtons.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 29.11.2022.
//

import SwiftUI
import UIKit

struct FilterButtons: View {
    
    var body: some View{
        HStack{
            Button("Astazi"){
                print("astazi")
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .background(Capsule().fill(Color.dashGreen))
            .foregroundColor(.white)
            .font(.system(size: 13))
            Spacer(minLength: 1)
            Button("Maine"){
                print("astazi")
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .background(Capsule().fill(Color.dashOrange))
            .foregroundColor(.white)
            .font(.system(size: 13))
            Spacer(minLength: 1)
            Button("Saptamana aceasta"){
                print("astazi")
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .background(Capsule().fill(Color.dashRed))
            .foregroundColor(.white)
            .font(.system(size: 13))
        }
    }
}
struct FilterButtons_Previews: PreviewProvider {
    static var previews: some View {
        FilterButtons()
    }
}

func FilterToday(){
}

