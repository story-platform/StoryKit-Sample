//
//  StoryDelegate.swift
//  StoryKitSample
//
//  Created by StoryTeam on 1/23/26.
//

import Foundation
import StoryKit

final class StoryDelegate {
    
}

extension StoryDelegate: StoryPlayerDelegate {
   
    
    func storyPlayerState(_ state: StoryKit.StoryPlayer.PlayerState) {
        print("StoryPlayer State Changed to \(state)")
    }
    

    func storyInvokeEvent(_ event: StoryKit.StoryPlayer.StoryEvent) {
        print("StoryKit player invoke event: \(event)")
    }
}
