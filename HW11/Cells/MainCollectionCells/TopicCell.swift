import UIKit

final class TopicCell: UICollectionViewCell, CollectionCellProtocol {
    
    static var reuseID: String = "topic"
    
    internal var completion: (() -> Void)?
    
    internal var imageView: UIImageView = AppUIFuncs.createImageView(
        withSize: CGRect(x: 18, y: 9, width: 25, height: 25),
        cornerRadius: 0)
    
    internal lazy var textLabel: UILabel = AppUIFuncs.createLabel(
        withFont: UIFont.systemFont(ofSize: 14, weight: .thin),
        size: CGRect(x: imageView.frame.maxX + 10, y: 13, width: 210, height: 17),
        textColor: .black)
    
    private lazy var button : UIButton = {
        return $0
    }(UIButton(
        frame: CGRect(x: textLabel.frame.maxX + 10, y: 14, width: 16, height: 16),
        primaryAction: UIAction(handler: { [weak self] _ in self?.completion?() })
    ))
    
    func setUpCell(withItem item: MainPageItem) {
        
        AppUIFuncs.setViewData(toImageView: imageView, textLabel: textLabel, fromItem: item)
        setCellConfig(cornerRadius: 15)
        button.setBackgroundImage(UIImage(named: "arrow"), for: .normal)
        
        [imageView, textLabel, button].forEach { addSubview($0) }
    }
}

