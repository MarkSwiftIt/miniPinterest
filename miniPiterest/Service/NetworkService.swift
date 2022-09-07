//
//  NetworkService.swift
//  miniPiterest
//
//  Created by Mark Goncharov on 18.07.2022.
//

import Foundation

class NetworkService {
    
    func request(searchTerm: String, completion: (Data?, Error?) -> Void) {
        
        let parameters = self.prepareParams(searchTerm: searchTerm)
        let url = self.url(params: parameters)
        print(url)
    }
    
    private func prepareParams(searchTerm: String?) -> [String: String] {
        
        var parameters = [String: String]()
        parameters["query"] = searchTerm
        parameters["page"] = String(1)
        parameters["per_page"] = String(30)
        return parameters
    }
    
    private func url(params: [String: String]) -> URL {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1)}
        return components.url!
    }
    
}
