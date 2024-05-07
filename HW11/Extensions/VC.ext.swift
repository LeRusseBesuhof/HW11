import Foundation
import UIKit

extension UIViewController {
    func setUpTabBar(image: String, title: String) -> Void {
        self.title = title
        self.tabBarItem.image = UIImage(systemName: image)
        self.tabBarItem.selectedImage = UIImage(systemName: image + ".fill")
    }
}
