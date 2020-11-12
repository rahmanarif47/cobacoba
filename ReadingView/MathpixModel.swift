//
//  MathpixModel.swift
//  ReadingView
//
//  Created by Arif Rahman Sidik on 10/11/20.
//

import Foundation

//MARK: - Test
struct MathpixModel : Codable {
    let src: String
    let formats: [String]
    let data_options: [DataOptions]
    
    struct DataOptions: Codable {
        let include_asciimath: Bool
        let include_latex: Bool
    }
}
