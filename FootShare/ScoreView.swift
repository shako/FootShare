//
//  ScoreView.swift
//  FootShare
//
//  Created by Steven Machtelinckx on 15/10/2024.
//

import SwiftUI

struct ScoreView: View {
    @State private var buttonMaxHeight: CGFloat = 0
    @State private var buttonMaxWidth: CGFloat = 0
    var teamName: String
    
    var body: some View {
        VStack(spacing: 24) {
            Text(teamName)
                .lineLimit(3)
                .font(Font.custom("Poppins-Medium", size: 36))
              
            
            HStack(spacing: 8) {
                Button {} label: {
                    ScoreChangeShape(height: $buttonMaxHeight, backgroundColor: Color("RedColor"), iconName: "arrowtriangle.down.fill")
                }
                
                Text("10")
                    .foregroundStyle(Color("EasyWhiteColor"))
                    .font(Font.custom("Poppins-SemiBold", size: 128))
                    .frame(width: 150)
                    .padding(.horizontal, 8)
                    .padding(.trailing, 4)
                    .padding(.vertical, 0)
                    .background(Color("EasyBlackColor"))
                    .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 6, bottomLeading: 6, bottomTrailing: 6, topTrailing: 6)))
                    .lineLimit(1)
                    
                Button {} label: {
                    ScoreChangeShape(height: $buttonMaxHeight, backgroundColor: Color("GreenColor"), iconName: "arrowtriangle.up.fill")
                }
            }
            .background(GeometryReader { geometry in
                Color.clear.preference(
                    key: ButtonHeightPreferenceKey.self,
                    value: geometry.size.height
                )
            })
            .frame(height: buttonMaxHeight)
            .onPreferenceChange(ButtonHeightPreferenceKey.self) {
                buttonMaxHeight = $0
            }
            
            
            
        }
        .background(GeometryReader { geometry in
            Color.clear.preference(
                key: ButtonWidthPreferenceKey.self,
                value: geometry.size.width
            )
        })
        .frame(maxWidth: buttonMaxWidth)
        .onPreferenceChange(ButtonWidthPreferenceKey.self) {
            buttonMaxWidth = $0
        }
        .padding(.vertical, 32)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/)
        .background(Color("EasyWhiteColor"))
        .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 10, bottomLeading: 10, bottomTrailing: 10, topTrailing: 10)))
        .padding(2)
        .background(Color("BoringButtonColor").opacity(0.8))
        .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 12, bottomLeading: 12, bottomTrailing: 12, topTrailing: 12)))
    }
}

private extension ScoreView {
    struct ButtonWidthPreferenceKey: PreferenceKey {
        static let defaultValue: CGFloat = 0

        static func reduce(value: inout CGFloat,
                           nextValue: () -> CGFloat)
        {
            value = max(value, nextValue())
        }
    }
    
    struct ButtonHeightPreferenceKey: PreferenceKey {
        static let defaultValue: CGFloat = 0

        static func reduce(value: inout CGFloat,
                           nextValue: () -> CGFloat)
        {
            value = max(value, nextValue())
        }
    }
}

#Preview {
    VStack {
        ScoreView(teamName: "KVC Westerlo")
        
            .frame(maxWidth: 400, maxHeight: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/)
            .background(Color("EasyWhiteColor"))
        
        ScoreView(teamName: "Racing Genk die echt een hele lange naam heeft echt niet te geloven")
        
            .frame(maxWidth: 400, maxHeight: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/)
            .background(Color("EasyWhiteColor"))
    }
}

struct ScoreChangeShape: View {
    @Binding var height: CGFloat
    var backgroundColor: Color
    var iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .foregroundStyle(Color("EasyWhiteColor"))
            .font(Font.custom("Poppins", size: 36))
            .frame(width: 56, height: height)
            .background(backgroundColor)
            .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 6, bottomLeading: 6, bottomTrailing: 6, topTrailing: 6)))
            .padding(.horizontal, 2)
            .background(backgroundColor.opacity(0.8))
            .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 6, bottomLeading: 6, bottomTrailing: 6, topTrailing: 6)))
    }
}
