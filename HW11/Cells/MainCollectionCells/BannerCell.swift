import UIKit

final class BannerCell: UICollectionViewCell, CollectionCellProtocol {

    static var reuseID: String = "banner"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal var completion: (() -> Void)?
    
    internal lazy var imageView : UIImageView = AppUIFuncs.createImageView(
        withSize: CGRect(x: 0, y: 0, width: 296, height: 161),
        cornerRadius: 20)
    
    private lazy var titleLabel : UILabel = AppUIFuncs.createLabel(
        withFont: UIFont.systemFont(ofSize: 20, weight: .heavy),
        size: CGRect(x: 25, y: 23, width: imageView.bounds.width - 50, height: 25),
        textColor: .white)
    
    private lazy var dateLabel : UILabel = AppUIFuncs.createLabel(
        withFont: UIFont.systemFont(ofSize: 12),
        size: CGRect(x: titleLabel.frame.origin.x, y: titleLabel.frame.maxY, width: titleLabel.frame.width, height: 15),
        textColor: .lightGray)
    
    internal lazy var textLabel: UILabel = AppUIFuncs.createLabel(
        withFont: UIFont.systemFont(ofSize: 14),
        size: CGRect(x: dateLabel.frame.origin.x, y: dateLabel.frame.maxY + 10, width: dateLabel.frame.width, height: 54),
        textColor: .white)
    
    // TODO: переделать в кнопку
    // сделаю эту кнопку уникальной, поскольку только она не будет в стеке
    // мб потом сделаю функцию в AppUIFuncs и просто не буду туда передавать размер
    private lazy var readButton : UIButton = {
        $0.setTitle("Read more...", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .thin)
        $0.sizeToFit()
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(buttonTouchDown), for: .touchDown)
        $0.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
        return $0
    }(UIButton(
        frame: CGRect(x: textLabel.frame.origin.x, y: textLabel.frame.maxY, width: 100, height: 17),
        primaryAction: UIAction(handler: { [weak self] _ in
            print("Read more about this device")
        })))
    
    @objc
    private func buttonTouchDown() { readButton.setTitleColor(.darkGray, for: .normal) }
    
    @objc
    private func buttonTouchUpInside() { readButton.setTitleColor(.white, for: .normal) }

    
    func setUpCell(withItem item: MainPageItem, itemIndex ind: Int) {
        
        AppUIFuncs.setViewData(toImageView: imageView, textLabel: textLabel, titleLabel: titleLabel, fromItem: item)
    
        dateLabel.text = getDate(forDay: ind)
        
        [titleLabel, dateLabel, textLabel, readButton].forEach { imageView.addSubview($0) }
        imageView.isUserInteractionEnabled = true
        
        addSubview(imageView)
    }
    
    private func getDate(forDay dayIndex: Int) -> String {
        
        var dateComponents = DateComponents()
        switch dayIndex {
        case 0:
            dateComponents.year = 2007
            dateComponents.month = 1
            dateComponents.day = 9
        case 1:
            dateComponents.year = 1984
            dateComponents.month = 1
            dateComponents.day = 24
        default:
            dateComponents.year = 2016
            dateComponents.month = 9
            dateComponents.day = 7
        }
        let date = Date()
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMMM-yyyy"
        guard let day = calendar.date(from: dateComponents) else {
            return dateFormatter.string(from: date)
        }
        return dateFormatter.string(from: day)
    }
}
