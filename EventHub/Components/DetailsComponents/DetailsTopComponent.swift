//
//  DetailsTopComponent.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 08.12.2022.
//

import SwiftUI

struct DetailsTopComponent: View {
    
    let goToMainPage: () -> Void
    let imageURL: String
    
    init(goToMainPage: @escaping () -> Void, imageURL: String) {
        self.goToMainPage = goToMainPage
        self.imageURL = imageURL
    }
    
    var body: some View {
        VStack{
            ZStack(alignment: .top){
                AsyncImage(url: URL(string: imageURL)) {image in
                    image.resizable(resizingMode: .stretch)
                } placeholder: {
                    Color.black
                }
                    .scaledToFill()
                    .frame(width: 414, height: 328)
                    .cornerRadius(33)
                HStack{
                    Button {
                        goToMainPage()
                    } label: {
                        Image("back")
                    }
                    Spacer()
                    Button {
                    } label: {
                        Image("Share")
                    }
                }.padding(25)
                    .padding(.top, 20)
            }
            Spacer()
        }
    }
}
