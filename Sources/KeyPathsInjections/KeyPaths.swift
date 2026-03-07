//
//  KeyPaths.swift
//  FHKInjections
//
//  Created by Fredy Leon on 7/3/26.
//

import FHKDomain

public extension DependenciesInjection {

    var fhkStorage: any FHKStorageManagerProtocol {
        get { get((any FHKStorageManagerProtocol).self) }
        set { set(newValue, for: (any FHKStorageManagerProtocol).self) }
    }
}

