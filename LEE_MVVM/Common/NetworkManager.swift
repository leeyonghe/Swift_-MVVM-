//
//  NetworkManager.swift
//  LEE_MVVM
//
//  Created by leedev on 2020/10/18.
//

import Foundation
import Alamofire

protocol NetworkManagerDelegate {
    func dataReceived(data: Any?, error: NSError?)
}

class NetworkManager {
    
    private let baseURL : URL = URL.init(string: "")!
    
    static private let shared = NetworkManager()
    
    private var delegate: NetworkManagerDelegate?
    
    static public func getInstance(_ delegate : NetworkManagerDelegate) -> NetworkManager{
        self.shared.delegate = delegate
        return shared
    }
    
    private init() {
        
    }
    
    public func getUserInfo<T: Encodable>(_ param : T) {
        AF.request("https://httpbin.org/post",
                   method: .post,
                   parameters: param,
                   encoder: JSONParameterEncoder.default).response { response in
                    switch response.result {
                    case .success:
                        guard let json = response.data else {
                            return
                        }
                        self.delegate?.dataReceived(data: json, error: nil)
                    case .failure(let error):
                        self.delegate?.dataReceived(data: nil, error: error as NSError)
                    }
                   }
    }
    
}
