import UIKit

protocol DetailFilmViewModelProtocol: AnyObject{

    var onFilmFetched: ((DetailFilmResponse) -> Void)? { get set }
    var onFilmFetchedError: ((Error) -> Void)? { get set }

    func searchFilms()
    func save()
    func delete()
}

class DetailFilmViewModel: DetailFilmViewModelProtocol {

    private var film: DetailFilmResponse?
    private let worker: DetailFilmWorkerProtocol
    private let coordinator: DetailFilmCoordinatorProtocol?

    var onFilmFetched: ((DetailFilmResponse) -> Void)?
    var onFilmFetchedError: ((Error) -> Void)?

    init(worker: DetailFilmWorkerProtocol, coordinator: DetailFilmCoordinatorProtocol?) {
        self.worker = worker
        self.coordinator = coordinator
    }

    func searchFilms() {
        guard let id = coordinator?.film.id else { return }
        worker.fetch(id: id) { [weak self] result in
            switch result {
            case .success(let film):
                self?.film = film
                self?.onFilmFetched?(film)
            case .failure(let error):
                self?.onFilmFetchedError?(error)
            }
        }
    }

    func save() {
        guard let film = film else {
            return
        }
        RealmManager.shared.saveFilm(film)
    }

    func delete() {
        guard let film = film else {
            return
        }
        RealmManager.shared.deleteFilm(film.id)
    }
}
