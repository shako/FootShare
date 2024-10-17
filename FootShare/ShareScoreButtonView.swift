//
//  ContentView.swift
//  FootShare
//
//  Created by Steven Machtelinckx on 17/10/2024.
//

import SwiftUI

struct ShareScoreButtonView: View {
    
    @Binding var scoreText: String
    
    @State private var isContentShared = false
    @State private var isUpToDate = false

    var body: some View {
        Button(action: {
            showShareSheet()
        }) {
            GameButton(icon: "paperplane.fill", color: (isUpToDate ? Color.init("BoringButtonColor") : Color.init("ChangesToPublishColor")))
        }

    }

    private func showShareSheet() {
        let activityItems = [scoreText]
        let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        activityViewController.completionWithItemsHandler = { _, completed, _, _ in
            isContentShared = completed
            if completed {
                isUpToDate = true
                print("Content has been shared")
            } else {
                print("Share sheet dismissed")
            }
        }

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.keyWindow?.rootViewController {
            rootViewController.present(activityViewController, animated: true)
        }
    }
}

#Preview {
    ShareScoreButtonView(scoreText: .constant("Westerlo [10-0] KRC Genk"))
}

