//
//  CreateEventView.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 30.11.2022.
//

import SwiftUI

struct CreateEventView<ViewModel: CreateEventViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack{
            ZStack{
                Text("Evenimentul tau")
                Button {
                    viewModel.goToMainPage()
                } label: {
                    Image("Inapoi")
                        .padding(.trailing, 350)
                }
            }
            Spacer()
            ImagePicker(selectedImage: $viewModel.image)
                .padding(.bottom, 14)
            CustomInput(placeholder: "Nume eveniment", value: $viewModel.name, icon: "pen", prompt: "", hasError: $viewModel.hasNameError)
                .padding(.bottom, 14)
            
            DatePicker(selection: $viewModel.date, displayedComponents: .date){
                Text("Data Eveniment")
            }
            .padding(.bottom, 14)
            
            DatePicker(selection: $viewModel.date, displayedComponents: .hourAndMinute){
                Text("Ora Eveniment")
            }
            .padding(.bottom, 14)
            
            CustomInput(placeholder: "Locatie Eveniment", value:.constant(viewModel.location) , icon: "location", prompt: "", hasError: $viewModel.hasLocationError)
                .disabled(true)
                .padding(.bottom, 14)
            
            CustomTextEditor(placeholder: "Descriere eveniment", value: $viewModel.description, icon: "file", prompt: "", hasError: $viewModel.hasDescriptionError)
                .padding(.bottom, 14)
            CustomButton(text: "Creaza eveniment", action:{
                viewModel.addEventToDb()
            })
            .opacity(viewModel.canSubmit ? 1 : 0.6)
            .disabled(!viewModel.canSubmit)
        }.padding(.horizontal, 24)
    }
}
struct CreateEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventView(viewModel: CreateEventViewModel(repository: CreateEventRepository(), navigation: CreateEventNavigation()))
    }
}
