//
//  CustomInputs.swift
//  EventHub
//
//  Created by internship on 17.11.2022.
//

import SwiftUI
import UIKit

struct CustomInput: View {
    
    var placeholder: String
    var icon: String
    let prompt: String
    @Binding var value: String
    @Binding var hasError: Bool
    @State var isFocused: Bool = false
    @State private var animationAmount = 0
    
    init(placeholder: String , value: Binding<String>, icon: String, prompt: String, hasError: Binding<Bool>){
        self.placeholder = placeholder
        self._value = value
        self.icon = icon
        self.prompt = prompt
        self._hasError = hasError
    }
    
    var body: some View{
        
        HStack{
            ZStack(alignment: .leading){
                if !value.isEmpty {
                    Text(placeholder)
                        .foregroundColor(hasError ? Color.red : Color(.placeholderText))
                        .offset(y: value.isEmpty ? 0 : -10)
                        .font(.system(size:13))
                        .foregroundColor(hasError ? Color.red : Color.gray)
                        .animation(.spring(), value: animationAmount)
                }
                
                TextField(placeholder, text : $value) { focused in
                    if focused{
                        isFocused = true
                        animationAmount += 1
                    }
                    else{
                        isFocused = false
                    }
                }
                .textFieldStyle(PlainTextFieldStyle())
                .foregroundColor(hasError ? Color.red : Color.black)
                .frame(height: 64 )
                .cornerRadius(16)
                .offset(y: value.isEmpty ? 0 : 10)
                .font(.system(size:16))
                .autocapitalization(.none)
                .foregroundColor(hasError ? Color.red : Color(.placeholderText))
            }.padding([.leading], 10)
            
            Image(icon)
                .renderingMode(.template)
                .foregroundColor(hasError ? Color.red : Color.gray)
                .padding(.trailing,24)
                .frame(width:20 ,height: 16 )
            
        }.overlay(RoundedRectangle(cornerRadius: 16)
            .stroke(isFocused ? Color.EHPurple : Color.gray, lineWidth: isFocused ? 2 : 1 ))
        .autocorrectionDisabled()
        .overlay(RoundedRectangle(cornerRadius: 16)
            .stroke(hasError ? Color.red : Color.gray, lineWidth: hasError ? 2 : 1 ))
        .background(RoundedRectangle(cornerRadius: 15).fill(hasError ? Color.ErrRed : Color.white))
        
        if hasError{
            ErrorLabel(prompt: prompt)
        }
    }
}

struct CustomInput_Previews: PreviewProvider {
    static var previews: some View {
        CustomInput( placeholder:"Username" , value:.constant(""), icon:"Vector", prompt:"error", hasError: .constant(true))
    }
}
