import UIKit

final class HeaderCell: UICollectionReusableView {
    
    static var reuseID: String = "header"
    
    internal var completion : (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var label: UILabel = AppUIFuncs.createLabel(
        withFont: UIFont.systemFont(ofSize: 20, weight: .heavy),
        textColor: .black)
    
    private lazy var button: UIButton = {
        $0.titleLabel?.font = .systemFont(ofSize: 14)
        return $0
    }(UIButton(primaryAction: UIAction(handler: { [weak self] _ in
        self?.completion?()
    })))
    
    private lazy var stack : UIStackView = { st in
        st.axis = .horizontal
        st.distribution = .equalSpacing
        st.alignment = .center
        [label, button].forEach { st.addArrangedSubview($0) }
        return st
    }(UIStackView(frame: CGRect(x: 13, y: 0, width: frame.width, height: 24)))
    
    internal func setUpHeader(withItem item: ReusableViewItem, sectionIndex ind: Int) {
        
        label.text = item.title
        switch ind {
        case 0:
            button.setBackgroundImage(UIImage(named: item.buttonImage!), for: .normal)
        default:
            button.setTitle(item.buttonText!, for: .normal)
        }
        
        addSubview(stack)
    }
}
