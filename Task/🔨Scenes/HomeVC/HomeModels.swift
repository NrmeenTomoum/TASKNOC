//
//  HomeModels.swift
//  Task
//
//  Created by Nrmeen Tomoum on 12/22/18.
//  Copyright (c) 2018 MobileNOC. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import ObjectMapper
enum Home
{
    // MARK: Use cases
    
    enum Server
    {
        struct Request
        {
            var page : Int
            var size : Int
        }
        struct  ViewModel
        {
            var   name : String
            var  ipAddress : String
            var  deviceIPSubnetMask : String
            var  status : Int
        }
        class  Response : Mappable {
            var content : [ContentModel]?
            var totalPages : Int?
            var totalElements : Int?
            var numberOfElements : Int?
            var size : Int?
            var last : Bool?
            required init?(map: Map){
                
            }
            func mapping(map: Map) {
                content <- map["content"]
                totalPages <- map ["totalPages"]
                totalElements <- map["totalElements"]
                numberOfElements <- map["numberOfElements"]
                size <- map["size"]
                last <- map["last"]
                
            }
        }
        
}
    
}
    class  ContentModel : Mappable {
        var id : Int?
        var name : String?
        var ipAddress : String?
        var ipSubnetMask : String?
        var status : StatusModel?
        required init?(map: Map){
            
        }
        func mapping(map: Map) {
            id <- map["id"]
            name <- map ["name"]
            ipAddress <- map["ipAddress"]
            ipSubnetMask <- map["ipSubnetMask"]
            status <- map["status"]
            
        }
    }
    class  StatusModel : Mappable {
        var id : Int?
        required init?(map: Map){
            
        }
        func mapping(map: Map) {
            id <- map["id"]
        }
    }

