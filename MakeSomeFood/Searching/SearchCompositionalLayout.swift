import UIKit

class SearchCompositionalLayout: UICollectionViewCompositionalLayout {

    enum Section: Int, CaseIterable {
        case category
        case area
        case ingredient
        case allRecipes
    }

    private static func createLayout() -> ((Int, NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection?) {

        return { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }
            if sectionKind == .allRecipes {
                return createRecepieLayout(sectionIndex: sectionIndex, layoutEnvironment: layoutEnvironment)
            } else {
                return createChipsLayout(sectionIndex: sectionIndex, layoutEnvironment: layoutEnvironment)
            }
        }
    }

    private static func createRecepieLayout(sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(200)
        )

        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: itemSize.heightDimension
            ),  subitems: [.init(layoutSize: itemSize)])
        group.interItemSpacing = .fixed(0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 10, leading: 0, bottom: 16, trailing: 0)
        section.interGroupSpacing = 0

        let footerHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(42.0)
        )

        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [header]

        return section
    }

    private static func createChipsLayout(sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(100),
            heightDimension: .estimated(100)
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: itemSize.heightDimension
            ),  subitems: [.init(layoutSize: itemSize)])
        group.interItemSpacing = .fixed(8)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 10, leading: 16, bottom: 16, trailing: 16)
        section.interGroupSpacing = 12

        let footerHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(42.0)
        )

        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [header]

        return section
    }

    init() {
        super.init(sectionProvider: SearchCompositionalLayout.createLayout())

    }

    required init?(coder: NSCoder) {
        super.init(sectionProvider: SearchCompositionalLayout.createLayout())
    }
}
