import XCTest
@testable import TMDB

class SearchFilmsCoordinatorMock: SearchFilmsCoordinatorProtocol {
    var showListFilmsCalled = false
    var showStartSearchCalled = false

    var navigationController: UINavigationController

    init( navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showStartSearchCalled = true
    }

    func showListFilms(films: [Film]) {
        showListFilmsCalled = true
    }
}
