//
//  APIClient.swift
//  OzanSuperApp
//
//  Created by Tolga Taner on 18.03.2025.
//

import Foundation

 enum HTTPMethod: String {
    case get
}

 struct APIClient {

    private let session: URLSession
    private let queue: DispatchQueue = DispatchQueue(label: "com.Ozan",
                                                     qos: .userInitiated)

     init(configuration: URLSessionConfiguration = URLSessionConfiguration.default) {
        session = URLSession(configuration: configuration)
    }

     func send(_ request: Request) {
        guard let urlRequest = request.builder.toURLRequest()
         else {
            assertionFailure("wrong base url")
            return
        }
        debugPrint("URL:", request.builder.toURLRequest()?.url?.absoluteString)
        queue.async {
            let task = session.dataTask(with: urlRequest) { (data, response, error) in
                let result: Result<Data, APIError>
                if let error = error {
                    result = .failure(.networkError(error))
                }
                else if let apiError = APIError.error(from: response) {
                    result = .failure(apiError)
                }
                else {
                    result = .success(data ?? Data())
                }
                DispatchQueue.main.async {
                    request.completion(result)
                }
            }
            task.resume()
        }
    }

}
