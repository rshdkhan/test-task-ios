//
//  HttpClient.swift
//  test task
//
//  Created by Rashid Khan on 4/3/21.
//

import Foundation
import Alamofire

fileprivate enum BaseUrl: String {
    case dev = ""
    case staging = "your staging server url"
    case live = "your live server url"
}

fileprivate struct HttpStatusCodes {
    static let successfull = 200...299
    static let clientError = 400...499
    static let serverError = 500...599
}


protocol IHttpClient {
    func get<T: Codable>(endpoint: Endpoint, clazz: T.Type, params: Parameters, completion: @escaping (Response<T>)->Void)
    
    func request<T>(endpoint: Endpoint, clazz: T.Type, method: HTTPMethod, encoding: ParameterEncoding, params: Parameters, completion: @escaping(Response<T>)->Void)
}

extension IHttpClient {
    func request<T>(endpoint: Endpoint, clazz: T.Type, method: HTTPMethod, encoding: ParameterEncoding, params: Parameters, completion: @escaping(Response<T>)->Void) {
        let url = BaseUrl.dev.rawValue + endpoint.rawValue
        let headers = self.getHeaders(endpoint: endpoint)
        
        AF.request(url, method: method, parameters: params, encoding: encoding, headers: headers)
            .validate(statusCode: HttpStatusCodes.successfull)
            
            .responseJSON { serverResponse in
                
                switch serverResponse.result {
                case .success(let value):
                    if let rootJson = value as? T {
                        completion(Response(withData: rootJson))
                        return
                    }
                    
                    completion(Response())
                    break
                    
                case .failure(let error):
                    if let statusCode = serverResponse.response?.statusCode {
                        if HttpStatusCodes.clientError.contains(statusCode) {
                            
                        } else if HttpStatusCodes.serverError.contains(statusCode) {
                            
                        } else {
                            
                        }
                    }
                    
                    completion(Response(withError: error))
                    break
                }
            }
    }
    
    private func getHeaders(endpoint: Endpoint) -> HTTPHeaders? {
        switch endpoint {
        case .home:
            return nil
        }
    }
}

class HttpClient: IHttpClient {
    func get<T: Codable>(endpoint: Endpoint, clazz: T.Type, params: Parameters, completion: @escaping (Response<T>) -> Void) {
        
    }
}
