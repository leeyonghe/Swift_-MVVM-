//
//  ViewModel.swift
//  LEE_MVVM
//
//  Created by leedev on 2020/10/20.
//

import Foundation
import SwiftyJSON

protocol ViewModelProtocol {
    var userName : String { get }
    func getFromServer(completion:@escaping (_ json : JSON) -> Swift.Void)
}

public class ViewModel : ViewModelProtocol, NetworkManagerDelegate{
    
    private var completion : [(_ json : JSON)->Swift.Void] = []
    
    public var userName : String{
        return "유저이름"
    }
    
    func getFromServer(completion: @escaping (_ json : JSON) -> Void) {
        self.completion.append(completion)
        let user = UserInputModel(ID: "", PW: "")
        NetworkManager.getInstance(self).getUserInfo(user)
    }
    
    func dataReceived(data: Any?, error: NSError?) {
        let json = try? JSON.init(data: data as! Data)
        completion[0](json!)
    }
    
}
