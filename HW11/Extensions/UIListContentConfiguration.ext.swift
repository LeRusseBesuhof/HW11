import Foundation
import UIKit

extension UIListContentConfiguration {
    mutating func setUpConfig(toName name: String, text: String, image: String) -> Void {
        
        self.text = name
        textProperties.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        self.secondaryText = text
        secondaryTextProperties.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        secondaryTextProperties.numberOfLines = 2
        
        self.image = UIImage(named: image)
        imageProperties.maximumSize = CGSize(width: 56, height: 56)
        imageProperties.cornerRadius = 28
    }
}
