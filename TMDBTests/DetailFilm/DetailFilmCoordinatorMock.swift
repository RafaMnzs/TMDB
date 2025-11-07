import XCTest
@testable import TMDB

class DetailFilmCoordinatorMock: DetailFilmCoordinatorProtocol {
    var film: Film

    var saveFilmCalled = false
    var showStartSearchCalled = false

    var navigationController: UINavigationController

    init( navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.film = Film(
            id: 373223,
            title: "Matrix",
            originalTitle: "Matrix",
            overview: "Abstract art film made for gallery exhibition.",
            posterPath: "/wx2s9xYeC6uP2auuuVg99yl4RpU.jpg",
            backdropPath: nil,
            releaseDate: "1973-09-06",
            adult: false,
            genreIDs: [],
            popularity: 0.2501,
            voteCount: 22,
            voteAverage: 6.4
        )
    }

    func save(film: Film) {
        saveFilmCalled = true
    }

    func start() {
        showStartSearchCalled = true
    }
}
