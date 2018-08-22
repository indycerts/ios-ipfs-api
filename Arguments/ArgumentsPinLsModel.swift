//
//  ArgumentsPinLsModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsPinLsModel: Codable {
    //    arg [string]: Path to object(s) to be listed. Required: no.
    let arg: String?
    //    type [string]: The type of pinned keys to list. Can be “direct”, “indirect”, “recursive”, or “all”. Default: “all”. Required: no.
    let type: String?
    //    quiet [bool]: Write just hashes of objects. Default: “false”. Required: no.
    let quiet: Bool?
    
    init(arg: String? = nil,
         type: String? = nil,
         quiet: Bool? = nil) {
        self.arg = arg
        self.type = type
        self.quiet = quiet
    }
}