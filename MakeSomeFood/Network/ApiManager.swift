import Foundation

struct ApiManager {

    static func getCategories(completion: @escaping (Result<CategoriesList, Error>) -> Void) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/categories.php"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in

            guard let data = data else { return }
            guard error == nil else { return }

            do {
                let categories = try JSONDecoder().decode(CategoriesList.self, from: data)
                completion(.success(categories))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }

    static func getCategoriesTags(completion: @escaping (Result<CategoriesTagList, Error>) -> Void) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/list.php?c=list"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in

            guard let data = data else { return }
            guard error == nil else { return }

            do {
                let categories = try JSONDecoder().decode(CategoriesTagList.self, from: data)
                completion(.success(categories))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }

    static func getAreasTags(completion: @escaping (Result<AreasTagList, Error>) -> Void) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/list.php?a=list"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in

            guard let data = data else { return }
            guard error == nil else { return }

            do {
                let categories = try JSONDecoder().decode(AreasTagList.self, from: data)
                completion(.success(categories))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }

    static func getIngredientsTags(completion: @escaping (Result<IngredientsTagList, Error>) -> Void) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/list.php?i=list"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in

            guard let data = data else { return }
            guard error == nil else { return }

            do {
                let categories = try JSONDecoder().decode(IngredientsTagList.self, from: data)
                completion(.success(categories))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
}
