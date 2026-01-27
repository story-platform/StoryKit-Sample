//
//  FeaturesView.swift
//  StoryKitSample
//
//  Created by StoryTeam on 1/23/26.
//

import SwiftUI
import StoryKit

struct FeaturesView: View {
    @State private var sharePlayEnabled = StoryPlayer.shared.config?.sharePlayEnable ?? false
    @State private var tapStoryControlEnabled = StoryPlayer.shared.config?.tapStoryEnable ?? false
    @State private var toolsEnabled = false
    
    var body: some View {
        VStack(spacing: 24) {
            // After enabling SharePlay, you need to activate it before start playing a story
            // `StoryPlayer.activateSharePlay()`
            Toggle("Enable Shareplay", isOn: $sharePlayEnabled)
                .onChange(of: sharePlayEnabled) { oldValue, newValue in
                    if newValue{
                        do {
                            try StoryPlayer.setShareplayEnabled(newValue)
                        }
                        catch{
                            sharePlayEnabled = false
                            print("Failed to enable SharePlay, Error: \(error.localizedDescription)")
                        }
                    }
                    else{
                        do{
                            try StoryPlayer.setShareplayEnabled(false)
                        }
                        catch{
                            print("Failed to enable SharePlay, Error: \(error.localizedDescription)")
                        }
                    }
                }
            Toggle("Enable TapStory Control", isOn: $tapStoryControlEnabled)
                .onChange(of: tapStoryControlEnabled) { oldValue, newValue in
                    if newValue{
                        do {
                            try StoryPlayer.setTapStoryEnabled(newValue)
                        }
                        catch{
                            tapStoryControlEnabled = false
                            print("Failed to enable TapStory Control, Error: \(error.localizedDescription)")
                        }
                    }
                    else{
                        do{
                            try StoryPlayer.setTapStoryEnabled(false)
                        }
                        catch{
                            print("Failed to enable TapStory Control, Error: \(error.localizedDescription)")
                        }
                    }
                }
            Toggle("Tools", isOn: $toolsEnabled)
                .padding(.horizontal,48)
                .onChange(of: toolsEnabled) { _, newValue in
                    do {
                        try StoryPlayer.setToolsEnabled(newValue)
                    } catch {
                        print("ToolsPanel error: \(error.localizedDescription)")
                    }
                }
            
        }
        .padding(48)
    }
}
