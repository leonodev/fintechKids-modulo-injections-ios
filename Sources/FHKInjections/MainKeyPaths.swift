//
//  KeyPaths.swift
//  FHKInjections
//
//  Created by Fredy Leon on 7/3/26.
//

import FHKDomain

public extension DependenciesInjection {
    var fhkStorage: any FHKStorageManagerProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkConfiguration: any FHKConfigurationProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkFirebaseRemoteConfig: any FHKRemoteConfigManagerProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkFirebaseAnalitycs: any FHKAnalyticsProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkSupabase: any FHKAuthProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkServicesAPI: any FHKServicesAPIProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkSecurity: any FHKSecurityProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkModal: any FHKModalProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkToast: any FHKToastProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkCameraPermission: any FHKPermissionProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkSessionManager: any FHKSessionManagerProtocol
    { get { get() } set { set(newValue) } }
    
   /* var fhkStorage: any FHKStorageManagerProtocol {
        get { get((any FHKStorageManagerProtocol).self) }
        set { set(newValue, for: (any FHKStorageManagerProtocol).self) }
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
    
    var fhkServicesAPI: any FHKServicesAPIProtocol {
        get { get((any FHKServicesAPIProtocol).self) }
        set { set(newValue, for: (any FHKServicesAPIProtocol).self) }
    }
    
    var fhkSecurity: any FHKSecurityProtocol {
        get { get((any FHKSecurityProtocol).self) }
        set { set(newValue, for: (any FHKSecurityProtocol).self) }
    }
    
    var fhkModal: any FHKModalProtocol {
        get { get((any FHKModalProtocol).self) }
        set { set(newValue, for: (any FHKModalProtocol).self) }
    }
    
    var fhkToast: any FHKToastProtocol {
        get { get((any FHKToastProtocol).self) }
        set { set(newValue, for: (any FHKToastProtocol).self) }
    }
    
    var fhkCameraPermission: any FHKPermissionProtocol {
        get { get((any FHKPermissionProtocol).self) }
        set { set(newValue, for: (any FHKPermissionProtocol).self) }
    }
    
    var fhkSessionManager: any FHKSessionManagerProtocol {
        get { get((any FHKSessionManagerProtocol).self) }
        set { set(newValue, for: (any FHKSessionManagerProtocol).self) }
    }
    */
}

