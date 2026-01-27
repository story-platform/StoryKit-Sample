//
//  PlayStoryButton.swift
//  StoryKitSample
//
//  Created by StoryTeam on 1/23/26.
//

import SwiftUI
import StoryKit

struct PlayStoryButton: View {
    @Environment(AppModel.self) private var appModel
    let title: String
    var body: some View {
        Button(appModel.storyPlaying ? "Stop" : "Play"){
            if appModel.storyPlaying{
                Task{
                    do{
                        try await StoryPlayer.play(story: title)
                    } catch{
                        print("Play Story Error")
                    }
                }
            }
            else{
                Task{
                    await StoryPlayer.stop()
                }
            }
        }
    }
}
