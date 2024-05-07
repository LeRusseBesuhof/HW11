import UIKit

final class ProfileVC: UIViewController {

    private lazy var elementWidth : CGFloat = view.frame.width - 60
    
    private lazy var profilePicture : UIImageView = AppUIFuncs.createImageView(
        withSize: CGRect(x: 60, y: 100, width: view.frame.width - 120, height: elementWidth - 60),
        cornerRadius: 0.5 * (view.frame.width - 120))
    
    private lazy var nameLabel : UILabel = AppUIFuncs.createLabel(
        withFont: UIFont.systemFont(ofSize: 30),
        size: CGRect(x: 30, y: profilePicture.frame.maxY + 30, width: elementWidth, height: 40),
        textColor: .black,
        alignment: .center)
    
    private lazy var galleryData : [ProfileGalleryItem] = ProfileGalleryItem.getMockData()
    
    private lazy var galleryCollection : UICollectionView = {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 16
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 80, height: 80)
        $0.register(ProfileCell.self, forCellWithReuseIdentifier: ProfileCell.reuseID)
        $0.dataSource = self
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .appWhite
        return $0
    }(UICollectionView(
        frame: CGRect(x: 30, y: nameLabel.frame.maxY + 30, width: elementWidth, height: 80),
        collectionViewLayout: UICollectionViewFlowLayout()))
    
    private lazy var statusLabel : UILabel = AppUIFuncs.createLabel(
        withFont: UIFont.systemFont(ofSize: 16, weight: .thin),
        size: CGRect(x: 30, y: galleryCollection.frame.maxY + 30, width: elementWidth, height: 100),
        textColor: .black,
        alignment: .center)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appWhite
        navigationItem.title = "Messages"
        
        profilePicture.image = UIImage(named: "gendalf")
        nameLabel.text = "Paul Gradoff"
        statusLabel.text = "Trainee iOS-developer.\nStack: Swift, UIKit, Git, Figma.\nHope you're interested in my CV. \nWrite me on Telegram or e-mail p.grad0ff@gmail.com"
        
        [profilePicture, nameLabel, galleryCollection, statusLabel].forEach { view.addSubview($0) }
    }
}

extension ProfileVC : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        galleryData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = galleryData[indexPath.item]
        guard let cell = galleryCollection.dequeueReusableCell(withReuseIdentifier: ProfileCell.reuseID, for: indexPath) as? ProfileCell else { return UICollectionViewCell() }
        
        cell.setUpCell(withItem: item)
        return cell
    }
    
    
}
