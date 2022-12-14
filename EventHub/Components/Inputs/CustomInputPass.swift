//
//  CustomInputPass.swift
//  EventHub
//
//  Created by internship on 18.11.2022.
//

import SwiftUI

struct CustomInputPass: View {
    
    var placeholder : String
    var icon : String
    let prompt: String
    @Binding var value : String
    @Binding var hasError: Bool
    @State var isFocused : Bool = false
    @State private var animationAmount = 0
    
    init(placeholder: String, value: Binding<String>, icon: String, prompt: String, hasError: Binding<Bool>) {
        self.placeholder = placeholder
        self._value = value
        self.icon = icon
        self.prompt = prompt
        self._hasError = hasError
    }
    
    var body: some View {
        VStack(alignment: .leading){
            ZStack {
                HStack{
                    SecureField(placeholder, text : $value)
                        .frame(height: 64)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding([.horizontal], 4)
                        .cornerRadius(16)
                        .padding(.leading,10)
                    Image(icon)
                        .renderingMode(.template)
                        .foregroundColor(hasError ? Color.red : Color.gray)
                        .padding(.trailing,24)
                        .frame(width:20 ,height: 16 )
                    
                }.overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                    .background(RoundedRectangle(cornerRadius: 15).fill(hasError ? Color.errRed : Color.white))
                HStack{
                    
                    TextField(placeholder, text : $value) { focused in
                        if focused{
                            isFocused = true
                            animationAmount += 1
                        } else{
                            isFocused = false
                        }
                    }
                    .frame(height: 64)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 4)
                    .cornerRadius(16)
                    .padding(.leading,10)
                    .foregroundColor(.clear)
                    
                    Image(icon)
                        .renderingMode(.template)
                        .foregroundColor(hasError ? Color.red : Color.gray)
                        .padding(.trailing,24)
                        .frame(width:20 ,height: 16 )
                    
                }.overlay(RoundedRectangle(cornerRadius: 16).stroke(isFocused ? Color.ehPurple : Color.gray, lineWidth: isFocused ? 2 : 1 ))
                    .autocorrectionDisabled()
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(hasError ? Color.red : Color.gray, lineWidth: hasError ? 2 : 1 ))
            }
            if hasError{
                ErrorLabel(prompt: prompt)
            }
        }
    }
}

struct CustomInputPass_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputPass(placeholder: "Password", value: .constant("ss"), icon:"passwordKey", prompt:"error", hasError: .constant(true))
    }
}
