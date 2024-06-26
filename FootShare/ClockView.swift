//
//  ClockView.swift
//  FootShare
//
//  Created by Steven Machtelinckx on 15/04/2024.
//

import SwiftUI
import SwiftData

struct ClockView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var clock: Clock
    
    var body: some View {
        ZStack {
            if (!clock.hasEnded) {
                if (clock.inBreak) {
                    HStack() {
                        endGameButton
                        Spacer()
                    }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                }
                VStack {
                    if (clock.inBreak) {
                        clockBreakMessage
                    } else {
                        time
                    }
                    
                }
            }
            HStack() {
                Spacer()
                startOrBreakButton
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
    }
    
    var time: some View {
        TimelineView(.periodic(from: clock.runningSince ?? .now, by: 1)) { context in
            Text("\(clock.value?.seconds.convertDurationToString() ?? "00:00")")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .tracking(2)
        }
    }
    
    var clockBreakMessage: some View {

//        Image(systemName: "pause.rectangle.fill")
//            .resizable()
//            .scaledToFill()
//            .frame(width: 70, height: 60)
//            .foregroundStyle(Color.secondary.opacity(0.5))
        
        Text("Break")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .tracking(2)
    }
    
    var endGameButton: some View {
        let endColor = Color(#colorLiteral(red: 0.9529411793, green: 0, blue: 0.02332801142, alpha: 1))
        
        return ColoredButton(color: endColor, image: Image(systemName: "flag.checkered.circle.fill"), action: clock.end)
            .buttonStyle(ScaleButtonStyle())
    }
    
    var startOrBreakButton: some View {
        let startColor = Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        let breakColor = Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))

        switch clock.status {
            case .not_started:
            return AnyView(ColoredButton(color: startColor, image: Image(systemName: "play.circle"), action: resumeClock)
                .buttonStyle(ScaleButtonStyle())
            )
            case .playing:
            return AnyView(ColoredButton(color: breakColor, image: Image(systemName: "pause.circle"), action: clock.startBreak)
                .buttonStyle(ScaleButtonStyle())
            )
            case .in_break:
            return AnyView(ColoredButton(color: startColor, image: Image(systemName: "play.circle"), action: resumeClock)
                .buttonStyle(ScaleButtonStyle())
            )
                
            case .ended:
            return AnyView(Group {})

        }
    }
    
    struct ScaleButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .scaleEffect(configuration.isPressed ? 1.2 : 1.0)
                .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
        }
    }
    
    func resumeClock() {
        let session = Session(startTime: Date.now)
        modelContext.insert(session)
        clock.resume(newSession: session)
    }
    
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Clock.self, configurations: config)
    
    let games = makeFakeData(container: container)
    let game = games.first!

    return NavigationStack {
        ClockView(clock: game.clock).modelContainer(container)
            .frame(maxWidth: .infinity, minHeight: 100)
//            .background(Color.white)
    }
    
}

struct ColoredButton: View {
    let color: Color
    let image: Image
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            image
                .resizable()
                .scaledToFit()
//                .padding(.vertical, 10)
//                .padding(.horizontal, 15)
                .frame(width: 70, height: 70)
                .foregroundStyle(color)
                .fontWeight(.semibold)
                .padding(6)
                .background(Circle().fill(color.opacity(0.3)))
//                .shadow(color: color.opacity(0.3), radius: 5, x: 2, y: 2)
        })
    }
}
