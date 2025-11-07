import Foundation

protocol ListFilmsViewModelProtocol: AnyObject {
    var films: [Film] {get set}

    func showDetail(for film: Film)
}

class ListFilmsViewModel: ListFilmsViewModelProtocol {

    var films: [Film]

    private var coordinator: ListFilmsCoordinatorProtocol?

    init(films: [Film], coordinator: ListFilmsCoordinatorProtocol) {
        self.films = films
        self.coordinator = coordinator
    }

    func showDetail(for film: Film) {
        coordinator?.showDetail(with: film)
    }
}
