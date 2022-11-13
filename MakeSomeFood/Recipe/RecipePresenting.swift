import UIKit

protocol RecipePresenting: UIViewController {
    func showRecipe(_ recipe: Recipe)
    func showRecipes(_ tagType: TagsType, _ tag: String)
}

extension RecipePresenting {
    func showRecipe(_ recipe: Recipe) {
        let recipeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RecipeViewController") as! RecipeViewController
        recipeVC.recipe = recipe
        show(recipeVC, sender: self)
    }

    func showRecipes(_ tagType: TagsType, _ tag: String) {
        let categoryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CategoryTableViewController") as! CategoryTableViewController
        categoryVC.tagsType = tagType
        categoryVC.category = tag
        show(categoryVC, sender: self)
    }
}
