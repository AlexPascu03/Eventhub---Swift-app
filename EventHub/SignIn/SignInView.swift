//
//  SignInView.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 22.11.2022.
//

import SwiftUI

struct SignInView<ViewModel: SignInViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        
        VStack{
            Image("image 93")
                .padding()
                .imageScale(.large)
                .foregroundColor(.accentColor)
            VStack(alignment: .leading, spacing: 16){
                Text("Autentifica-te")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                CustomInput(placeholder: "Adresa de e-mail", value: $viewModel.email, icon: "Mail", prompt:ErrorMessages.email.message, hasError: $viewModel.hasEmailError)
                CustomInputPass(placeholder: "Parola", value: $viewModel.password, icon: "passwordKey", prompt: ErrorMessages.loginPass.message, hasError: .constant(false))
            }
            
            CustomButton(text: "Log in", action: {
                viewModel.login()
            })
            .padding([.top],20)
            .shadow(radius: 5)
            
            Text("SAU")
                .padding([.top],20)
                .foregroundColor(.gray)
                .fontWeight(.bold)
            
            Spacer()
            HStack{
                Text("Nu ai cont?")
                Button("Inregistreaza-te!") {
                    viewModel.goToRegister()
                }
            }
            .padding()
            .alert(viewModel.alertText, isPresented: $viewModel.hasAlert ) {
                Button("Cancel", role: .cancel) {
                }
            }
        }
        .padding()
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(viewModel: SignInViewModel(repository: SignInRepository(), navigation: SignInNavigation()) )
    }
}

