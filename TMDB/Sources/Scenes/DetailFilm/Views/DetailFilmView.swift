import UIKit

public final class DetailFilmView: UIView, ViewCode {

    private lazy var scrollView: UIScrollView = {
        let _scrollView = UIScrollView()
        _scrollView.translatesAutoresizingMaskIntoConstraints = false
        return _scrollView
    }()

    private lazy var contentView: UIView = {
        let _view = UIView()
        _view.translatesAutoresizingMaskIntoConstraints = false
        return _view
    }()

    private lazy var bannerImageView: UIImageView = {
        let _imageView = UIImageView()
        _imageView.translatesAutoresizingMaskIntoConstraints = false
        _imageView.contentMode = .scaleAspectFill
        return _imageView
    }()

    private lazy var titleLabel: UILabel = {
        let _label = UILabel()
        _label.font = UIFont.boldSystemFont(ofSize: 20)
        _label.textColor = .label
        _label.numberOfLines = 0
        _label.translatesAutoresizingMaskIntoConstraints = false
        return _label
    }()

    private lazy var originalTitleLabel: UILabel = {
        let _label = UILabel()
        _label.font = UIFont.systemFont(ofSize: 16)
        _label.textColor = .secondaryLabel
        _label.numberOfLines = 0
        _label.translatesAutoresizingMaskIntoConstraints = false
        return _label
    }()

    private lazy var overviewLabel: UILabel = {
        let _label = UILabel()
        _label.font = UIFont.systemFont(ofSize: 15)
        _label.textColor = .label
        _label.numberOfLines = 0
        _label.translatesAutoresizingMaskIntoConstraints = false
        return _label
    }()

    private lazy var releaseDateLabel: UILabel = {
        let _label = UILabel()
        _label.font = UIFont.systemFont(ofSize: 14)
        _label.textColor = .secondaryLabel
        _label.numberOfLines = 1
        _label.translatesAutoresizingMaskIntoConstraints = false
        return _label
    }()

    private lazy var budgetLabel: UILabel = {
        let _label = UILabel()
        _label.font = UIFont.systemFont(ofSize: 14)
        _label.textColor = .secondaryLabel
        _label.numberOfLines = 1
        _label.translatesAutoresizingMaskIntoConstraints = false
        return _label
    }()

    private lazy var revenueLabel: UILabel = {
        let _label = UILabel()
        _label.font = UIFont.systemFont(ofSize: 14)
        _label.textColor = .secondaryLabel
        _label.numberOfLines = 1
        _label.translatesAutoresizingMaskIntoConstraints = false
        return _label
    }()

    private lazy var voteAverageLabel: UILabel = {
        let _label = UILabel()
        _label.font = UIFont.systemFont(ofSize: 14)
        _label.textColor = .systemYellow
        _label.numberOfLines = 1
        _label.translatesAutoresizingMaskIntoConstraints = false
        return _label
    }()

    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func settings(with film: DetailFilmResponse) {
        settingView(with: film)
    }

    private func settingView(with film: DetailFilmResponse) {

        if let backdropPath = film.backdropPath,
           let url = URL(string: "\(TMDBSettings.imageURL)\(backdropPath)") {
            bannerImageView.setImage(url: url, placeholder: UIImage(named: "background"))
        } else {
            bannerImageView.image = UIImage(named: "background")
        }

        if let date = film.releaseDate.toBrazilianDate() {
            releaseDateLabel.text = "Data de lançamento: \(date)"
        }

        titleLabel.text = film.title
        originalTitleLabel.text = "Titulo Original: \(film.originalTitle)"
        overviewLabel.text = "Resumo: \(film.overview ?? String())"
        overviewLabel.text = "Resumo: \(film.overview ?? String())"

        budgetLabel.text = "Custo de Produção: \(film.budget.toDollarString())"
        revenueLabel.text = "Arrecadação: \(film.revenue.toDollarString())"
        voteAverageLabel.text = "Média de Votos: \(film.voteAverage)"
    }
}

extension DetailFilmView {

    func buildViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(bannerImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(originalTitleLabel)
        contentView.addSubview(overviewLabel)
        contentView.addSubview(releaseDateLabel)
        contentView.addSubview(budgetLabel)
        contentView.addSubview(revenueLabel)
        contentView.addSubview(voteAverageLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            bannerImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bannerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bannerImageView.heightAnchor.constraint(equalToConstant: 200),

            titleLabel.topAnchor.constraint(equalTo: bannerImageView.bottomAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            originalTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            originalTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            originalTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            overviewLabel.topAnchor.constraint(equalTo: originalTitleLabel.bottomAnchor, constant: 8),
            overviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            overviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            releaseDateLabel.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 8),
            releaseDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            releaseDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            budgetLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 8),
            budgetLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            budgetLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            revenueLabel.topAnchor.constraint(equalTo: budgetLabel.bottomAnchor, constant: 8),
            revenueLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            revenueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            voteAverageLabel.topAnchor.constraint(equalTo: revenueLabel.bottomAnchor, constant: 8),
            voteAverageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            voteAverageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            voteAverageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}

