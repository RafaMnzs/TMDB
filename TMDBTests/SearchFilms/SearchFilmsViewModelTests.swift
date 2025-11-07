import XCTest
@testable import TMDB


final class SearchFilmsViewModelTests: XCTestCase {

    var sut: SearchFilmsViewModel!
    var mockWorker: SearchFilmsWorkerMock!
    var mockCoordinator: SearchFilmsCoordinatorMock!

    override func setUp() {
        super.setUp()
        mockWorker = SearchFilmsWorkerMock()
        mockCoordinator = SearchFilmsCoordinatorMock(navigationController: UINavigationController())
        sut = SearchFilmsViewModel(worker: mockWorker, coordinator: mockCoordinator)
    }

    override func tearDown() {
        sut = nil
        mockWorker = nil
        mockCoordinator = nil
        super.tearDown()
    }

    func test_fetch_called() {
        sut.searchFilms(query: "matrix")
        XCTAssertTrue(mockWorker.fetchCalled)
    }

    func test_fetch_with_query() {
        let query = "matrix"

        sut.onFilmsFetched = { films in
            XCTAssertFalse(films.isEmpty)
            XCTAssertEqual(films.count, 2)
            XCTAssertEqual(films.first?.title, "Matrix")
            XCTAssertEqual(films.first?.id, 373223)
        }
        sut.searchFilms(query: query)
    }
}
