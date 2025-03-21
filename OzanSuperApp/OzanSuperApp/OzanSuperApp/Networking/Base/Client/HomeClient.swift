//
//  HomeClient.swift
//  OzanSuperApp
//
//  Created by Tolga Taner on 25.02.2022.
//

import Foundation

protocol HomeClientDelegate: AnyObject {
    func homeClient(didSucceedFetching response: HomeResponse)
    func homeClient(didFailureFething error:Error)
}

final class HomeClient {
    
    var api: APIClient = {
        let configuration = URLSessionConfiguration.default
        return APIClient(configuration: configuration)
    }()
    weak var delegate: HomeClientDelegate?
    
    func get(path: String,
             queryItems: [URLQueryItem]?) {
        api.send(Request.get(path: path,
                             queryItems: queryItems ?? nil, completion: { [weak self] (responseData) in
            guard let self = self else { return }
            switch responseData {
            case .success:
                responseData.decoding(BaseResponse<HomeResponse>.self) { (result) in
                    switch result {
                    case .success(let response):
                        self.delegate?.homeClient(didSucceedFetching: response.data)
                    case .failure(let error):
                        self.delegate?.homeClient(didFailureFething: error)
                    }
                }
            case .failure(let error):
                self.delegate?.homeClient(didFailureFething: error)
            }
        }))
    }
}
