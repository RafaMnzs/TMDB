import XCTest
@testable import TMDB

class SavedFilmCoordinatorMock: SavedFilmsCoordinatorProtocol {

    var showDetailCalled = false
    var showSavedStartCalled = false

    var navigationController: UINavigationController

    init(navigationController: UINavigationController, saveFilmCalled: Bool = false, showStartSearchCalled: Bool = false) {
        self.navigationController = navigationController
        self.showDetailCalled = saveFilmCalled
        self.showSavedStartCalled = showStartSearchCalled
    }

    func start() {
        showSavedStartCalled = true
    }

    func showDetail(with film: TMDB.Film) {
        showDetailCalled = true
    }

}
