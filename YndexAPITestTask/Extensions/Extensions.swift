import UIKit

/// UILabel extensions

extension UILabel {
    convenience init(text: String, fontSize: Int, weight: UIFont.Weight) {
        self.init(frame: .zero)
        self.text = text
        self.font = .systemFont(ofSize: CGFloat(fontSize), weight: weight)
    }
}

