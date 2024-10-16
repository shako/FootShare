//
//  Buttons.swift
//  FootShare
//
//  Created by Steven Machtelinckx on 15/10/2024.
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        VStack(spacing: 10) {
            GameButton(icon: "gearshape.fill", color: Color.init("BoringButtonColor"))
            GameButton(icon: "paperplane.fill", color: Color.init("AutomaticPublishingColor"))
            GameButton(icon: "paperplane.fill", color: Color.init("ChangesToPublishColor"))
            GameButton(icon: "paperplane.fill", color: Color.init("BoringButtonColor"))
        }
        
    }
}

struct GameButton: View {
    
    var icon: String
    var color: Color
    
    var body: some View {
        Image(systemName: icon)
            .foregroundStyle(Color.init("EasyWhiteColor"))
            .font(Font.custom("Poppins", size: 32))
        
            .padding(.vertical, 6)
            .padding(.horizontal, 16)
            .background(color)
            .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 12, bottomLeading: 12, bottomTrailing: 12, topTrailing: 12)))
            .padding(2)
            .background(color.opacity(0.8))
            .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 12, bottomLeading: 12, bottomTrailing: 12, topTrailing: 12)))
    }
}


#Preview {
    Buttons()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color.gray.opacity(0.2))
}
