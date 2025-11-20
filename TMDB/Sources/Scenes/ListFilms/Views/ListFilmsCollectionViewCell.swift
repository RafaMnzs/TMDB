import UIKit

final class ListFilmsViewCell: UICollectionViewCell, ViewCode {

    static let identifier = "cell"

    private var currentFilm: Film?

    private lazy var posterImageView: UIImageView = {
        let _imageView = UIImageView()
        _imageView.contentMode = .scaleAspectFill
        _imageView.translatesAutoresizingMaskIntoConstraints = false
        return _imageView
    }()

    private lazy var countLabel: UILabel = {
        let _label = UILabel()
        _label.textAlignment = .center
        _label.textColor = .white
        _label.backgroundColor = .systemYellow
        _label.font = UIFont.boldSystemFont(ofSize: 12)
        _label.translatesAutoresizingMaskIntoConstraints = false
        _label.layer.cornerRadius = 12
        _label.layer.masksToBounds = true
        return _label
    }()

    private lazy var titleLabel: UILabel = {
        let _label = UILabel()
        _label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        _label.textColor = .label
        _label.textAlignment = .center
        _label.numberOfLines = 2
        _label.translatesAutoresizingMaskIntoConstraints = false
        return _label
    }()

    private lazy var starImageView: UIImageView = {
        let _imageView = UIImageView(image: UIImage(systemName: "star.fill"))
        _imageView.tintColor = .systemYellow
        _imageView.isHidden = true
        _imageView.translatesAutoresizingMaskIntoConstraints = false
        return _imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func settings(item: Film) {
        setupLabel(item: item)
        setupImage(item: item)
        isFavorite(item: item)
    }

    private func isFavorite(item: Film) {
        DispatchQueue.main.async { [weak self] in
            let isSaved = RealmManager.shared.isSaved(item.id)
            self?.starImageView.isHidden = !isSaved
        }
    }

    private func setupLabel(item: Film) {
        currentFilm = item
        if let originalTitle = item.originalTitle {
            titleLabel.text = originalTitle
        }

        if let count = item.voteAverage {
            countLabel.text = count.description
        }
    }

    private func setupImage(item: Film) {
        if let urlImage = item.posterPath {
            if let imageUrl = URL(string: "\(TMDBSettings.imageURL)\(urlImage)") {
                self.posterImageView.setImage(url: imageUrl)
            }
        }
    }

    private func setupViews() {
        buildViewHierarchy()
        setupConstraints()
    }
}

extension ListFilmsViewCell {
    func buildViewHierarchy() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        posterImageView.addSubview(countLabel)
        posterImageView.addSubview(starImageView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            posterImageView.heightAnchor.constraint(equalTo: posterImageView.widthAnchor, multiplier: 1.5),

            countLabel.bottomAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: -8),
            countLabel.leadingAnchor.constraint(equalTo: posterImageView.leadingAnchor, constant: 8),
            countLabel.widthAnchor.constraint(equalToConstant: 36),
            countLabel.heightAnchor.constraint(equalToConstant: 36),

            starImageView.topAnchor.constraint(equalTo: posterImageView.topAnchor, constant: 8),
            starImageView.leadingAnchor.constraint(equalTo: posterImageView.leadingAnchor, constant: 8),
            starImageView.widthAnchor.constraint(equalToConstant: 20),
            starImageView.heightAnchor.constraint(equalToConstant: 20),

            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
