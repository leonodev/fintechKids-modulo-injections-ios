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
    
    var fhkConfiguration: FHKConfiguration {
        get { get(FHKConfiguration.self) }
        set { set(newValue, for: FHKConfiguration.self) }
    }
    
    var fhkFirebaseRemoteConfig: FHKRemoteConfig {
        get { get(FHKRemoteConfig.self) }
        set { set(newValue, for: FHKRemoteConfig.self) }
    }
    
    var fhkFirebaseAnalitycs: FHKAnalytics {
        get { get(FHKAnalytics.self) }
        set { set(newValue, for: FHKAnalytics.self) }
    }
    
    var fhkSupabase: FHKAuth {
        get { get(FHKAuth.self) }
        set { set(newValue, for: FHKAuth.self) }
    }
    
    var fhkServicesAPI: FHKServices {
        get { get(FHKServices.self) }
        set { set(newValue, for: FHKServices.self) }
    }
    
    var fhkSecurity: FHKSecurity {
        get { get(FHKSecurity.self) }
        set { set(newValue, for: FHKSecurity.self) }
    }
    
    var fhkModal: FHKModal {
        get { get(FHKModal.self) }
        set { set(newValue, for: FHKModal.self) }
    }
    
    var fhkToast: FHKToast {
        get { get(FHKToast.self) }
        set { set(newValue, for: FHKToast.self) }
    }
    
    var fhkCameraPermission: any FHKPermissionProtocol {
        get { get((any FHKPermissionProtocol).self) }
        set { set(newValue, for: (any FHKPermissionProtocol).self) }
    }
    
    var fhkSession: FHKSession {
        get { get(FHKSession.self) }
        set { set(newValue, for: FHKSession.self) }
    }
}

