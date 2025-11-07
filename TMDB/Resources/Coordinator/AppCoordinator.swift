import UIKit

class AppCoordinator: Coordinator {
    internal var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let coordinator = SearchFilmsCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
