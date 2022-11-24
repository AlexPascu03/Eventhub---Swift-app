//
//  ErrorLabel.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 23.11.2022.
//

import SwiftUI

struct ErrorLabel: View {
    let prompt: String
    
    init(prompt: String) {
        self.prompt = prompt
    }
    
    var body: some View {
        HStack{
            Image("Ellipse 34")
                .overlay(Image("!"))
            Text(prompt)
                .foregroundColor(.red)
                .font(.system(size:13))
        }
        }
}

struct ErrorLabel_Previews: PreviewProvider {
    static var previews: some View {
        ErrorLabel(prompt:"error")
    }
}
