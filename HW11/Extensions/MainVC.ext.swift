import Foundation
import UIKit

extension MainVC {
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout { section, _ in
            switch section {
            case 0: createBannerSection()
            case 1: createTopicSection()
            default: createUserSection()
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
        
        func createTopicSection() -> NSCollectionLayoutSection {
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 7, trailing: 0)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.81), heightDimension: .estimated(51))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 3)
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPagingCentered
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 20, trailing: 30)
            section.boundarySupplementaryItems = [self.createHeaderSize()]
            return section
        }
        
        func createUserSection() -> NSCollectionLayoutSection {
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(213), heightDimension: .absolute(173))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPagingCentered
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 30, trailing: 30)
            section.boundarySupplementaryItems = [self.createHeaderSize()]
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
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60)),
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom)
        
        footerSize.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: -40, trailing: 0)
        return footerSize
    }
}

