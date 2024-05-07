import UIKit

final class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVC()
        
        tabBar.barTintColor = .white
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
    }
    
    func setUpVC() -> Void {
        let mainVC = UINavigationController(rootViewController: MainVC())
        mainVC.setUpTabBar(image: "triangle", title: "Main")
        
        let messagesVC = MessagesVC()
        messagesVC.setUpTabBar(image: "square", title: "Messages")
        
        let profileVC = ProfileVC()
        profileVC.setUpTabBar(image: "circle", title: "Profile")
        
        setViewControllers([mainVC, messagesVC, profileVC], animated: false)
    }
}
