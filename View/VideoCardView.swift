//
//  VideoCardView.swift
//  VideoPlayer
//
//  Created by Ojasvi Hardas on 15/03/26.
//


import SwiftUI

struct VideoCardView: View {
    let video: Video
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: video.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 120)
            .clipped()

            VStack(alignment: .leading) {

                Text(video.user.name)
                    .font(.caption)
                    .bold()

                Text("\(video.duration)s")
                    .font(.caption2)
            }
            .padding(6)
            .background(Color.black.opacity(0.6))
            .foregroundColor(.white)
        }
        .cornerRadius(8)
        .shadow(radius: 10)
        
    }
}
#Preview {

    let sampleVideo = Video(
        id: 1,
        duration: 25,
        image: "https://images.pexels.com/videos/2499611/free-video-2499611.jpg",
        user: userName(name: "Don"),

        video_files: []
    )

    VideoCardView(video: sampleVideo)
        .frame(width: 120)
        .padding()
}
