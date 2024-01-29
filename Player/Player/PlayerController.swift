//
//  AvPlayerController.swift
//  Player
//
//  Created by A on 2024/01/29.
//

// AvPlayerController.swift

import AVKit

class PlayerController: AVPlayerViewController {
    func playVideo(videoURL: URL) {
        let player = AVPlayer(url: videoURL)
        self.player = player
        if let currentViewController = UIApplication.shared.keyWindow?.rootViewController {
            currentViewController.present(self, animated: true) {
                player.play()
            }
        }
    }
}
