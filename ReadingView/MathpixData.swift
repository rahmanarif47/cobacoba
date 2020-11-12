//
//  MathpixData.swift
//  ReadingView
//
//  Created by Arif Rahman Sidik on 10/11/20.
//

import Foundation

struct MathpixData : Codable {
    let text: String
    let html: String
    let data: [mathData]
    
    struct mathData : Codable {
        let type : String
        let value : String
    }
}
