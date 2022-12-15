//
//  BriefDescriptionComponent.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 08.12.2022.
//

import SwiftUI

struct BriefDescriptionComponent: View {
    
    var bigIcon: String
    var smallIcon: String
    var title: String
    var subTitle: String
    var labelText: String
    
    init(bigIcon: String, smallIcon: String, title: String, subTitle: String, labelText: String) {
        self.bigIcon = bigIcon
        self.smallIcon = smallIcon
        self.title = title
        self.subTitle = subTitle
        self.labelText = labelText
    }
    
    var body: some View {
        VStack{
            HStack(alignment:.top){
                Image(bigIcon)
                VStack(alignment:.leading){
                    Text(title)
                        .bold()
                    Text(subTitle)
                        .padding(.bottom, 1)
                        .font(.system(size: 14))
                    Button {
                        print("go")
                    } label: {
                        Label(labelText, image: smallIcon)
                            .font(.system(size: 13))
                            .padding(10)
                            .foregroundColor(.ehPurple)
                            .bold()
                            .overlay(
                                Capsule()
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.ehPurple)
                            )
                    }
                }
            }
        }
    }
}

struct BriefDescriptionComponent_Previews: PreviewProvider {
    static var previews: some View {
        BriefDescriptionComponent(bigIcon: "Calendar 1", smallIcon: "smallCalendar", title: "Arena Nationala", subTitle: "Strada Matei Basarab nr. 24", labelText: "Adauga in calendar")
    }
}
