//
//  TableViewController.swift
//  Player
//
//  Created by A on 2024/01/29.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    var videoInfoList: [VideoInfo] = []
    var player = PlayerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        fetchData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("TableView Frame: \(tableView.frame)")
    }
    
    func fetchData() {
        VideoDataService.shared.fetchData { [weak self] videoInfoList in
            self?.videoInfoList = videoInfoList
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func setupTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.register(VideoCell.self, forCellReuseIdentifier: "VideoCell")
    }
}

extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.videoInfoList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = self.videoInfoList[indexPath.row]
        player.playVideo(videoURL: product.videoUrl)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as? VideoCell
        else {
            return UITableViewCell()
        }
        
        let product = self.videoInfoList[indexPath.row]
        print(product)
        cell.setThumbnail(imageURL: product.thumbnailUrl)
        cell.setTitle(title: product.title)
        
        return cell
    }
}
