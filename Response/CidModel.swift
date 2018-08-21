//
//  CidModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 21..
//

import Foundation

public struct CidModel: Codable {
    let cid: String?
    let remPath: String?
    let error: String?
    
    enum CodingKeys: String, CodingKey {
        case cid = "Cid"
        case remPath = "RemPath"
        case error = "Err"
    }
}
