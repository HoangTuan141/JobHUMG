//
//  APIMeetUpRequest.swift
//  Mock
//
//  Created by TuanHA-D1 on 12/26/19.
//  Copyright © 2019 TuanHA-D1. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct APIRequest {
    var name: String
    var path: String
    var method: Alamofire.HTTPMethod
    var header: HTTPHeaders?
    var parameters: [String:Any]?
    var fullUrl: String {
        return "http://45.63.104.21:8080/" + path
    }

    static var bearerHeader: [String: String] {
        return ["Authorization" :  "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC80NS42My4xMDQuMjE6ODA4MFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU5MjkyODYxMiwiZXhwIjoxNTkyOTMyMjEyLCJuYmYiOjE1OTI5Mjg2MTIsImp0aSI6ImZzZzE5b1VHSktXWnFkVFkiLCJzdWIiOjQsInBydiI6ImMyMjkxMzFhYjI4NGRkNDAyMjA1MGQ3OTU0YzFjMzE1YzcyYzQ2YjMifQ.omrWe_XJgp1R49NKhp4iH6zTdil7tEi-cIiXp39hnYM"]
    }

    init(name: String,
         path: String,
         method: Alamofire.HTTPMethod,
         header: HTTPHeaders = [:],
         parameters: [String: Any]?) {
        self.name = name
        self.path = path
        self.method = method
        self.header = header
        self.parameters = parameters
    }

    func printInfomationRequest() {
        print("\nRequest API => \(name)")
        print("URL: => \(fullUrl)")
        print("Method: => \(method.rawValue)")
        print("Header: => \( header!)")
        print("Parameters: => \(parameters ?? ["":""])\n")
    }
}

protocol Response {
    init(json: JSON)
}
