//
//  Launch.swift
//  Lift-Off
//
//  Created by Bobby Dev on 04/07/2021.
//

import Foundation

struct Launch: Codable {
    let name: String?
    let rocket: String?
    let links: Links
    let success: Bool?
    let date_local: String?
}

struct Links: Codable {
    let patch: Patch
}

struct Patch: Codable {
    let small, large: String?
}
