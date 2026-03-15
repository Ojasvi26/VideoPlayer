import Foundation

class PexelsAPIService {

    private let apiKey = "9m863Pesupjs8hIvau0Alfs2sxJnlVxMCssch3gDVSZ03A0QtospaBil"

    func fetchVideos(page: Int) async throws -> [Video] {

        let urlString = "https://api.pexels.com/videos/popular?page=\(page)&per_page=15"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "Authorization")

        let (data, _) = try await URLSession.shared.data(for: request)
     
        let decoded = try JSONDecoder().decode(VideoResponse.self, from: data)

        return decoded.videos
    }
}
