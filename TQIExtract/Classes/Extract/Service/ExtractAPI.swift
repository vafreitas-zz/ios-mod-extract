//
//  ExtractAPI.swift
//  DIOExtract
//
//  Created by Victor Freitas on 10/01/22.
//

import VFNetwork

public enum ExtractAPI {
    case transactions
}

extension ExtractAPI: APIBuilder {
    public var path: URLPath {
        switch self {
        case .transactions:
            return .plain("statement")
        }
    }
    
    public var httpMethod: HTTPMethods {
        .get
    }
    
    public var headers: HTTPHeader {
        .empty
    }
    
    public var task: HTTPTask {
        .request
    }
}
