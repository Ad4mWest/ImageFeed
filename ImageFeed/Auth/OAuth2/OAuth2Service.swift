//  OAuth2Service.swift
//  ImageFeed
//  Created by Adam West on 29.06.23.

import Foundation

final class OAuth2Service {
    private enum NetworkError: Error {
        case urlComponentsError
        case creationURLFromComponents
        case httpStatusCode(Int)
        case urlRequestError(Error)
        case urlSessionError(Error)
        case accessTokenError
    }
    private struct OAuthTokenResponseBody: Decodable {
        let accessToken: String
        let tokenType: String
        let scope: String
        let createdAt: Int
    }
    
    func fetchOAuthTokenFrom(code: String, completion: @escaping (Result<String, Error>) -> Void) {
        
        guard var urlComponents = URLComponents(string: AuthConstants.accessTokenURL) else {
            completion(.failure(NetworkError.urlComponentsError))
            return
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: AuthConstants.accessKey),
            URLQueryItem(name: "client_secret", value: AuthConstants.secretKey),
            URLQueryItem(name: "redirect_uri", value: AuthConstants.redirectURI),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "grant_type", value: "authorization_code")
        ]
        guard let url = urlComponents.url else {
            completion(.failure(NetworkError.creationURLFromComponents))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let responseBody = try decoder.decode(OAuthTokenResponseBody.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(responseBody.accessToken))
                    }
                } catch {
                        completion(.failure(NetworkError.accessTokenError))
                }
            }
            if let response = response as? HTTPURLResponse {
                if response.statusCode < 200 || response.statusCode >= 300 {
                    DispatchQueue.main.async {
                        completion(.failure(NetworkError.httpStatusCode(response.statusCode)))
                    }
                    return
                }
            }
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(NetworkError.urlSessionError(error)))
                }
                return
            }
        }
        task.resume()
    }
}
