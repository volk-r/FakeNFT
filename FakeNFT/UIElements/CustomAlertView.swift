//
//  CustomAlertView.swift
//  FakeNFT
//
//  Created by Roman Romanov on 01.03.2025.
//

import SwiftUI

struct CustomAlertView: View {
    let title: LocalizedStringKey
    let message: LocalizedStringKey
    @Binding var inputText: String
    @Binding var isPresented: Bool
    var onSave: (String) -> Void

    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()

            VStack(spacing: 5) {
                Group {
                    Text(title)
                        .appTextStyleHeadline3()
                        .padding(.top)

                    Text(message)
                        .appTextStyleCaption1()
                    
                    CustomTextField(
                        text: $inputText,
                        placeholder: "Enter new value",
                        lineLimit: 1
                    )
                    .padding()
                }
                
                Divider()

                HStack(spacing: 10) {
                    Button("Cancel") {
                        isPresented = false
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    
                    Divider()
                        .padding(0)
                    
                    Button("Save") {
                        onSave(inputText)
                        isPresented = false
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                }
                .frame(maxHeight: 65)
                .padding(.horizontal)
            }
            .frame(maxWidth: 400)
            .background(.appWhite)
            .cornerRadius(15)
            .padding()
            .shadow(radius: 10)
        }
    }
}

#Preview("Alert") {
    @Previewable @State var myText: String = ""
    
    VStack {
        CustomAlertView(
            title: "Change photo",
            message: "Please enter a new value below",
            inputText: $myText,
            isPresented: .constant(true),
            onSave: { newValue in
                print("New value", newValue)
            }
        )
        .environment(\.colorScheme, .light)
        
        CustomAlertView(
            title: "Change photo",
            message: "Please enter a new value below",
            inputText: $myText,
            isPresented: .constant(true),
            onSave: { newValue in
                print("New value", newValue)
            }
        )
        .environment(\.colorScheme, .dark)
    }
}
