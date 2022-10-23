//
//  RecepiePresenting.swift
//  MakeSomeFood
//
//  Created by Луиза Самойленко on 16.10.2022.
//

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
