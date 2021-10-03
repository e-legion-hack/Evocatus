import UIKit

enum PrimaryButton {
    static func make(title: String = "Применить") -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "main")
        button.layer.cornerRadius = 16
        return button
    }
}
