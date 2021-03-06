//
//  ArgumentsFilesWriteModel.swift
//  IpfsApi
//
//  Created by we on 2018. 8. 20..
//

import Foundation

public struct ArgumentsFilesWriteModel: Codable {
    //    arg [string]: Path to write to. Required: yes.
    public let arg: String
    //    offset [int]: Byte offset to begin writing at. Required: no.
    public let offset: Int?
    //    create [bool]: Create the file if it does not exist. Required: no.
    public let create: Bool?
    //    truncate [bool]: Truncate the file to size zero before writing. Required: no.
    public let truncate: Bool?
    //    count [int]: Maximum number of bytes to read. Required: no.
    public let count: Int?
    
    init(path: String,
         offset: Int? = nil,
         create: Bool? = nil,
         truncate: Bool? = nil,
         count: Int? = nil) {
        self.arg = path
        self.offset = offset
        self.create = create
        self.truncate = truncate
        self.count = count
    }
}
