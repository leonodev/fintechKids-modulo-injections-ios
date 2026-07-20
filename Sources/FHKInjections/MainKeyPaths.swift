//
//  KeyPaths.swift
//  FHKInjections
//
//  Created by Fredy Leon on 7/3/26.
//

import FHKDomain

public extension DependenciesInjection {
    
    var fhkStorage: FHKStorageManager {
        get { get(FHKStorageManager.self) }
        set { set(newValue, for: FHKStorageManager.self) }
    }
    
    var fhkConfiguration: any FHKConfigurationProtocol {
        get { get((any FHKConfigurationProtocol).self) }
        set { set(newValue, for: (any FHKConfigurationProtocol).self) }
    }
    
    var fhkFirebaseRemoteConfig: any FHKRemoteConfigManagerProtocol {
        get { get((any FHKRemoteConfigManagerProtocol).self) }
        set { set(newValue, for: (any FHKRemoteConfigManagerProtocol).self) }
    }
    
    var fhkFirebaseAnalitycs: any FHKAnalyticsProtocol {
        get { get((any FHKAnalyticsProtocol).self) }
        set { set(newValue, for: (any FHKAnalyticsProtocol).self) }
    }
    
    var fhkSupabase: any FHKAuthProtocol {
        get { get((any FHKAuthProtocol).self) }
        set { set(newValue, for: (any FHKAuthProtocol).self) }
    }
    
    var fhkServicesAPI: FHKServices {
        get { get(FHKServices.self) }
        set { set(newValue, for: FHKServices.self) }
    }
    
    var fhkSecurity: FHKSecurity {
        get { get(FHKSecurity.self) }
        set { set(newValue, for: FHKSecurity.self) }
    }
    
    var fhkModal: any FHKModalProtocol {
        get { get((any FHKModalProtocol).self) }
        set { set(newValue, for: (any FHKModalProtocol).self) }
    }
    
    var fhkToast: FHKToast {
        get { get(FHKToast.self) }
        set { set(newValue, for: FHKToast.self) }
    }
    
    var fhkCameraPermission: any FHKPermissionProtocol {
        get { get((any FHKPermissionProtocol).self) }
        set { set(newValue, for: (any FHKPermissionProtocol).self) }
    }
    
    var fhkSessionManager: any FHKSessionManagerProtocol {
        get { get((any FHKSessionManagerProtocol).self) }
        set { set(newValue, for: (any FHKSessionManagerProtocol).self) }
    }
    
}

