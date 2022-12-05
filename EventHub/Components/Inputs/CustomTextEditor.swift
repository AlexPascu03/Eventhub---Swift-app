//
//  CustomTextEditor.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 30.11.2022.
//

import SwiftUI
import UIKit

struct CustomTextEditor: View {
    
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
            ZStack{
                if value.isEmpty{
                    VStack{
                        Text(placeholder)
                            .foregroundColor(hasError ? Color.red : Color(.placeholderText))
                            .font(.system(size:16))
                            .foregroundColor(hasError ? Color.red : Color.gray)
                            .animation(.spring(), value: animationAmount)
                    }
                    .frame(width: 300 ,height: 125, alignment: .topLeading)
                }
                TextEditor(text: $value)
                    .scrollContentBackground(.hidden)
                    .multilineTextAlignment(.leading)
                    .scrollDisabled(false)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(hasError ? Color.red : Color.black)
                    .frame(height: 140, alignment: .top)
                    .font(.system(size:16))
                    .autocapitalization(.none)
                    .foregroundColor(hasError ? Color.red : Color(.placeholderText))
            }.padding([.leading, .top], 10)
            Image(icon)
                .renderingMode(.template)
                .foregroundColor(hasError ? Color.red : Color.gray)
                .padding(.trailing,24)
                .padding(.bottom,100)
                .frame(width:20 ,height: 16 )
            
        }.overlay(RoundedRectangle(cornerRadius: 16)
            .stroke(isFocused ? Color.EHPurple : Color.gray, lineWidth: isFocused ? 2 : 1 ))
        .autocorrectionDisabled()
        .background(RoundedRectangle(cornerRadius: 15).fill(hasError ? Color.ErrRed : Color.white))
        
        if hasError{
            ErrorLabel(prompt: prompt)
        }
    }
}

struct CustomTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextEditor( placeholder:"Descriere eveniment" , value:.constant(""), icon:"Vector", prompt:"error", hasError: .constant(false))
    }
}
