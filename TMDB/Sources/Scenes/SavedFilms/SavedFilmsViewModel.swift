import Foundation

protocol SavedFilmsViewModelProtocol: AnyObject {

    var onFilmsFetched: (([Film]) -> Void)? { get set }
    var onFilmsFetchedError: ((Error) -> Void)? { get set }

    func fetchAllSavedFilms()
    func showDetails(for film: Film)
}

class SavedFilmsViewModel: SavedFilmsViewModelProtocol {

    private let worker: SavedFilmsWorkerProtocol
    private let coordinator: SavedFilmsCoordinatorProtocol?

    var onFilmsFetched: (([Film]) -> Void)?
    var onFilmsFetchedError: ((any Error) -> Void)?

    init(worker: SavedFilmsWorkerProtocol, coordinator: SavedFilmsCoordinatorProtocol?) {
        self.worker = worker
        self.coordinator = coordinator
    }
    
    func fetchAllSavedFilms() {
        worker.fetch { [weak self] result in
            switch result {
            case .success(let films):
                self?.onFilmsFetched?(films)
            case .failure(let err):
                self?.onFilmsFetchedError?(err)
            }
        }
    }

    func showDetails(for film: Film) {
        coordinator?.showDetail(with: film)
    }
}
