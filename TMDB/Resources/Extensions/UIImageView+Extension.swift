import UIKit
import Kingfisher

public extension UIImageView {
    func setImage(url: URL?, placeholder: UIImage? = nil) {
        guard let url = url else {
            self.image = placeholder
            return
        }

        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            placeholder: placeholder,
            options: [
                .transition(.fade(0.5)),
                .cacheOriginalImage
            ]) { result in
                switch result {
                case .success:
                    break
                case .failure(_):
                    self.image = placeholder
                }
            }
    }
}
