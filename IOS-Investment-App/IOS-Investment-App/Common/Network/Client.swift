//
//  Client.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 28/11/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import Alamofire

class Client {
//        
//    @discardableResult
//    private static func performJSONRequest(route:Router, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<Any>)->Void) -> DataRequest {
//        
//        return AF.request(route)
//                        .validate(statusCode: 200..<300)
//                        .validate(contentType: ["application/json"])
//                        .responseJSON { response in
//                            completion(response.result)
//        }
//    }
//    
//    @discardableResult
//    private static func performRequestDecode<T:Decodable>(route:Router, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T>)->Void) -> DataRequest {
//        
//        return AF.request(route)
//                        .validate(statusCode: 200..<300)
//                        .validate(contentType: ["application/json"])
//                        .responseDecodable (decoder: decoder) { (response: DataResponse<T>) in
//                            completion(response.result)
//        }
//    }
//    
//    static func login(username: String, password: String, completion:@escaping (Result<Any>)->Void) {
//        let jsonDecoder = JSONDecoder()
//        
//        performJSONRequest(route: Router.login(username: username, password: password), decoder: jsonDecoder, completion: completion)
//    }
//    
//    static func register(email: String, username: String, password: String, completion:@escaping (Result<Any>)->Void) {
//        let jsonDecoder = JSONDecoder()
//        
//        performJSONRequest(route: Network.register(email: email, username: username, password: password), decoder: jsonDecoder, completion: completion)
//    }
//    
//    static func getFilm(filmName: String, completion:@escaping (Result<ImdbBasicModel>)->Void) {
//        let jsonDecoder = JSONDecoder()
//        
//        performRequestDecode(route: Network.imdbSearchFilm(filmName: filmName), decoder: jsonDecoder, completion: completion)
//    }
//    
//    static func getFilmInfos(imdbId: String, completion:@escaping (Result<ImdbModel>)->Void) {
//        let jsonDecoder = JSONDecoder()
//        
//        performRequestDecode(route: Network.imdbSearchMoreInfo(imdbId: imdbId), decoder: jsonDecoder, completion: completion)
//    }
//    
//    static func getGames(gameName: String, completion:@escaping (Result<GamesBasicModel>)->Void) {
//        let jsonDecoder = JSONDecoder()
//        
//        performRequestDecode(route: Network.gamesSearch(gameName: gameName), decoder: jsonDecoder, completion: completion)
//    }
//    
//    static func getGameInfos(gameId: String, completion:@escaping (Result<GameModel>)->Void) {
//        let jsonDecoder = JSONDecoder()
//        
//        performRequestDecode(route: Network.gameMoreInfo(gameId: gameId), decoder: jsonDecoder, completion: completion)
//    }
//    
//    static func getWeather(city: String, completion:@escaping (Result<WeatherModel>)->Void) {
//        let jsonDecoder = JSONDecoder()
//        
//        performRequestDecode(route: Network.weatherInfo(cityName: city), decoder: jsonDecoder, completion: completion)
//    }
}
