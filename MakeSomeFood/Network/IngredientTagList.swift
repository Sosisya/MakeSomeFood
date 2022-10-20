import Foundation


struct IngredientsTagList: Codable {
    let meals: [IngredientTag]
}

struct IngredientTag: Codable {
    let id: String
    let ingredient: String
    let description: String


    enum CodingKeys: String, CodingKey {
        case id = "idIngredient"
        case ingredient = "strCategory"
        case description = "strDescription"
    }
}
