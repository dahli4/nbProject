//
//  AvPlayerController.swift
//  Player
//
//  Created by A on 2024/01/29.
//

// AvPlayerController.swift

import AVKit

class AvPlayerController: AVPlayerViewController {
    func playVideo(from videoURL: URL) {
        let player = AVPlayer(url: videoURL)
        self.player = player
        
        self.present(self, animated: true) {
            player.play()
        }
    }
}
