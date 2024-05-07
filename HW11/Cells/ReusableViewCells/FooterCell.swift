import UIKit

final class FooterCell: UICollectionReusableView {
    
    static var reuseID: String = "footer"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var descr : UILabel = AppUIFuncs.createLabel(
        withFont: UIFont.systemFont(ofSize: 12, weight: .light),
        size: CGRect(x: 13, y: 0, width: frame.width, height: 60),
        textColor: .darkGray)
    
    internal func setUpFooter(withItem item: ReusableViewItem) {
         
        descr.text = item.footerText
        addSubview(descr)
    }
}
