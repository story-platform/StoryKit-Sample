# StoryKit Sample App

A reference sample application demonstrating how to integrate and use the **StoryKit SDK** in a SwiftUI-based immersive app.

This project is intended for developers who want to quickly understand StoryKit initialization, authorization, playback, event interaction, and immersive space integration patterns.

## Overview

This sample app demonstrates a minimal but complete StoryKit integration, including:

- SDK initialization and authorization
- Playing a Story using `StoryPlayer`
- Managing immersive space lifecycle
- Triggering Story-defined events (e.g. `OnTap`)
- Querying entity data from the scene
- SwiftUI patterns for immersive applications

## Features

- StoryKit bootstrap at app launch
- Authorization handling and error reporting
- Story playback controls
- Event triggering from UI
- Entity interaction examples
- ImmersiveSpace lifecycle management
- Clean, readable SwiftUI architecture

## Requirements

- Xcode 15 or later  
- visionOS SDK (for immersive features)  
- A valid StoryKit API key  
- StoryKit SDK added to the project  

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/your-org/storykit-sample-app.git
cd storykit-sample-app
```

### 2. Open the project
open StoryKitSample.xcodeproj

### 3. Configuration

Before running the sample, replace the placeholder API key in:

StoryKitSampleApp.swift

```swift
if let result = await StoryPlayer.initialize(
    "replace-this-with-your-api-key",
    config
)
```

You must use a valid API key issued for your StoryKit account.

### 4. SDK Initialization

StoryKit is initialized once at app launch:

```swift
let config = StoryConfig(
    debug: true,
    delegate: StoryDelegate(),
    openImmersiveSpace: openImmersiveSpace
)

let result = await StoryPlayer.initialize(apiKey, config)
```

### 5. Story Playback

Typical usage flow demonstrated in the sample:

```swift
Button(isPlaying ? "Stop" : "Play"){
    if isPlaying{
        Task{
            do{
                try await StoryPlayer.play(story: title)
            } catch{
                print("Play Story Error: \(error.localizedDescription)")
            }
        }
    }
    else{
        Task{
            await StoryPlayer.stop()
        }
    }
}
```

## 6. Event & Entity Interaction

```swift
Button("Trigger OnTap") {
    let result = StoryPlayer.invokeEvent(id: "event_7C1C8B59-AD29-479F-BFC6-041F0382EE23")
    print("Event triggered, result: \(result)")
}
Button("Get Entity Position") {
    if let entity = StoryPlayer.findEntity(id: "entity_F621A04B-472F-459D-86D0-6D54CBAB2F59") {
        print("Entity Position: \(entity.position(relativeTo: nil))")
    }
}
```

## Troubleshooting

If initialization fails:

- Verify your API key is valid
- Confirm network connectivity
- Ensure you are using a supported SDK version
- Enable debug logging (debug: true)
- Check Xcode console output

## License

This sample project is licensed under the MIT License.
You are free to use, modify, and incorporate this code into your own projects.

## Feedback & Contributions

Feedback and improvements are welcome.

- Open an issue for bugs or suggestions
- Submit a pull request for improvements
- Or contact the StoryKit team directly at https://story.app/contact
