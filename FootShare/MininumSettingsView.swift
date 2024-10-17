//
//  MiminumSettingsView.swift
//  FootShare
//
//  Created by Steven Machtelinckx on 15/10/2024.
//

import SwiftUI

struct MininumSettingsView: View {
    
    @State private var team1Name: String = "KVC Westerlo"
    @State private var team2Name: String = ""
    
    var body: some View {
        
        ZStack {
            Color.init(hex: "F9F9F9").ignoresSafeArea()
            LinearGradient(gradient: Gradient(colors: [Color.init(hex: "#92FFC0"), Color.init(hex: "#002661")]), startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.3)
                .ignoresSafeArea()
            
            VStack (spacing: 24) {
                Teams(team1Name: $team1Name, team2Name: $team2Name)

                Button {
                    
                } label: {
                    Text("To Game")
                        .settingsButtonStyleGreen()
                }
                
                VStack (spacing: 8){

                    
                    Button {
                        
                    } label: {
                        Text("Reset Scores")
                            .settingsButtonStyleOrange()
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Reset Teams And Scores")
                            .settingsButtonStyleOrange()
                    }
                }
                

            }
            .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top)
            .padding(.horizontal)
            .padding(.top, 36)

        }
        
        
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
}

extension View {
    func settingsButtonStyleGreen() -> some View {
        modifier(SettingsButton(backGroundColor: Color.init(hex: "2BA718")))
    }
    
    func settingsButtonStyleOrange() -> some View {
        modifier(SettingsButton(backGroundColor: Color.init(hex: "F27C50")))
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
