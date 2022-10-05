import Foundation

struct NameAndTagsSection {
    var nameOfRecepie: String
    var categoryTagLabel: String
    var areaTagLabel: String

}

struct IngredientsSection {
    var nameOfIngredient: String
    var amountOfIngredient: String

}

var nameAndTags = NameAndTagsSection(nameOfRecepie: "Какое-то длинное название рецепта", categoryTagLabel: "Категория", areaTagLabel: "Откуда рецепт")

var ingredients = [
    IngredientsSection(nameOfIngredient: "Курица", amountOfIngredient: "200 грамм"),
    IngredientsSection(nameOfIngredient: "Яйцо", amountOfIngredient: "1 шт"),
    IngredientsSection(nameOfIngredient: "Мука", amountOfIngredient: "100 грамм"),
    IngredientsSection(nameOfIngredient: "Вода", amountOfIngredient: "300 мл"),
    IngredientsSection(nameOfIngredient: "Сахар", amountOfIngredient: "200 грамм")
    ]

var description = "Смешайте все сухие ингредиенты: муку просейте с неполной ч.л. разрыхлителя, добавьте мелкой соли, сахара, хорошо перемешайте./Блины с таким количеством сахара получатся умеренно сладкими, с интенсивным золотистым цветом. С меньшим количеством будут бледнее, с большим - быстро румянятся и даже могут пригорать/.Если кладёте соду, её также нужно смешать с мукой и предварительно не гасить - это сделает кефир прямо в тесте.Смешайте все сухие ингредиенты: муку просейте с неполной ч.л. разрыхлителя, добавьте мелкой соли, сахара, хорошо перемешайте./Блины с таким количеством сахара получатся умеренно сладкими, с интенсивным золотистым цветом. С меньшим количеством будут бледнее, с большим - быстро румянятся и даже могут пригорать/.Если кладёте соду, её также нужно смешать с мукой и предварительно не гасить - это сделает кефир прямо в тесте."
