//
//  ImmersiveView.swift
//  StoryKitSample
//
//  Created by StoryTeam on 1/23/26.
//

import SwiftUI
import RealityKit
import StoryKit

struct ImmersiveView: View {

    var body: some View {
        StoryView { contents, attachments in
            //You can customize your immersive view.
        } attachments: {
            
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
        .environment(AppModel())
}
