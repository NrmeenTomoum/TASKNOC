
import AlamofireObjectMapper
import Alamofire
import ObjectMapper
class GenericRequest
{// if array
    class  func requestPutMappable<T:Mappable>(URL : String,isWithToken :Bool,completionHandler: @escaping([T]?,errorMessage?,errorMessage? )-> Void)
    {
        self.genericRequestMappable(httpMethod: .put, urlParameters: [:], URL: URL, isWithToken: isWithToken)  { (result, storeError,servererror) in
            completionHandler(result,storeError,servererror)
        }
    }
    class   func requestPutMappable<T:Mappable>(urlParameters : [String : AnyObject],URL : String,isWithToken :Bool,completionHandler: @escaping([T]?,errorMessage?,errorMessage? )-> Void)
    {
        self.genericRequestMappable(httpMethod: .put, urlParameters: urlParameters, URL: URL, isWithToken: isWithToken)  { (result, storeError,servererror) in
            completionHandler(result,storeError,servererror)
        }
    }
    
    class   func requestGetMappable<T:Mappable>(URL : String,completionHandler: @escaping([T]?,errorMessage?,errorMessage? )-> Void)
    {
        self.genericRequestMappable(httpMethod: .get, urlParameters: nil, URL: URL, isWithToken: false)  { (result, storeError,servererror) in
            completionHandler(result,storeError,servererror)
        }
    }
    class   func requestPostMappable<T:Mappable>(urlParameters : [String : AnyObject],URL : String,isWithToken :Bool,completionHandler: @escaping([T]?,errorMessage?,errorMessage? )-> Void)
    {
        self.genericRequestMappable(httpMethod: .post, urlParameters: urlParameters, URL: URL, isWithToken: isWithToken)  { (result, storeError,servererror) in
            
            completionHandler(result,storeError,servererror)
        }
    }
    
    class    func genericRequestMappable<T: Mappable>(httpMethod : HTTPMethod ,urlParameters : [String : AnyObject]?,URL : String,isWithToken :Bool,completionHandler: @escaping([T]?,errorMessage?,errorMessage? )-> Void)
    {
        self.mainRequest(httpMethod: httpMethod, urlParameters: urlParameters, URL: URL, isWithToken: isWithToken){ (result:ResponseMappableArray<T>?, error:errorMessage?) in
            if let response = result
            {
//                if response.status != "success"
//                {
//                    completionHandler(nil,errorMessage(message: response.message!),nil)
//                }
//                else
//                {
                    completionHandler(response.Result,nil,nil)
               // }
            }
            else {
                completionHandler(nil,nil,error)
            }
            
        }
    }
    
    class    func mainRequest<T>(httpMethod : HTTPMethod ,urlParameters : [String : AnyObject]?,URL : String,isWithToken :Bool,completionHandler: @escaping (ResponseMappableArray<T>?,errorMessage?) -> Void)
    {
        Alamofire.request(URL, method: httpMethod , parameters: urlParameters, encoding: JSONEncoding.default, headers: RequestComponent.headerComponent(requireAuthOrNot: isWithToken)).responseObject{(response: DataResponse<ResponseMappableArray<T>>)  in
            let respons = response.result.value
       //     print("respons",respons?.payload as Any)
            switch response.result {
            case .success:
                completionHandler(respons!, nil)
            case .failure:
                completionHandler(nil,errorMessage(message:"Server Down"))
            }
        }
    }
    
    
    //if object
    class  func requestPutMappable<T:Mappable>(URL : String,isWithToken :Bool,completionHandler: @escaping(T?,errorMessage?,errorMessage? )-> Void)
    {
        self.genericRequestMappable(httpMethod: .put, urlParameters: [:], URL: URL, isWithToken: isWithToken)  { (result, storeError,servererror) in
            completionHandler(result,storeError,servererror)
        }
    }
    class   func requestPutMappable<T:Mappable>(urlParameters : [String : AnyObject],URL : String,isWithToken :Bool,completionHandler: @escaping(T?,errorMessage?,errorMessage? )-> Void)
    {
        self.genericRequestMappable(httpMethod: .put, urlParameters: urlParameters, URL: URL, isWithToken: isWithToken)  { (result, storeError,servererror) in
            completionHandler(result,storeError,servererror)
        }
    }
    
    class   func requestGetMappable<T:Mappable>(URL : String,completionHandler: @escaping(T?,errorMessage?,errorMessage? )-> Void)
    {
        self.genericRequestMappable(httpMethod: .get, urlParameters: nil, URL: URL, isWithToken: false)  { (result, storeError,servererror) in
            completionHandler(result,storeError,servererror)
        }
    }
    class   func requestPostMappable<T:Mappable>(urlParameters : [String : AnyObject],URL : String,isWithToken :Bool,completionHandler: @escaping(T?,errorMessage?,errorMessage? )-> Void)
    {
        self.genericRequestMappable(httpMethod: .post, urlParameters: urlParameters, URL: URL, isWithToken: isWithToken)  { (result, storeError,servererror) in
            
            completionHandler(result,storeError,servererror)
        }
    }
    
