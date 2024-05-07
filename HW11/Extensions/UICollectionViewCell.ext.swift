import Foundation
import UIKit

extension UICollectionViewCell {
    func setCellConfig(cornerRadius rad: CGFloat) -> Void {
        
        layer.cornerRadius = rad
        backgroundColor = .white
    }
}
