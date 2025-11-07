import UIKit

protocol SearchFilmsCoordinatorProtocol: Coordinator{
    func showListFilms(films: [Film])
}

class SearchFilmsCoordinator: SearchFilmsCoordinatorProtocol {

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let woker = SearchFilmsWorker()
        let viewModel = SearchFilmsViewModel(worker: woker, coordinator: self)
        let controller = SearchFilmsViewController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }

    func showListFilms(films: [Film]) {
        let coordinator = ListFilmsCoordinator(navigationController: navigationController, films: films)
        coordinator.start()
    }
}
