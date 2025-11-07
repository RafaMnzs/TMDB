import UIKit

protocol ListFilmsCoordinatorProtocol: Coordinator {
    var films: [Film] { get set }
    func showDetail(with film: Film)
}

class ListFilmsCoordinator: ListFilmsCoordinatorProtocol {

    var films: [Film]
    var navigationController: UINavigationController

    init(navigationController: UINavigationController, films: [Film]) {
        self.films = films
        self.navigationController = navigationController
    }

    func start() {
        let viewModel = ListFilmsViewModel(films: films, coordinator: self)
        let viewController = ListFilmsViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }

    func showDetail(with film: Film) {
        let coordinator = DetailFilmCoordinator(navigationController: navigationController, film: film, hideSave: false, hideDelete: true)
        coordinator.start()
    }
}
