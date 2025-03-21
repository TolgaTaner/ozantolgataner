//
//  Request.swift
//  OzanSuperApp
//
//  Created by Tolga Taner on 18.03.2025.
//

import Foundation

 struct Request {
    let builder: RequestBuilder
     let completion: (Result<Data, APIError>) -> Void

    init(builder: RequestBuilder,
         completion: @escaping (Result<Data, APIError>) -> Void) {
        self.builder = builder
        self.completion = completion
    }

     static func get(method: HTTPMethod = .get,
                           path: String,
                           queryItems: [URLQueryItem]?,
                    completion: @escaping (Result<Data, APIError>) -> Void) -> Request {
        let builder = GetRequestBuilder(method: method,
                                        endpoint: Endpoint(path: path,
                                                           queryItems: queryItems ?? nil))
        return Request(builder: builder, completion: completion)
    }

}

extension Result where Success == Data, Failure == APIError {
    func decoding<M: Model>(_ model: M.Type,
                            completion: @escaping (Result<M, APIError>) -> Void) {
        DispatchQueue.global().async {
            let result = flatMap { data -> Result<M, APIError> in
                do {
                    let decoder = M.decoder
                    let model = try decoder.decode(M.self, from: data)
                    return .success(model)
                } catch let e as DecodingError {
                    return .failure(.decodingError(e))
                } catch {
                    return .failure(APIError.unhandledResponse)
                }
            }
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
