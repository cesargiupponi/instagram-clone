//
//  AuthFormView.swift
//  InstagramClone
//
//  Created by Cesar Giupponi on 28/11/25.
//

import SwiftUI

struct AuthFormView: View {
    let title: String
    let subtitle: String
    let textFieldPlaceholder: String
    @Binding var textFieldValue: String
    
    var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text(subtitle)
                .font(.footnote)
                .foregroundStyle(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            TextField(textFieldPlaceholder, text: $textFieldValue)
                .textInputAutocapitalization(.never)
                .modifier(IGTextFieldModifier())
        }
    }
}

