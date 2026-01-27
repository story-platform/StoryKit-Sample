//
//  StoryKitSampleApp.swift
//  StoryKitSample
//
//  Created by StoryTeam on 1/23/26.
//

import SwiftUI
import StoryKit
@main
struct StoryKitSampleApp: App {
    
    @State private var appModel = AppModel()
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
                .task {
                    /*
                     StoryKit initialization sequence.
                     
                     This asynchronous task performs SDK bootstrap at application launch:
                     1. Builds a StoryConfig with debugging enabled and required dependencies.
                     2. Calls StoryPlayer.initialize(_:_:), which validates the API key and performs authorization.
                     3. Updates local state based on the authorization result to control feature availability.
                     
                     Important:
                     - Replace the placeholder API key with your own before running the sample https://story.app/story.
                     - Initialization should be performed once during app startup.
                     - The result is asynchronous and must be awaited.
                     */
                    
                    // Construct SDK configuration.
                    // - debug: Enables verbose logging for development.
                    // - delegate: Receives lifecycle and event callbacks from StoryKit.
                    // - openImmersiveSpace: Injected system handler used by StoryKit to present immersive content.
                    
                    let config = StoryConfig(debug: true, delegate: appModel.storyDelegate, openImmersiveSpace: self.openImmersiveSpace)
                    do {
                        try await StoryPlayer.initialize("replace-this-with-your-apikey", config)
                    }
                    catch{
                        print("StoryKit initialize failed, error: \(error.localizedDescription)")
                    }                    
                }
        }
        .windowResizability(.contentSize)
        ImmersiveSpace(id: StorySpaceID) {
            ImmersiveView()
                .environment(appModel)
                .onAppear {
                    appModel.immersiveSpaceState = .open
                }
                .onDisappear {
                    appModel.immersiveSpaceState = .closed
                }
        }
                
        ToolsWindow
            .windowStyle(.plain)
            .windowResizability(.contentSize)
    }
}
