//
//  DetailsButton.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 08.12.2022.
//

import Foundation
import SwiftUI

struct DetailsButton: View {
    
    let action:() -> Void
    let text: String
    var leftIcon: String?
    let rightIcon: String?
    let btnType: ButtonType
    @State private var addPadding: Bool = false
    
    init(text: String, leftIcon: String? = nil, rightIcon: String? = nil, btnType: ButtonType, action: @escaping () -> Void){
        self.action = action
        self.text = text
        self.leftIcon = leftIcon
        self.rightIcon = rightIcon
        self.btnType = btnType
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack{
                Spacer()
                Label(text, image: leftIcon ?? "")
                    .bold()
                    .padding(.leading, rightIcon != nil ? 40 : 0)
                Spacer()
                Image(rightIcon ?? "")
            }
            .padding()
            .frame(width: 366, height: 64)
            .background(btnType.bgColor)
            .cornerRadius(16)
            .foregroundColor(btnType.labelColor)
            .overlay(RoundedRectangle(cornerRadius: 16)
                .stroke(btnType.borderColor, lineWidth: 1 ))
            .shadow(radius: 2)
        }
    }
    
}

struct DetailsButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DetailsButton(text: "VREAU SA PARTICIP", rightIcon: "star", btnType: .blue, action: {
                print("print")
            })
            DetailsButton(text: "PARTICIP", leftIcon: "particip", rightIcon: "dropdown", btnType: .white, action: {
                print("print")
            })
            DetailsButton(text: "NU PARTICIP", leftIcon: "icons", rightIcon: "dropdown", btnType: .white, action: {
                print("print")
            })
            DetailsButton(text: "EDITEAZA EVENIMENTUL", leftIcon: "edit", rightIcon: "dropdown", btnType: .white, action: {
                print("print")
            })
            DetailsButton(text: "ANULEAZA EVENIMENTUL", rightIcon: "anuleaza", btnType: .red, action: {
                print("print")
            })
            

        }
    }
}
