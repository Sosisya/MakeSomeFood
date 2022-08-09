import Foundation
import UIKit

struct Category {
    var nameOfCategory: String
    var imageOfCategory: UIImage?
}

var categoryOfMeal = [
    Category(nameOfCategory: "Завтрак", imageOfCategory: UIImage(named: "breakfast")),
    Category(nameOfCategory: "Горячее", imageOfCategory: UIImage(named: "hotDish")),
    Category(nameOfCategory: "Супы", imageOfCategory: UIImage(named: "soups")),
    Category(nameOfCategory: "Десерты", imageOfCategory: UIImage(named: "deserts"))
]
