import UIKit

final class UserCell: UICollectionViewCell, CollectionCellProtocol {
    
    static var reuseID: String = "user"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var completion: (() -> Void)?
    
    internal lazy var imageView: UIImageView = AppUIFuncs.createImageView(
        withSize: CGRect(x: 72, y: 17, width: 50, height: 50),
        cornerRadius: 25)
    
    private lazy var titleLabel : UILabel = AppUIFuncs.createLabel(
        withFont: UIFont.systemFont(ofSize: 14, weight: .heavy),
        size: CGRect(x: 14, y: imageView.frame.maxY + 4, width: frame.width - 28, height: 17),
        textColor: .black,
        alignment: .center)
    
    internal lazy var textLabel: UILabel = AppUIFuncs.createLabel(
        withFont: UIFont.systemFont(ofSize: 14),
        size: CGRect(x: 14, y: titleLabel.frame.maxY + 6, width: titleLabel.frame.width, height: 35),
        textColor: .lightGray,
        alignment: .center)
    
    private lazy var button : UIButton = {
        $0.setTitle("Write", for: .normal)
        $0.sizeToFit()
        $0.frame.origin = CGPoint(x: bounds.midX - ($0.frame.width / 2), y: textLabel.frame.maxY + 5)
        return $0
    }(UIButton(primaryAction: UIAction(handler: { [weak self] _ in self?.completion?() })))
    
    func setUpCell(withItem item: MainPageItem) {
        
        AppUIFuncs.setViewData(toImageView: imageView, textLabel: textLabel, titleLabel: titleLabel, fromItem: item)
        setCellConfig(cornerRadius: 20)

        [imageView, titleLabel, textLabel, button].forEach{ addSubview($0) }
    }
}
