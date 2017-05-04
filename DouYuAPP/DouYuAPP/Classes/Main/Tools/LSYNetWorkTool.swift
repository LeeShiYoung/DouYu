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


class LSYNetWorkTool {
    
    public class func httpRequest<T: Mappable>(method HTTPMethod: HTTPMethod, url httpUrl: String, parmaters:[String : Any], resultClass: T.Type, completionHandler: @escaping (Result<T>) -> Void) {

        // MARK: - 请求参数
        LSYBaseNetWorkTool.httpRequest(url: httpUrl, parmaters: parmaters, method: HTTPMethod) { (result) in
            switch result {
            case .success(let s):
                
                let resultObj = resultClass.init(JSON: s as! [String : Any])
                completionHandler(Result(value: resultObj, error: nil))
            case .failure(let e):
                
                completionHandler(Result(value: nil, error: e))
            }
        }
    }
}

class LSYBaseNetWorkTool {
    
    typealias completionHandler = (Result<Any>) -> Void
    var completionHandler: completionHandler?
 
    fileprivate class func httpRequest(url httpUrl: String, parmaters: [String: Any], method: HTTPMethod, completionHandler: @escaping completionHandler) {
        
        switch method {
        case .get:
            Alamofire.request(httpUrl, method: .get, parameters: parmaters, headers: LSYHttpHeader.header).responseJSON { (response) in

                let result = Result(value: response.result.value, error: response.result.error)
                completionHandler(result)
            }
        case .post:
            Alamofire.request(httpUrl, method: .post, parameters: parmaters, headers: LSYHttpHeader.header).responseJSON { (response) in

                let result = Result(value: response.result.value, error: response.result.error)
                completionHandler(result)
            }
        case .put:
            Alamofire.request(httpUrl, method: .put, parameters: parmaters, headers: LSYHttpHeader.header).responseJSON { (response) in

                let result = Result(value: response.result.value, error: response.result.error)
                completionHandler(result)
            }
        }
    }
}



enum Result<T> {
    case success(T)
    case failure(Error)
}

extension Result {
    ///通过一个可选型的成功值与一个可选型的错误值
    ///初始化一个 Result 对象。
    /// 以便把苹果的异步 API 返回的值转换为一个 Result。
    init(value: T?, error: Error?) {
        switch (value, error) {
        case (let v?, _):
            // 如果值是非空的忽略错误
            self = .success(v)
        case (nil, let e?):
            self = .failure(e)
        case (nil, nil):
            let error = NSError(domain: "ResultErrorDomain", code: 1,
                                userInfo: [NSLocalizedDescriptionKey:
                                    "Invalid input: value and error were both nil."])
            self = .failure(error)
        }
    }
}



