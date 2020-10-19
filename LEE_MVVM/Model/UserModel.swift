//
//  UserModel.swift
//  LEE_MVVM
//
//  Created by leedev on 2020/10/18.
//

import Foundation

struct UserInputModel : Encodable {
    let ID : String
    let PW : String
};

struct UserModel : Encodable {
    let UserNumber : String
    let UserName : String
    let UserPhone : String
    let UserAddress : String
};
