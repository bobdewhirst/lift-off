//
//  SpaceXDataSourceService.swift
//  Lift-Off
//
//  Created by Bobby Dev on 06/07/2021.
//

import Foundation

struct SpaceXDataSourceContainer {
    static let spaceXDataSource: SpaceXDataSource = SpaceXDataSource()
}

protocol HasSpaceXDataSource {
    var spaceXDataSource: SpaceXDataSource {get}
}

extension HasSpaceXDataSource {
    var spaceXDataSource: SpaceXDataSource {
        return SpaceXDataSourceContainer.spaceXDataSource
    }
}
