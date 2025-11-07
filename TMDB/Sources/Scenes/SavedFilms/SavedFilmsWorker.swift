import Foundation

protocol SavedFilmsWorkerProtocol: AnyObject {
    func fetch(completion: @escaping (Result<[Film], Error>) -> Void)
}

class SavedFilmsWorker: SavedFilmsWorkerProtocol {
    func fetch(completion: @escaping (Result<[Film], any Error>) -> Void) {
        let savedFilms = RealmManager.shared.fetchAllFilms().map { $0.toFilm() }
        completion(.success(savedFilms))
    }
}
