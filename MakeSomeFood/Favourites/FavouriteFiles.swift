import Foundation
import UIKit

struct FavouriteRecepies {
    var image: UIImage?
    var nameOfMeal: String
    var categoryTagLabel: String
    var areaTagLabel: String
    //    var addToFavorite: UIImage?
}

var favouriteRecepies = [
    FavouriteRecepies(image: UIImage(named: "Борщ"), nameOfMeal: "Борщ", categoryTagLabel: "Супы", areaTagLabel: "Украинская"),
    FavouriteRecepies(image: UIImage(named: "Наполеон"), nameOfMeal: "Наполеон", categoryTagLabel: "Десерты", areaTagLabel: "Французская"),
    FavouriteRecepies(image: UIImage(named: "Бургер"), nameOfMeal: "Бургер", categoryTagLabel: "Горячее", areaTagLabel: "Американская"),
    FavouriteRecepies(image: UIImage(named: "ФранцузскийЛуковыйСуп"), nameOfMeal: "Французский луковый суп", categoryTagLabel: "Супы", areaTagLabel: "Французская"),
    FavouriteRecepies(image: UIImage(named: "Пельмени"), nameOfMeal: "Пельмени", categoryTagLabel: "Горячее", areaTagLabel: "Русская"),
    FavouriteRecepies(image: UIImage(named: "Тако"), nameOfMeal: "Тако", categoryTagLabel: "Горячее", areaTagLabel: "Мексиканская")
]
