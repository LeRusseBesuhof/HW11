import Foundation
import UIKit

final class AppUIFuncs {
    
    static func createImageView(withSize size: CGRect, cornerRadius rad: CGFloat) -> UIImageView {
        {
            $0.layer.cornerRadius = rad
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.frame = size
            return $0
        }(UIImageView())
    }
    
    static func createLabel(withFont font: UIFont, size: CGRect? = nil, textColor: UIColor, alignment: NSTextAlignment = .left) -> UILabel {
        {
            $0.font = font
            $0.textColor = textColor
            $0.textAlignment = alignment
            $0.numberOfLines = 0
            guard let size = size else { return $0 }
            $0.frame = size
            return $0
        }(UILabel())
    }
    
    static func setViewData(toImageView img: UIImageView, textLabel: UILabel, titleLabel: UILabel? = nil, fromItem item: MainPageItem) {
            
        img.image = UIImage(named: item.image)
        textLabel.text = item.text
        if let titleLabel = titleLabel {
            titleLabel.text = item.title
        }
    }
}
