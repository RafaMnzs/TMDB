import UIKit

final class ListFilmsViewController: UIViewController {

    private let customView: ListFilmsView = ListFilmsView()

    private var viewModel: ListFilmsViewModelProtocol?

    init(viewModel: ListFilmsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
       view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Strings.ListFilmsView.title
        customView.delegate = self

        if let films = viewModel?.films {
            customView.settings(itens: films)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        customView.reloadData()
    }
}

extension ListFilmsViewController: ListFilmsViewDelegate {
    func filmSelected(_ film: Film) {
        viewModel?.showDetail(for: film)
    }
}
