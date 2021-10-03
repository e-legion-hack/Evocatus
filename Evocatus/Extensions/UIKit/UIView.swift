import UIKit

extension UIView {
    @discardableResult func addSubviews(_ subviews: UIView...) -> Self {
        subviews.forEach { view in
            self.addSubview(view)
        }
        return self
    }
}
