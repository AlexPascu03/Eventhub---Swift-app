//
//  ImagePicker.swift
//  EventHub
//
//  Created by David Alexandru Mihai Pascu on 30.11.2022.
//

import SwiftUI
import PhotosUI

struct ImagePicker: View {
    
    @State private var selectedItem: [PhotosPickerItem] = []
    @Binding private var selectedImage: UIImage?
    
    init(selectedImage: Binding<UIImage?> ) {
        self._selectedImage = selectedImage
    }
    
    var body: some View {
        ZStack{
            
            if let image = selectedImage{
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 424, height: 160)
                    .background(Color.addCoverBkg)
                
            } else {
                Text("Coperta eveniment")
                    .frame(width: 424, height: 160)
                    .background(Color.addCoverBkg)
            }
            PhotosPicker(
                selection: $selectedItem,
                maxSelectionCount: 1,
                matching: .images){
                    Label("Selecteaza", image:"camera" )
                        .padding(10)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .frame(width: 350, height: 140, alignment: .bottomTrailing)
                .onChange(of: selectedItem){ newItem in
                    guard let item = selectedItem.first else {
                        return
                    }
                    item.loadTransferable(type: Data.self){ result in
                        switch result {
                        case .success(let data):
                            selectedImage = UIImage(data: data!)
                        case .failure(let error):
                            print(error)
                        }
                    }
                }
        }
    }
}
