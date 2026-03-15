//
//  VideoGridView.swift
//  VideoPlayer
//
//  Created by Ojasvi Hardas on 15/03/26.
//


import SwiftUI

struct VideoGridView: View {
    
    @StateObject var vm = VideoListViewModel()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) {
                    
                    ForEach(vm.videos.indices, id: \.self) { index in
                        
                        NavigationLink(
                            destination: VideoPlayerPage(
                                videos: vm.videos,
                                currentIndex: index
                            )
                        ) {
                            VideoCardView(video: vm.videos[index])
                        }
                        .onAppear {
                            
                            if index == vm.videos.count - 3 {
                                Task { await vm.loadVideos() }
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 6) {
                        Image(systemName: "play.rectangle.fill")
                            .foregroundColor(.black)
                        Text("Video Player")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                    }.background(
                        Capsule()
                            .fill(Color.gray.opacity(0.2))
                    )
                }
            }
        }
//        .task{
//                await vm.loadVideos()
//        }
    }
}

#Preview {
    NavigationView {
        VideoGridView()
    }
}