    class    func genericRequestMappable<T: Mappable>(httpMethod : HTTPMethod ,urlParameters : [String : AnyObject]?,URL : String,isWithToken :Bool,completionHandler: @escaping(T?,errorMessage?,errorMessage? )-> Void)
    {
        self.mainRequest(httpMethod: httpMethod, urlParameters: urlParameters, URL: URL, isWithToken: isWithToken){ (result:ResponseMappable<T>?, error:errorMessage?) in
            print(result)
            if let response = result
            {
//                if response.status != "success"
//                {
//                    completionHandler(nil,errorMessage(message: response.message!),nil)
//                }
//                else
//                {
                    completionHandler(response.Result,nil,nil)
               //}
            }
            else {
                completionHandler(nil,nil,error)
            }
            
        }
    }
    class    func mainRequest<T>(httpMethod : HTTPMethod ,urlParameters : [String : AnyObject]?,URL : String,isWithToken :Bool,completionHandler: @escaping (ResponseMappable<T>?,errorMessage?) -> Void)
    {
        Alamofire.request(URL, method: httpMethod , parameters: urlParameters, encoding: JSONEncoding.default, headers: RequestComponent.headerComponent(requireAuthOrNot: isWithToken)).responseObject{(response: DataResponse<ResponseMappable<T>>)  in
            let respons = response.result.value
            //print("respons",respons?.payload as Any)
            switch response.result {
            case .success:
                completionHandler(respons!, nil)
            case .failure:
                completionHandler(nil,errorMessage(message:"Server Down"))
            }
        }
    }
    
    //    //////////////////////////////////////
    
    class  func requestPut<T>(URL : String,completionHandler: @escaping(T?,errorMessage?,errorMessage? )-> Void)
    {
        self.genericRequest(httpMethod: .put, urlParameters: [:], URL: URL)  { (result, storeError,servererror) in
            completionHandler(result,storeError,servererror)
        }
    }
    class   func requestPut<T>(urlParameters : [String : AnyObject],URL : String,completionHandler: @escaping(T?,errorMessage?,errorMessage? )-> Void)
    {
        self.genericRequest(httpMethod: .put, urlParameters: urlParameters, URL: URL)  { (result, storeError,servererror) in
            completionHandler(result,storeError,servererror)
        }
    }
    
    class   func requestGet<T>(URL : String,completionHandler: @escaping(T?,errorMessage?,errorMessage? )-> Void)
    {
        self.genericRequest(httpMethod: .get, urlParameters: nil, URL: URL)  { (result, storeError,servererror) in
            completionHandler(result,storeError,servererror)
        }
    }
    class   func requestPost<T>(urlParameters : [String : AnyObject],URL : String,completionHandler: @escaping(T?,errorMessage?,errorMessage? )-> Void)
    {
        self.genericRequest(httpMethod: .post, urlParameters: urlParameters, URL: URL)  { (result, storeError,servererror) in
            completionHandler(result,storeError,servererror)
        }
    }
    
    class    func genericRequest<T>(httpMethod : HTTPMethod ,urlParameters : [String : AnyObject]?,URL : String,completionHandler: @escaping(T?,errorMessage?,errorMessage? )-> Void)
    {
        self.mainRequest(httpMethod: httpMethod, urlParameters: urlParameters, URL: URL){ (result:Response<T>?, error:errorMessage?) in
            if let response = result
            {
//                if response.status != "success"
//                {
//                    completionHandler(nil,errorMessage(message: response.message!),nil)
//                }
//                else
//                {
                completionHandler(response.Result,errorMessage(message: response.Message!),nil)
              //  }
            }
            else {
                completionHandler(nil,nil,error)
            }
            
        }
    }
    class    func mainRequest<T>(httpMethod : HTTPMethod ,urlParameters : [String : AnyObject]?,URL : String,completionHandler: @escaping (Response<T>?,errorMessage?) -> Void)
    {
        var authOrNot : Bool = false
           Alamofire.request(URL, method: httpMethod, parameters: urlParameters, encoding: JSONEncoding.default , headers: RequestComponent.headerComponent(requireAuthOrNot: authOrNot)).responseObject{(response: DataResponse<Response<T>>)  in
            
            let respons = response.result.value
           // print("respons",respons?.payload as Any)
            switch response.result {
            case .success:
                completionHandler(respons!, nil)
            case .failure:
                completionHandler(nil,errorMessage(message:"Server Down"))
            }
        }
    }
}

