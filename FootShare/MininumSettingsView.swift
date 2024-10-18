//
//  MiminumSettingsView.swift
//  FootShare
//
//  Created by Steven Machtelinckx on 15/10/2024.
//

import SwiftUI

struct MininumSettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var team1Name: String = "KVC Westerlo"
    @State private var team2Name: String = ""
    @State private var showWishKit: Bool = false
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.init(hex: "F9F9F9").ignoresSafeArea()
                LinearGradient(gradient: Gradient(colors: [Color.init(hex: "#92FFC0"), Color.init(hex: "#002661")]), startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.3)
                    .ignoresSafeArea()
                
                VStack (spacing: 24) {
                    HStack (spacing: 8){
                        resetScoresButton
                        resetScoresAndTeamsButton
                    }
                    
                    Teams(team1Name: $team1Name, team2Name: $team2Name)
                        .padding(.vertical, 24)
                    
                    toGameButton

                    
                    wishKitButton

                }
                .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top)
                .padding(.horizontal)
                .padding(.top, 36)

            }
        }
        
    }
    
    var resetScoresButton : some View {
        Button {
            
        } label: {
            Text("Reset Score")
                .settingsButtonStyleOrange()
        }
    }

    var resetScoresAndTeamsButton: some View {
        Button {
            
        } label: {
            Text("Reset Game")
                .settingsButtonStyleOrange()
        }
    }
    

    var toGameButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Play!")
                .settingsButtonStyleGreen()
        }
    }
    

    var wishKitButton: some View {
        Button {
            showWishKit.toggle()
        } label: {
            Text("Request A Feature!")
                .settingsButtonStylePurple()
                .overlay(
                    Image(systemName: "chevron.right")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundStyle(Color("EasyWhiteColor"))
                        .font(.system(size: 20))
                        .padding(.trailing, 16)
                )
        }
        .navigationDestination(isPresented: $showWishKit, destination: {
            WishkitView()
        })
    }
}


#Preview {
    MininumSettingsView()
}

struct Teams: View {
    
    @Binding var team1Name: String
    @Binding var team2Name: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 16) {
            Text("Teams").font(Font.custom("Poppins-SemiBold", size: 28)).foregroundStyle(Color.init(hex: "#0D1B9B"))
            VStack (spacing: 12) {
                TextField("Team 1", text: $team1Name)
                    .inputFieldStyle()
                TextField("Team 2", text: $team2Name)
                    .inputFieldStyle()
            }

        }
    }
}

extension View {
    func inputFieldStyle() -> some View {
        modifier(InputField())
    }

    func settingsButtonStyleGreen() -> some View {
        modifier(SettingsButton(backGroundColor: Color.init(hex: "2BA718")))
    }
    
    func settingsButtonStyleOrange() -> some View {
        modifier(SettingsButton(backGroundColor: Color.init(hex: "F27C50")))
    }
    
    func settingsButtonStylePurple() -> some View {
        modifier(SettingsButton(backGroundColor: Color("ChangesToPublishColor")))
    }
}

struct InputField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Poppins-Regular", size: 20))
            .padding()
            .background(Color("EasyWhiteColor"))
            .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 10, bottomLeading: 10, bottomTrailing: 10, topTrailing: 10)))
            .padding(2)
            .background(Color.init(hex: "DBDADA"))
            .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 12, bottomLeading: 12, bottomTrailing: 12, topTrailing: 12)))
    }
}

struct SettingsButton: ViewModifier {
    
    var backGroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color("EasyWhiteColor"))
            .font(Font.custom("Poppins-Medium", size: 16))
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(backGroundColor)
            .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 10, bottomLeading: 10, bottomTrailing: 10, topTrailing: 10)))
            .padding(2)
            .background(backGroundColor.opacity(0.6))
            .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 12, bottomLeading: 12, bottomTrailing: 12, topTrailing: 12)))
    }
}
