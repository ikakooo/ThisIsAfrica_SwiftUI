//
//  VideoPlayerHelper.swift
//  ThisIsAfrica
//
//  Created by IKAKOOO on 12/25/22.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName:String, fileFormat: String)-> AVPlayer{
    if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
        videoPlayer?.play()
    }
    return videoPlayer!
}
