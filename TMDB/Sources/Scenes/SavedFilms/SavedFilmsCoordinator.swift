import UIKit

protocol SavedFilmsCoordinatorProtocol: Coordinator {
    func showDetail(with film: Film)
}

class SavedFilmsCoordinator: SavedFilmsCoordinatorProtocol {

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let worker = SavedFilmsWorker()
        let viewModel = SavedFilmsViewModel(worker: worker, coordinator: self)
        let viewController = SavedFilmsViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showDetail(with film: Film) {
        let coordinator = DetailFilmCoordinator(navigationController: navigationController, film: film, hideSave: true, hideDelete: false)
        coordinator.start()
    }
}
