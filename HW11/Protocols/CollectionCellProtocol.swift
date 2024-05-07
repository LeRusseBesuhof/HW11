import Foundation
import UIKit

protocol CollectionCellProtocol {
    static var reuseID : String { get }
    var imageView : UIImageView { get }
    var textLabel : UILabel { get }
}
