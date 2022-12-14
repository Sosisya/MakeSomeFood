import Foundation

struct ApiManager {

    enum ApiError: Error {
        case unknownError
    }

    static func getCategories(completion: @escaping (Result<CategoriesList, Error>) -> Void) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/categories.php"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(error ?? ApiError.unknownError))
                return
            }
            do {
                let categories = try JSONDecoder().decode(CategoriesList.self, from: data)
                completion(.success(categories))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }

    static func getTagsOfCategories(completion: @escaping (Result<CategoriesTagList, Error>) -> Void) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/list.php?c=list"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(error ?? ApiError.unknownError))
                return
            }
            do {
                let meals = try JSONDecoder().decode(CategoriesTagList.self, from: data)
                completion(.success(meals))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }

    static func getTagsOfArea(completion: @escaping (Result<AreasTagList, Error>) -> Void) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/list.php?a=list"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(error ?? ApiError.unknownError))
                return
            }
            do {
                let meals = try JSONDecoder().decode(AreasTagList.self, from: data)
                completion(.success(meals))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }

    static func getTagsOfIngredients(completion: @escaping (Result<IngredientsTagList, Error>) -> Void) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/list.php?i=list"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(error ?? ApiError.unknownError))
                return
            }
            do {
                let meals = try JSONDecoder().decode(IngredientsTagList.self, from: data)
                completion(.success(meals))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }

    static func getRecipe(completion: @escaping (Result<Re??ipeList, Error>) -> Void) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/random.php"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(error ?? ApiError.unknownError))
                return
            }
            do {
                let categories = try JSONDecoder().decode(Re??ipeList.self, from: data)
                completion(.success(categories))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }

    static func getRecipes(filterId: String, value: String, completion: @escaping (Result<RecipesOfCategoryList, Error>) -> Void) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/filter.php?\(filterId)=\(value)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in

            guard let data else {
                completion(.failure(error ?? ApiError.unknownError))
                return
            }
            do {
                let meals = try JSONDecoder().decode(RecipesOfCategoryList.self, from: data)
                completion(.success(meals))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }

    static func getAllRecipes(completion: @escaping (Result<Re??ipeList, Error>) -> Void) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/search.php?s="
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(error ?? ApiError.unknownError))
                return
            }
            do {
                let categories = try JSONDecoder().decode(Re??ipeList.self, from: data)
                completion(.success(categories))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }

    static func getRecipeById(id: String, completion: @escaping (Result<Re??ipeList, Error>) -> Void) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(error ?? ApiError.unknownError))
                return
            }
            do {
                let categories = try JSONDecoder().decode(Re??ipeList.self, from: data)
                completion(.success(categories))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
}
