//
//  VideoInfo.swift
//  Player
//
//  Created by A on 2024/01/29.
//

import Foundation
struct VideoInfo: Decodable {
    let id: String
    let title: String
    let thumbnailUrl: URL
    let videoUrl: URL
}
