struct SearchFilmsResponse: Codable {
    let page: Int
    let list: [Film]
    let totalResults: Int
    let totalPages: Int

    enum CodingKeys: String, CodingKey {
        case page
        case list = "results"
        case totalResults = "total_results"
        case totalPages   = "total_pages"
    }
}
