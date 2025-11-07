import XCTest
@testable import TMDB

final class DetailFilmViewModelTests: XCTestCase {

    var sut: DetailFilmViewModel!
    var mockWorker: DetailFilmWorkerMock!
    var mockCoordinator: DetailFilmCoordinatorMock!

    override func setUp() {
        super.setUp()
        mockWorker = DetailFilmWorkerMock()
        mockCoordinator = DetailFilmCoordinatorMock(navigationController: UINavigationController())
        sut = DetailFilmViewModel(worker: mockWorker, coordinator: mockCoordinator)
    }

    override func tearDown() {
        sut = nil
        mockWorker = nil
        mockCoordinator = nil
        super.tearDown()
    }

    func test_fetch_called() {
        sut.onFilmFetched = { film in
            XCTAssertNotNil(film)
        }
        sut.searchFilms()
        XCTAssertTrue(mockWorker.fetchCalled)
    }

    func test_fetch_with_id() {
        sut.onFilmFetched = { film in
            XCTAssertNotNil(film)
        }
        sut.searchFilms()
    }

    func test_save() {
        sut.onFilmFetched = { [weak self] film in
            guard let result = self?.mockCoordinator.saveFilmCalled else { return }
            XCTAssertTrue(result)
        }
        sut.save()
    }
}
