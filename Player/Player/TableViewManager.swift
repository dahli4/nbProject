//
//  TableViewManager.swift
//  Player
//
//  Created by A on 2024/01/29.
//

import Foundation

class VideoDataService {
    static let shared = VideoDataService()

    func fetchData(completion: @escaping ([VideoInfo]) -> Void) {
        guard let url = URL(
                string: "https://gist.githubusercontent.com/poudyalanil/ca84582cbeb4fc123a13290a586da925/raw/14a27bd0bcd0cd323b35ad79cf3b493dddf6216b/videos.json"
            )
        else { return }

        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let videoInfoList = try JSONDecoder().decode([VideoInfo].self, from: data)
                completion(videoInfoList)
            } catch {
                print("error: \(error)")
                completion([])
            }
        }
    }
}
