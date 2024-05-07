import UIKit

final class ProfileCell: UICollectionViewCell {
    
    static var reuseID: String = "profile"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal lazy var imageView: UIImageView = AppUIFuncs.createImageView(withSize: CGRect(x: 0, y: 0, width: 80, height: 80), cornerRadius: 10)
    
    func setUpCell(withItem item: ProfileGalleryItem) {
        imageView.image = UIImage(named: item.image)
        addSubview(imageView)
    }
}
