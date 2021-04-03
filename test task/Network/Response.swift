//
//  Response.swift
//  test task
//
//  Created by Rashid Khan on 4/3/21.
//

import Foundation

enum Status {
    case success
    case failure
    case error
}

struct Response<T> {
    var status: Status
    var failureMessage: String?
    var errors: [Error] = []
    var data: T?
    
    
    init() {
        self.status = .success
    }
    
    init(withfailureMessage message: String) {
        self.status = .failure
        self.failureMessage = message
    }
    
    init(withError error: Error) {
        self.status = .error
        self.errors = [error]
    }
    
    init(withData data: T) {
        self.status = .success
        self.data = data
    }
}
