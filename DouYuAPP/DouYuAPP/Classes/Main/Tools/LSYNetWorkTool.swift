//
//  LSYNetWorkTool.swift
//  SwiftProjectBaseFrame
//
//  Created by apple on 2017/2/13.
//  Copyright © 2017年 apple. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

public enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
}

public class LSYHttpHeader {
    
    static var header: [String : String]? = nil
    
    // MARK: - 设置http请求头
    public class func setHeader(httpHeader: () -> [String : String]) {
        header = httpHeader()
    }
}


public class LSYNetWorkTool {
    
    public class func httpRequest<T: Mappable>(method HTTPMethod: HTTPMethod, url httpUrl: String, parmaters:[String : Any], resultClass: T.Type, completionHandler: @escaping (_ result: T?, _ error: (error:Error?, code: Int)) -> Void) {

        // MARK: - 请求参数
        LSYBaseNetWorkTool.httpRequest(url: httpUrl, parmaters: parmaters, method: HTTPMethod) { (success, error) in
            if let success = success {
                print(success)
                let response = resultClass.init(JSON: success as! [String : Any])
                completionHandler(response, error)
            } else {
                completionHandler(nil, error)
            }
        }
    }
}

fileprivate class LSYBaseNetWorkTool {
    
    typealias completionHandler = (_ result: Any?, _ error: (error:Error?, code: Int)) -> Void
    var completionHandler: completionHandler?
 
    fileprivate class func httpRequest(url httpUrl: String, parmaters: [String: Any], method: HTTPMethod, completionHandler: @escaping completionHandler) {
        
        switch method {
        case .get:
            Alamofire.request(httpUrl, method: .get, parameters: parmaters, headers: LSYHttpHeader.header).responseJSON { (response) in
                var statusCode = response.response?.statusCode
                if statusCode == nil {
                    statusCode = 0
                }
                if let JSON = response.result.value {
                    completionHandler(JSON, (nil, statusCode!))
                }
                
                if let error = response.result.error {
                    completionHandler(nil, (error, statusCode!))
                }
            }
        case .post:
            Alamofire.request(httpUrl, method: .post, parameters: parmaters, headers: LSYHttpHeader.header).responseJSON { (response) in
                var statusCode = response.response?.statusCode
                if statusCode == nil {
                    statusCode = 0
                }
                if let JSON = response.result.value {
                    completionHandler(JSON, (nil, statusCode!))
                }
                
                if let error = response.result.error {
                    completionHandler(nil, (error, statusCode!))
                }
            }
        case .put:
            Alamofire.request(httpUrl, method: .put, parameters: parmaters, headers: LSYHttpHeader.header).responseJSON { (response) in
                var statusCode = response.response?.statusCode
                if statusCode == nil {
                    statusCode = 0
                }
                if let JSON = response.result.value {
                    completionHandler(JSON, (nil, statusCode!))
                }
                
                if let error = response.result.error {
                    completionHandler(nil, (error, statusCode!))
                }
            }
        }
    }
}
