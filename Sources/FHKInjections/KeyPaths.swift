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
    
    var fhkSupabaseMembers: any FHKSupabaseMembersProtocol {
        get { get((any FHKSupabaseMembersProtocol).self) }
        set { set(newValue, for: (any FHKSupabaseMembersProtocol).self) }
    }
    
    var fhkServicesAPI: any FHKServicesAPIProtocol {
        get { get((any FHKServicesAPIProtocol).self) }
        set { set(newValue, for: (any FHKServicesAPIProtocol).self) }
    }
    
    var fhkSecurityManager: any FHKSecurityProtocol {
        get { get((any FHKSecurityProtocol).self) }
        set { set(newValue, for: (any FHKSecurityProtocol).self) }
    }
    
    
}

