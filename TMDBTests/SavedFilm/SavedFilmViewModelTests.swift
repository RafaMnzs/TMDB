import XCTest
@testable import TMDB

final class SavedFilmViewModelTests: XCTestCase {

    var sut: SavedFilmsViewModel!
    var mockWorker: SavedFilmWorkerMock!
    var mockCoordinator: SavedFilmCoordinatorMock!

    override func setUp() {
        super.setUp()
        mockWorker = SavedFilmWorkerMock()
        mockCoordinator = SavedFilmCoordinatorMock(navigationController: UINavigationController())
        sut = SavedFilmsViewModel(worker: mockWorker, coordinator: mockCoordinator)
    }

    override func tearDown() {
        sut = nil
        mockWorker = nil
        mockCoordinator = nil
        super.tearDown()
    }

    func test_fetch_all_films() {
        sut.onFilmsFetched = { films in
            XCTAssertEqual(films.count, 2)
        }
        sut.fetchAllSavedFilms()
    }

    func test_show_detail() {
        sut.onFilmsFetched = {[weak self] films in
            guard let film = films.first else { return }

            self?.sut.showDetails(for: film)

            guard let result = self?.mockCoordinator.showDetailCalled else { return }
            XCTAssertTrue(result)
        }
        sut.fetchAllSavedFilms()
    }
}
