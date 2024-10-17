//
//  WhiskitUI.swift
//  FootShare
//
//  Created by Steven Machtelinckx on 17/10/2024.
//

import SwiftUI
import WishKit

struct WhiskitView: View {
    
    
    init() {
        WishKit.configure(with: "CF0C33D6-C064-47ED-859E-BA4335A6F6F3")
    }
    
    
    var body: some View {
        WishKit.FeedbackListView().withNavigation()
    }
}

#Preview {
    WhiskitView()
}
