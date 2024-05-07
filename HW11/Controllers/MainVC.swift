import UIKit

final class MainVC: UIViewController {

    private lazy var collectionData : [MainPageSection] = MainPageSection.getMockData()
    
    private lazy var reusableViewData : [ReusableViewItem] = ReusableViewItem.getMockData()
    
    private lazy var collectionView : UICollectionView = {
        $0.backgroundColor = .appWhite
        $0.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.reuseID)
        $0.register(TopicCell.self, forCellWithReuseIdentifier: TopicCell.reuseID)
        $0.register(UserCell.self, forCellWithReuseIdentifier: UserCell.reuseID)
        $0.dataSource = self
        $0.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.reuseID)
        $0.register(FooterCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCell.reuseID)
        $0.delegate = self
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: createLayout()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
    }
}

extension MainVC : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionData[section].group.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = collectionData[indexPath.section].group[indexPath.item]
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.reuseID, for: indexPath) as? BannerCell else { return UICollectionViewCell() }
            
            cell.setUpCell(withItem: item, itemIndex: indexPath.row)
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicCell.reuseID, for: indexPath) as? TopicCell else { return UICollectionViewCell() }
            
            cell.setUpCell(withItem: item)
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCell.reuseID, for: indexPath) as? UserCell else { return UICollectionViewCell() }
            
            cell.setUpCell(withItem: item)
            return cell
        }
    }
    
}

extension MainVC : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let item = reusableViewData[indexPath.section]
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.reuseID, for: indexPath) as? HeaderCell else { return UICollectionReusableView() }
            
            cell.setUpHeader(withItem: item, sectionIndex: indexPath.section)
            return cell
        default:
            guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCell.reuseID, for: indexPath) as? FooterCell else { return UICollectionReusableView() }
            
            cell.setUpFooter(withItem: item)
            return cell
        }
    }
}
