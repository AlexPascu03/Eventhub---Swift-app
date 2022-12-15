//
//  CustomButon.swift
//  EventHub
//
//  Created by internship on 17.11.2022.
//

import SwiftUI

struct CustomButton: View {
    
    let action:() -> Void
    let text : String
    
    init(text:String , action: @escaping () -> Void){
        self.action = action
        self.text = text
    }
    
    var body: some View {
        Button(action : {
            action()
        })
        {
            Text(text)
        }
        .padding()
        .frame(minWidth: 0, maxWidth: 340)
        .background(Color.ehPurple)
        .cornerRadius(20)
        .foregroundColor(.white)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomButton(text: "Log in", action: {
                print("print")
            })
            CustomButton(text:"Register" ,action: {
                print("asd")})
        }
    }
}
