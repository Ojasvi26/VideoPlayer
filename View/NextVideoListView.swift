//
//  NextVideoListView.swift
//  VideoPlayer
//
//  Created by Ojasvi Hardas on 15/03/26.
//


import SwiftUI

struct NextVideoListView: View {

    let videos: [Video]
    @Binding var currentIndex: Int
    var playAction: () -> Void

    var body: some View {
        ScrollView {
            VStack {
                ForEach(videos.indices, id: \.self) { index in
                    if index != currentIndex {
                        HStack {
                            AsyncImage(url: URL(string: videos[index].image)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 60)

                            Text(videos[index].user.name)

                            Spacer()
                        }
                        .padding()
                        .onTapGesture {
                            currentIndex = index
                            playAction()
                        }
                    }
                }
            }
        }
            .shadow(radius: 10)
    }
}

#Preview {

    let sampleVideos = [
        Video(
            id: 1,
            duration: 20,
            image: "https://images.pexels.com/videos/2499611/free-video-2499611.jpg",
            user: userName(name: "Don"),
            video_files: []
        ),
        Video(
            id: 2,
            duration: 30,
            image: "https://images.pexels.com/videos/3571264/free-video-3571264.jpg",
            user: userName(name: "Don"),
            video_files: []
        ),
        Video(
            id: 3,
            duration: 40,
            image: "https://images.pexels.com/videos/856321/free-video-856321.jpg",
            user: userName(name: "Don"),
            video_files: []
        )
    ]

    NextVideoListView(
        videos: sampleVideos,
        currentIndex: .constant(0),
        playAction: {}
    )
}
