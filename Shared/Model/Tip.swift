//
//  Tip.swift
//  TrekrMultiPlatform
//
//  Created by Harris-Stoertz, Rowan on 2022-01-19.
//

import Foundation

struct Tip: Decodable {
    let text: String
    let children: [Tip]?
}
