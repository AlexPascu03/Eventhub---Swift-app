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
                    TopCarrousel(cards: viewModel.thisWeekEvents, goToDetails: viewModel.goToDetails(_:))
                    PopularCarrousel(cards: viewModel.popularEvents, goToDetails: viewModel.goToDetails(_:))
                    CloseCarrousel(cards: viewModel.closeEvents, goToDetails: viewModel.goToDetails(_:))
                    BottomCarrousel(cards: viewModel.randomEvent, goToDetails: viewModel.goToDetails(_:))
                    Button {
                        viewModel.goToCreate()
                    } label: {
                        AddEventComponent()
                    }
                }
                .padding(.leading, 3)
            }
            .background(Color.backgroundGray)
        }
        .ignoresSafeArea()
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView(viewModel: MainPageViewModel(repository: MainPageRepository(), navigation: MainPageNavigation()) )
    }
}
