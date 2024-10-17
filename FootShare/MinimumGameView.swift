//
//  ContentView.swift
//  FootShare
//
//  Created by Steven Machtelinckx on 15/10/2024.
//

import SwiftUI

struct MinimumGameView: View {
    

    var body: some View {
        
        ZStack {
            
            Color.init(hex: "F9F9F9").ignoresSafeArea()
            LinearGradient(gradient: Gradient(colors: [Color.init(hex: "#92FFC0"), Color.init(hex: "#002661")]), startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.5)
                .ignoresSafeArea()
            
            VStack(alignment:.center) {
                TopBar()
                    .padding(.bottom, 20)
                
                VStack (spacing: 24) {
                    ScoreView(teamName: "KVC Westerlo")
                    ScoreView(teamName: "Racing Genk die echt een hele lange naam heeft echt niet te geloven")
                }
                
            }
            .padding(.horizontal, 24)
           
            
        }
        
        
    }
    
}

#Preview {
    MinimumGameView()
        .background(Color.init("EasyWhiteColor"))
}



struct TopBar: View {
    
    @State private var showSettingsSheet: Bool = false
    
    var body: some View {
        HStack {
            Button {
                showSettingsSheet.toggle()
            } label: {
                GameButton(icon: "gearshape.fill", color: Color.init("BoringButtonColor"))
            }.sheet(isPresented: $showSettingsSheet, content: {
                MininumSettingsView()
            })
            Spacer()
            Button {
                
            } label: {
                GameButton(icon: "paperplane.fill", color: Color.init("ChangesToPublishColor"))
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top)
    }
}
