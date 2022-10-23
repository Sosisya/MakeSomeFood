import Foundation
import UIKit

struct SelectedCategoryRecepies {
    var image: UIImage?
    var nameOfMeal: String
    var categoryTagLabel: String
    var areaTagLabel: String
}

var selectedCategoryRecepies = [
    SelectedCategoryRecepies(image: UIImage(named: "блины"), nameOfMeal: "Блины", categoryTagLabel: "Завтрак", areaTagLabel: "Русская"),
    SelectedCategoryRecepies(image: UIImage(named: "глазуньяСБеконом"), nameOfMeal: "Глазунья с беконом", categoryTagLabel: "Завтрак", areaTagLabel: "Американская"),
    SelectedCategoryRecepies(image: UIImage(named: "крокМадам"), nameOfMeal: "Крок Мадам", categoryTagLabel: "Завтрак", areaTagLabel: "Французская"),
    SelectedCategoryRecepies(image: UIImage(named: "крокМесье"), nameOfMeal: "Крок Месье", categoryTagLabel: "Завтрак", areaTagLabel: "Французская"),
    SelectedCategoryRecepies(image: UIImage(named: "овсянаяКаша"), nameOfMeal: "Овсяная каша", categoryTagLabel: "Завтрак", areaTagLabel: "Английская"),
    SelectedCategoryRecepies(image: UIImage(named: "пуддингСЧиа"), nameOfMeal: "Пудинг с семенами Чиа", categoryTagLabel: "Завтрак", areaTagLabel: "Латинская америка")
]
