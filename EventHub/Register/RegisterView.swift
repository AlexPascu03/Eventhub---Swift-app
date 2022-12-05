//
//  RegisterView.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 22.11.2022.
//

import SwiftUI

struct RegisterView<ViewModel: RegisterViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        VStack(spacing: 15){
            VStack(alignment: .leading, spacing: 15){
                Text("Inregistreaza-te")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                
                CustomInput(placeholder: "Numele si Prenumele", value: $viewModel.name, icon:"userImage", prompt: ErrorMessages.name.message, hasError: $viewModel.hasNameError)
                
                
                CustomInput(placeholder: "Adresa de e-mail", value: $viewModel.email, icon:"Mail", prompt: ErrorMessages.email.message, hasError: $viewModel.hasEmailError)
                
                CustomInputPass(placeholder: "Parola", value: $viewModel.password, icon:"passwordKey", prompt: ErrorMessages.password.message, hasError: $viewModel.hasPasswordError)
                
                CustomInputPass(placeholder: "Confirma parola",value: $viewModel.confirmPassword,icon:"passwordKey", prompt:ErrorMessages.confirmPassword.message,   hasError: $viewModel.hasPasswordConfirmationError)
            }
            
            CustomButton(text: "CREEAZA CONT", action: {
                viewModel.register()
            }
            )
            .opacity(viewModel.canSubmit ? 1 : 0.6)
            .disabled(!viewModel.canSubmit)
            Text("SAU")
                .foregroundColor(.gray)
            Spacer()
            HStack{
                Text("Ai deja cont?")
                Button("Conecteaza-te!") {
                    viewModel.goToSignIn()
                }
            }
            
        }.padding()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(viewModel: RegisterViewModel(repository: RegisterRepository(), navigation: RegisterNavigation()))
    }
}
