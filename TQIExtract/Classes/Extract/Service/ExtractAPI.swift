//
//  ExtractAPI.swift
//  DIOExtract
//
//  Created by Victor Freitas on 10/01/22.
//

import VFNetwork

enum ExtractAPI {
    case transactions
}

extension ExtractAPI: APIBuilder {
    var path: URLPath {
        switch self {
        case .transactions:
            return .plain("statement")
        }
    }
    
    var httpMethod: HTTPMethods {
        .get
    }
    
    var headers: HTTPHeader {
        .empty
    }
    
    var task: HTTPTask {
        .request
    }
}
