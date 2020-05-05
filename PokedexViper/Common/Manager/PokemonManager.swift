//
//  PokemonManager.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 05/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Alamofire

class PokemonManager: NSObject {
    
    @discardableResult
    private func performRequest(route: PokemonRouter, completion: @escaping (AFDataResponse<Any>) -> Void) -> DataRequest {
        return AF.request(route).validate().responseJSON {response in
            completion(response)
        }
    }
    
    func fetchHome(completionHandler: @escaping  (Result<HomeModel, AFError>)-> Void) {
        performRequest(route: .getPokemos) { response in
            switch response.result {
                
            case .success:
                
                guard let data = response.data, let homeModel: HomeModel = self.decodeParse(jsonData: data) else {
                    return
                }
                completionHandler(.success(homeModel))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
        
    }
    func paginate(offset: String, limit: String, completionHandler: @escaping  (Result<HomeModel, AFError>)-> Void) {
        performRequest(route: .paginate(parameters: ["offset": offset, "limit": limit]) ) { response in
            switch response.result {
                
            case .success:
                
                guard let data = response.data, let homeModel: HomeModel = self.decodeParse(jsonData: data) else {
                    return
                }
                completionHandler(.success(homeModel))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func kalosPokemon(completionHandler: @escaping  (Result<Kalos, AFError>)-> Void){
        performRequest(route: .kalos) { response in
            switch response.result {
            case .success:
              guard let data = response.data, let kalosModel: Kalos = self.decodeParse(jsonData: data) else {
                    return
                }
                
              completionHandler(.success(kalosModel))
            case .failure(let error):
                debugPrint(error)
                completionHandler(.failure(error))
            }
        }
    }
    
    fileprivate func decodeParse<T: Codable>(jsonData: Data) -> T? {
        do {
            let decoder = JSONDecoder()
            let items = try decoder.decode(T.self, from: jsonData)
            return items
        } catch {
            return nil
        }
    }
}
