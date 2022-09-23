import Foundation

struct  NameOfRecepieSection {
    var nameOfMealLabel: String?
    var categoryTagLabel: String?
    var areaTagLabel: String?
}

struct IngredientSection {
    var ingredientNameLabel: String?
    var amountLabel: String?
}

var nameOfRecepie = NameOfRecepieSection(nameOfMealLabel: "Какое-то блюдо", categoryTagLabel: "Категория", areaTagLabel: "Кухня")

var ingredients = IngredientSection(ingredientNameLabel: "Сахар", amountLabel: "1 ложка")

var descriptionOfRecepie = "Э"
