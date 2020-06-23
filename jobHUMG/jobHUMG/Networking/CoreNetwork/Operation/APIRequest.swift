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
        return ["Authorization" :  "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC80NS42My4xMDQuMjE6ODA4MFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU5Mjg0MTg5MiwiZXhwIjoxNTkyODQ1NDkyLCJuYmYiOjE1OTI4NDE4OTIsImp0aSI6Ims5MXBHcTI0SU4wT08xNmQiLCJzdWIiOjQsInBydiI6ImMyMjkxMzFhYjI4NGRkNDAyMjA1MGQ3OTU0YzFjMzE1YzcyYzQ2YjMifQ.OdJV68m37CRUTOOu5lMkDWGpn88E-b8xNVuL6Fxli-o"]
        
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
