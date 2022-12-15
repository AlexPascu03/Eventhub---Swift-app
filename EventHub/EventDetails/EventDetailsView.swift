//
//  EventDetailsView.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 08.12.2022.
//

import SwiftUI

struct EventDetailsView<ViewModel: EventDetailsViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        ScrollView(){
            VStack{
                ScrollView(.vertical, showsIndicators: false){
                    DetailsTopComponent(goToMainPage: viewModel.goToMainPage, imageURL: viewModel.event.imageURL)
                    VStack(alignment:.leading){
                        EventDetailsHeaderComponent(title: viewModel.event.name, participants: viewModel.event.participants)
                        Divider()
                            .padding()
                        BriefDescriptionComponent(bigIcon: "Calendar 1", smallIcon: "smallCalendar", title: Formatter.weekdayWithMonthDateAndYear.string(from: viewModel.event.date).capitalized, subTitle: Formatter.hourAndMinutes.string(from: viewModel.event.date), labelText: "Adauga in calendar")
                        BriefDescriptionComponent(bigIcon: "Locatie", smallIcon: "smallLocation", title: viewModel.event.location, subTitle: "Strada Matei Basarab nr. 24", labelText: "Vezi locatia pe harta")
                        BriefDescriptionComponent(bigIcon: "Bilet", smallIcon: "smallCalendar", title: "Bilete", subTitle: "bilete.emagic.ro", labelText: "Cumpara bilete")
                        Divider()
                            .padding()
                        EventDescriptionComponent(description: viewModel.event.description, name: viewModel.user.name)
                        Divider()
                            .padding()
                        RelatedCarrousel(cards: viewModel.relatedEvents, goToDetails: viewModel.goToDetails)
                    }.padding(.horizontal)
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct EventDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailsView(viewModel: EventDetailsViewModel(repository: EventDetailsRepository(), navigation: EventDetailsNavigation(), id: ""))
    }
}
