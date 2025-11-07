import UIKit

protocol SearchFilmsViewModelProtocol: AnyObject {
    var onFilmsFetched: (([Film]) -> Void)? { get set }
    var onFilmsFetchedError: ((Error) -> Void)? { get set }

    func searchFilms(query: String)
    func showListFilms(films: [Film])
}

public class SearchFilmsViewModel: SearchFilmsViewModelProtocol {

    private let worker: SearchFilmsWorkerProtocol
    private var coordinator: SearchFilmsCoordinatorProtocol?

    var onFilmsFetched: (([Film]) -> Void)?
    var onFilmsFetchedError: ((any Error) -> Void)?

    init(worker: SearchFilmsWorkerProtocol, coordinator: SearchFilmsCoordinatorProtocol) {
        self.worker = worker
        self.coordinator = coordinator
    }

    func searchFilms(query: String) {
        worker.fetch(query: query) { [weak self] result in
            switch result {
            case .success(let response):
                self?.onFilmsFetched?(response.list)
            case .failure(let err):
                self?.onFilmsFetchedError?(err)
            }
        }
    }

    func showListFilms(films: [Film]) {
        coordinator?.showListFilms(films: films)
    }
}
