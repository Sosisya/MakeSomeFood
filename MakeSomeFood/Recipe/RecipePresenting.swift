import UIKit

protocol RecipePresenting: UIViewController {
    func showRecipe(_ recipe: Recipe)
}

extension RecipePresenting {
    func showRecipe(_ recipe: Recipe) {
        let recipeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RecipeViewController") as! RecipeViewController
        recipeVC.recipe = recipe
        show(recipeVC, sender: self)
    }
}
