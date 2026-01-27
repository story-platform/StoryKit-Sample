//
//  PlayStoryView.swift
//  StoryKitSample
//
//  Created by StoryTeam on 1/23/26.
//

import SwiftUI
import StoryKit
import RealityKit

struct PlayStoryView: View {    
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Trigger the event named OnTap.")
            Button("Trigger OnTap") {
                let result = StoryPlayer.invokeEvent(id: "event_7C1C8B59-AD29-479F-BFC6-041F0382EE23")
                print("Event triggered, result: \(result)")
            }
            Text("Retrieve the position of a specific entity.")
            Button("Get Entity Position") {
                if let entity = StoryPlayer.findEntity(id: "entity_F621A04B-472F-459D-86D0-6D54CBAB2F59") {
                    print("Entity Position: \(entity.position(relativeTo: nil))")
                }
            }
        }
        .disabled(StoryPlayer.shared.state != .loaded)
    }
}
