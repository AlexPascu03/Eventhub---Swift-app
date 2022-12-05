//
//  MainPageView.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 28.11.2022.
//

import SwiftUI
import Foundation

struct MainPageView<ViewModel: MainPageViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        VStack(spacing:0){
            TopComponent()
            VStack{
                ScrollView(.vertical, showsIndicators: false){
                    TopCarrousel()
                    MidCarrousel()
                    BottomCarrousel()
                    Button {
                        viewModel.goToCreate()
                    } label: {
                        AddEventComponent()
                    }
                }
                .padding(.leading, 3)
            }
            .background(Color.BackgroundGray)
        }
        .ignoresSafeArea()
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView(viewModel: MainPageViewModel(repository: MainPageRepository(), navigation: MainPageNavigation()) )
    }
}
