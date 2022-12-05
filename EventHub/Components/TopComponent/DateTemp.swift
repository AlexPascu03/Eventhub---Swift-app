//
//  DateTemp.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 29.11.2022.
//

//
//  CustomInputs.swift
//  EventHub
//
//  Created by internship on 17.11.2022.
//

import SwiftUI
import UIKit

struct DateTemp: View {
    
    var body: some View{
        HStack{
            Text(Formatter.weekdayWithMonthAndDate.string(from: Date()).uppercased())
                .foregroundColor(Color.DashTextPr)
            Label("19°C", systemImage: "icloud")
                .foregroundColor(Color.DashTextPr)
        }.frame(width: .infinity)
            .font(.system(size: 13))
    }
}


struct DateTemp_Previews: PreviewProvider {
    static var previews: some View {
        DateTemp()
    }
}



