import UIKit

protocol SavedFilmsViewDelegate: AnyObject {
    func filmSelected(_ film: Film)
}

final class SavedFilmsView: UIView, ViewCode {

    weak var delegate: SavedFilmsViewDelegate?

    private var films: [Film] = []

    private lazy var collectionView: UICollectionView = {
        let _layout = UICollectionViewFlowLayout()
        _layout.scrollDirection = .vertical
        let _collectionView = UICollectionView(frame: .zero, collectionViewLayout: _layout)
        _collectionView.backgroundColor = .systemBackground
        _collectionView.delegate = self
        _collectionView.dataSource = self
        _collectionView.register(SavedFilmsViewCell.self, forCellWithReuseIdentifier: SavedFilmsViewCell.identifier)
        _collectionView.translatesAutoresizingMaskIntoConstraints = false
        return _collectionView
    }()

    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func settings(itens: [Film]) {
        self.films = itens
        collectionView.reloadData()
    }
}

// MARK: - ViewCode Method
extension SavedFilmsView {
    
    func buildViewHierarchy() {
        addSubview(collectionView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

// MARK: - UICollectionViewDataSource
extension SavedFilmsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return films.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SavedFilmsViewCell.identifier, for: indexPath) as? SavedFilmsViewCell else {
            fatalError("Unable to dequeue ListFilmsViewCell")
        }

        cell.settings(item: films[indexPath.row])
        cell.backgroundColor = .white
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.filmSelected(films[indexPath.row])
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SavedFilmsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 4
        let totalSpacing = spacing * (2 - 1)
        let width = (collectionView.bounds.width - totalSpacing) / 2
        let film = films[indexPath.row]

        let titleFont = UIFont.systemFont(ofSize: 14)
        let titleWidth = width - 8
        let titleText = film.title ?? String()
        let titleHeight = (titleText as NSString).boundingRect(with: CGSize(width: titleWidth, height: .greatestFiniteMagnitude),
                                                               options: .usesLineFragmentOrigin,
                                                               attributes: [.font: titleFont],
                                                               context: nil).height
        let posterHeight = width * 1.2
        let extraHeight: CGFloat = 60
        let totalHeight = posterHeight + titleHeight + extraHeight

        return CGSize(width: width, height: totalHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}

// MARK: - UICollectionViewDelegate
extension SavedFilmsView: UICollectionViewDelegate {}

