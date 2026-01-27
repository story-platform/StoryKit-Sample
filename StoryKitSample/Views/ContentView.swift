//
//  ContentView.swift
//  StoryKitSample
//
//  Created by StoryTeam on 1/23/26.
//

import SwiftUI
import RealityKit
import StoryKit

struct ContentView: View {
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    var body: some View {
        NavigationStack {
            VStack(spacing: 24){
                Text("Hello Story")
                    .font(.largeTitle)
                    .foregroundStyle(LinearGradient(colors: [Color.blue, Color.purple, Color.red, Color.white], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .padding(.bottom, 24)
                                
                NavigationLink("Play a Story") {
                    PlayStoryView()
                        .onAppear(){
                            Task{
                                do {
                                    // Play a story
                                    try await StoryPlayer.play(story: "StorySample.story")
                                } catch {
                                    print("StoryKit play error: \(error.localizedDescription)")
                                }
                            }
                        }
                        .onDisappear(){
                            Task{
                                // Stop playing current Story
                                await StoryPlayer.stop()
                            }
                        }
                }
                NavigationLink("Features") {
                    FeaturesView()
                }
                
                Button("World Anchor Placement"){
                    Task{
                        try? await StoryPlayer.worldAnchorPlacement(name: "StorySample.story") {
                        }
                    }
                }
            }
            .disabled(StoryPlayer.shared.state != .ready)
        }
        .padding()
        .frame(width: 400, height: 500)
        .background(Color.black.opacity(0.4))
    }
}
