import UIKit

class SearchCompositionalLayout: UICollectionViewCompositionalLayout {

    enum Section: Int, CaseIterable {
        case category
        case area
        case ingredient
        case allRecipes
    }

    private struct Spec {
        static let chipsItemSizeWidth: CGFloat = 1
        static let chipsItemSizeHeight: CGFloat = 200
        static let chipsGroupLayoutSizeWidth = 1.0
        static let chipsGroupInterItemSpacing: CGFloat = 0
        static let chipsSectionContentInsetsTop: CGFloat = 10
        static let chipsSectionContentInsetsLeading: CGFloat = 0
        static let chipsSectionContentInsetsTrailing: CGFloat = 0
        static let chipsSectionContentInsetsBottom: CGFloat = 16
        static let chipsSectionInterGroupSpacing: CGFloat = 0
        static let chipsFooterHeaderSizeWidth = 1.0
        static let chipsFooterHeaderSizeHeight = 42.0

        static let recipeItemSizeWidth: CGFloat = 100
        static let recipeItemSizeHeight: CGFloat = 100
        static let recipeGroupLayoutSizeWidth = 1.0
        static let recipeGroupInterItemSpacing: CGFloat = 8
        static let recipeSectionContentInsetsTop: CGFloat = 10
        static let recipeSectionContentInsetsLeading: CGFloat = 16
        static let recipeSectionContentInsetsTrailing: CGFloat = 16
        static let recipeSectionContentInsetsBottom: CGFloat = 16
        static let recipeSectionInterGroupSpacing: CGFloat = 12
        static let recipeFooterHeaderSizeWidth = 1.0
        static let recipeFooterHeaderSizeHeight = 42.0
    }

    private static func createLayout() -> ((Int, NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection?) {

        return { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }
            if sectionKind == .allRecipes {
                return createRecipeLayout(sectionIndex: sectionIndex, layoutEnvironment: layoutEnvironment)
            } else {
                return createChipsLayout(sectionIndex: sectionIndex, layoutEnvironment: layoutEnvironment)
            }
        }
    }

    private static func createChipsLayout(sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(Spec.chipsItemSizeWidth),
            heightDimension: .estimated(Spec.chipsItemSizeHeight)
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(Spec.recipeGroupLayoutSizeWidth),
                heightDimension: itemSize.heightDimension
            ),  subitems: [.init(layoutSize: itemSize)])
        group.interItemSpacing = .fixed(Spec.recipeGroupInterItemSpacing)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: Spec.recipeSectionContentInsetsTop, leading: Spec.recipeSectionContentInsetsLeading, bottom: Spec.recipeSectionContentInsetsBottom, trailing: Spec.recipeSectionContentInsetsTrailing)
        section.interGroupSpacing = Spec.recipeSectionInterGroupSpacing

        let footerHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(Spec.recipeFooterHeaderSizeWidth),
            heightDimension: .absolute(Spec.recipeFooterHeaderSizeHeight)
        )

        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [header]

        return section
    }

    private static func createRecipeLayout(sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(Spec.chipsItemSizeWidth),
            heightDimension: .estimated(Spec.chipsItemSizeHeight)
        )

        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(Spec.chipsGroupLayoutSizeWidth),
                heightDimension: itemSize.heightDimension
            ),  subitems: [.init(layoutSize: itemSize)])
        group.interItemSpacing = .fixed(Spec.chipsGroupInterItemSpacing)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: Spec.chipsSectionContentInsetsTop, leading: Spec.chipsSectionContentInsetsLeading, bottom: Spec.chipsSectionContentInsetsBottom, trailing: Spec.chipsSectionContentInsetsTrailing)
        section.interGroupSpacing = Spec.chipsSectionInterGroupSpacing

        let footerHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(Spec.chipsFooterHeaderSizeWidth),
            heightDimension: .absolute(Spec.chipsFooterHeaderSizeHeight)
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
