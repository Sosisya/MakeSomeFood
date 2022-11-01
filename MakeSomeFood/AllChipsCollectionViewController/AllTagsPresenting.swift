import UIKit

protocol AllTagsPresenting: UICollectionViewController {
    func showAllTags(_ tag: CategoryTag)
}

extension AllTagsPresenting {
    func showAllTags(_ tag: CategoryTag) {
        let allTagsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AllChipsCollectionViewController") as! AllChipsCollectionViewController
        allTagsVC.tagsOfCategories = tag
        show(allTagsVC, sender: self)
    }
}
