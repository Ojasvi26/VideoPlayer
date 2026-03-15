//
//  VideoPlayerPage.swift
//  VideoPlayer
//
//  Created by Ojasvi Hardas on 15/03/26.
//


import SwiftUI
import AVKit

struct VideoPlayerPage: View {

    let videos: [Video]
    @State var currentIndex: Int

    @State private var player = AVPlayer()

    var body: some View {

        VStack {

            VideoPlayer(player: player)
                .frame(height: 300)
                .onAppear {
                    playVideo()
                }

            NextVideoListView(videos: videos, currentIndex: $currentIndex) {
                playVideo()
            }

        }
    }
    func playVideo() {
        let video = videos[currentIndex]
        if let link = video.video_files.first?.link {
            player = AVPlayer(url: URL(string: link)!)
            player.play()
            NotificationCenter.default.addObserver(
                forName: .AVPlayerItemDidPlayToEndTime,
                object: player.currentItem,
                queue: .main
            ) { _ in
                playNextVideo()
            }
        }
    }
    func playNextVideo() {

        if currentIndex + 1 < videos.count {
            currentIndex += 1
            playVideo()
        }
    }
}
#Preview {
    let sampleVideos = [
        Video(
            id: 1,
            duration: 20,
            image: "https://images.pexels.com/videos/2499611/free-video-2499611.jpg",
            user: userName(name: "Don"),

            video_files: [
                VideoFile(
                    link: "https://player.vimeo.com/external/449420540.sd.mp4?s=abc",
                    quality: "sd"
                )
            ]
        ),
        Video(
            id: 2,
            duration: 30,
            image: "https://images.pexels.com/videos/3571264/free-video-3571264.jpg",
            user: userName(name: "Don"),
            video_files: [
                VideoFile(
                    link: "https://player.vimeo.com/external/449420540.sd.mp4?s=abc",
                    quality: "sd"
                )
            ]
        )
    ]
    
    VideoPlayerPage(videos: sampleVideos, currentIndex: 0)
}
