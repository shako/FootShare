//
//  LoginView.swift
//  FootShare
//
//  Created by Steven Machtelinckx on 15/10/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var buttonMaxWidth: CGFloat?

    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(Color("EasyBlackColor"))
            
            Text("10")
                .foregroundStyle(Color("EasyWhiteColor"))
                .font(Font.custom("Poppins", size: 128))
                .padding()
        }.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        
        VStack {
            Group {
                Button("Log in") {}
                Button("I forgot my password") {}
            }
            .background(GeometryReader { geometry in
                Color.clear.preference(
                    key: ButtonWidthPreferenceKey.self,
                    value: geometry.size.width
                )
            })
            .frame(width: buttonMaxWidth)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(20)
        }
        .onPreferenceChange(ButtonWidthPreferenceKey.self) {
            buttonMaxWidth = $0
        }
    }
}

private extension LoginView {
    struct ButtonWidthPreferenceKey: PreferenceKey {
        static let defaultValue: CGFloat = 0

        static func reduce(value: inout CGFloat,
                           nextValue: () -> CGFloat)
        {
            value = max(value, nextValue())
        }
    }
}

#Preview {
    LoginView()
}
