import UIKit

class SearchCompositionalLayout: UICollectionViewCompositionalLayout {

    enum Section: Int, CaseIterable {
        case category
        case kitchen
        case ingredient
        case allRecepie

        var columnCount: Int {
            switch self {
            case .allRecepie:
                return 1
            default:
                return 3
            }
        }
    }

    private static func createLayout() -> ((Int, NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection?) {

        return { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in

            guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }

            let columns = sectionKind.columnCount

            let itemSize = NSCollectionLayoutSize(
                widthDimension: .estimated(100),
                heightDimension: .estimated(100)
            )

//            let itemSize = NSCollectionLayoutSize(
//                widthDimension: .fractionalWidth(1.0),
//                heightDimension: .fractionalHeight(1.0))

            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = .init(top: 6, leading: 6, bottom: 6, trailing: 6)

            let groupHeight = columns == 1 ?
                NSCollectionLayoutDimension.estimated(350):
            NSCollectionLayoutDimension.absolute(34)

            let groupWidht = columns == 1 ?
                NSCollectionLayoutDimension.fractionalWidth(1):
            NSCollectionLayoutDimension.fractionalWidth(1)

            let groupSize = NSCollectionLayoutSize(
                widthDimension: groupWidht,
                heightDimension: groupHeight
            )

 //           let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: columns)
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: itemSize.heightDimension
                ),
                subitems: [.init(layoutSize: itemSize)]
            )
            group.interItemSpacing = .fixed(10)

            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 20, leading: 20, bottom: 20, trailing: 20)
            section.interGroupSpacing = 10
            return section
        }
    }

    init() {
        super.init(sectionProvider: SearchCompositionalLayout.createLayout())

    }

    required init?(coder: NSCoder) {
        super.init(sectionProvider: SearchCompositionalLayout.createLayout())
    }
}
