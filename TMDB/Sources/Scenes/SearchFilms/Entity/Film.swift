import Foundation

struct Film: Codable {
    let id: Int
    let title: String?
    let originalTitle: String?
    let overview: String?
    let posterPath: String?
    let backdropPath: String?
    let releaseDate: String?
    let adult: Bool?
    let genreIDs: [Int]?
    let popularity: Double?
    let voteCount: Int?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case originalTitle = "original_title"
        case overview
        case posterPath    = "poster_path"
        case backdropPath  = "backdrop_path"
        case releaseDate   = "release_date"
        case adult
        case genreIDs      = "genre_ids"
        case popularity
        case voteCount     = "vote_count"
        case voteAverage   = "vote_average"
    }
}

extension DetailFilmResponse {
    func toFilm() -> Film {
        return Film(
            id: self.id,
            title: self.title,
            originalTitle: self.originalTitle,
            overview: self.overview,
            posterPath: self.posterPath,
            backdropPath: self.backdropPath,
            releaseDate: self.releaseDate,
            adult: self.adult,
            genreIDs: self.genres.map { $0.id },
            popularity: self.popularity,
            voteCount: self.voteCount,
            voteAverage: self.voteAverage
        )
    }
}
