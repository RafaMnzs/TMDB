import UIKit

protocol DetailFilmCoordinatorProtocol: Coordinator {
    var film: Film {get set}
}

class DetailFilmCoordinator: DetailFilmCoordinatorProtocol {
    var film: Film
    var hideSave: Bool?
    var hideDelete: Bool?

    var navigationController: UINavigationController

    init(navigationController: UINavigationController, film: Film, hideSave: Bool?, hideDelete: Bool?) {
        self.navigationController = navigationController
        self.film = film
        self.hideSave = hideSave
        self.hideDelete = hideDelete
    }

    func start() {
        let worker = DetailFilmWorker()
        let viewModel = DetailFilmViewModel(worker: worker, coordinator: self)
        let viewController = DetailFilmViewController(viewModel: viewModel, hideSave: hideSave, hideDelete: hideDelete)
        navigationController.pushViewController(viewController, animated: true)
    }
}
