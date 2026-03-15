import Foundation
import Combine


@MainActor
class VideoListViewModel: ObservableObject {

    @Published var videos: [Video] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private var page = 1
    private let service = PexelsAPIService()

    func loadVideos() async {

        if isLoading { return }
        isLoading = true

        do {
            let newVideos = try await service.fetchVideos(page: page)
            videos.append(contentsOf: newVideos)
            page += 1
        } catch {
            errorMessage = "Failed to load videos"
        }
        isLoading = false
    }
}
