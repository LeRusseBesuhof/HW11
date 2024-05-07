import Foundation
import UIKit

extension MainViewController {
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout { section, _ in
            switch section {
            default: createBannerSection()
            }
        }
        
    func createBannerSection() -> NSCollectionLayoutSection {
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.81), heightDimension: .absolute(161))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 25)
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPaging
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30)
            section.boundarySupplementaryItems = [self.createHeaderSize(), self.createFooterSize()]
            return section
        }
    }
    
    func createHeaderSize() -> NSCollectionLayoutBoundarySupplementaryItem {
        
        let headerSize = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        
        headerSize.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: -16, trailing: 0)
        return headerSize
    }
    
    func createFooterSize() -> NSCollectionLayoutBoundarySupplementaryItem {

        let footerSize = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(110)),
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom)
        
        footerSize.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: -40, trailing: 0)
        return footerSize
    }
}

