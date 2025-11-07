import Foundation
import RealmSwift

class DetailFilmResponse: Object, Decodable {
    @objc dynamic var adult: Bool = false
    @objc dynamic var backdropPath: String? = nil
    @objc dynamic var belongsToCollection: BelongsToCollection? = nil
    @objc dynamic var budget: Int = 0
    var genres = List<Genre>()
    @objc dynamic var homepage: String? = nil
    @objc dynamic var id: Int = 0
    @objc dynamic var imdbID: String? = nil
    @objc dynamic var originalLanguage: String = ""
    @objc dynamic var originalTitle: String = ""
    @objc dynamic var overview: String? = nil
    @objc dynamic var popularity: Double = 0.0
    @objc dynamic var posterPath: String? = nil
    var productionCompanies = List<ProductionCompany>()
    var productionCountries = List<ProductionCountry>()
    @objc dynamic var releaseDate: String = ""
    @objc dynamic var revenue: Int = 0
    var runtime = RealmOptional<Int>()
    var spokenLanguages = List<SpokenLanguage>()
    @objc dynamic var status: String = ""
    @objc dynamic var tagline: String? = nil
    @objc dynamic var title: String = ""
    @objc dynamic var video: Bool = false
    @objc dynamic var voteCount: Int = 0
    @objc dynamic var voteAverage: Double = 0.0

    override class func primaryKey() -> String? {
        return "id"
    }


    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case budget
        case genres
        case homepage
        case id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue
        case runtime
        case spokenLanguages = "spoken_languages"
        case status
        case tagline
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

class BelongsToCollection: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var posterPath: String? = nil
    @objc dynamic var backdropPath: String? = nil

    enum CodingKeys: String, CodingKey {
        case id, name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}

class Genre: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
}

class ProductionCompany: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var logoPath: String? = nil
    @objc dynamic var name: String = ""
    @objc dynamic var originCountry: String = ""

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}

class ProductionCountry: Object, Decodable {
    @objc dynamic var iso3166_1: String = ""
    @objc dynamic var name: String = ""

    enum CodingKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case name
    }
}

class SpokenLanguage: Object, Decodable {
    @objc dynamic var englishName: String? = nil
    @objc dynamic var iso639_1: String = ""
    @objc dynamic var name: String = ""

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name
    }
}
