//
//  ModulesKeyPaths.swift
//  FHKInjections
//
//  Created by Fredy Leon on 7/3/26.
//

import FHKDomain

public extension DependenciesInjection {
    
    var fhkLanguage: any FHKLanguageManagerProtocol {
        get { get((any FHKLanguageManagerProtocol).self) }
        set { set(newValue, for: (any FHKLanguageManagerProtocol).self) }
    }
}
