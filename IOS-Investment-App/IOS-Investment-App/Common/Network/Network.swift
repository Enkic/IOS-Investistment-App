//
//  Router.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 28/11/2020.
//  Copyright © 2020 enki corbin. All rights reserved.
//

import Foundation
import Alamofire

//enum Network: URLRequestConvertible {
    
//    static let baseURLString = "http://172.20.10.11:7070"
//
//    case login(username: String, password: String)
//    case register(email: String, username: String, password: String)
//    case imdbSearchFilm(filmName: String)
//    case imdbSearchMoreInfo(imdbId: String)
//    case gamesSearch(gameName: String)
//    case gameMoreInfo(gameId: String)
//    case weatherInfo(cityName: String)
//
//    var method: HTTPMethod {
//        switch self {
//        case .login:
//            return .post
//        case .register:
//            return .post
//        case .imdbSearchFilm:
//            return .get
//        case .imdbSearchMoreInfo:
//            return .get
//        case .gamesSearch:
//            return .get
//        case .gameMoreInfo:
//            return .get
//        case .weatherInfo:
//            return .get
//        }
//    }
//
//    var path: String {
//        switch self {
//        case .login:
//            return "users/login"
//        case .register:
//            return "users/register"
//        case .imdbSearchFilm:
//            return "service/imdb/search"
//        case .imdbSearchMoreInfo:
//            return "service/imdb/info"
//        case .gamesSearch:
//            return "service/giantbomb/search"
//        case .gameMoreInfo:
//            return "service/giantbomb/info"
//        case .weatherInfo:
//            return "service/weather/info"
//        }
//    }
//
//    var params: Parameters? {
//        switch self {
//        case .login(let username, let password):
//            return ["username": username, "password": password]
//        case .register(let email, let username, let password):
//            return ["email": email, "username": username, "password": password]
//        case .imdbSearchFilm(let filmName):
//            return ["search": filmName]
//        case .imdbSearchMoreInfo(let imdbId):
//            return ["film_id": imdbId]
//        case .gamesSearch(let gameName):
//            return ["search": gameName]
//        case .gameMoreInfo(let gameId):
//            return ["id": gameId]
//        case .weatherInfo(let cityName):
//            return ["city": cityName]
//        }
//    }
//
//    func asURLRequest() throws -> URLRequest {
//        let url = try Router.baseURLString.asURL()
//        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
//
//        urlRequest.httpMethod = method.rawValue
//
//        switch self {
//        case .login:
//            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
//        case .register:
//            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
//        case .imdbSearchFilm:
//            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
//        case .imdbSearchMoreInfo:
//            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
//        case .gamesSearch:
//            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
//        case .gameMoreInfo:
//            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
//        case .weatherInfo:
//            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
//        }
//
//        return urlRequest
//    }
//}
