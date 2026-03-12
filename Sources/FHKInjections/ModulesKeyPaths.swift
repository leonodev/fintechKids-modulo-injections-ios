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
    
    var fhkLanguageRepository: any FHKLanguageRepositoryProtocol {
        get { get((any FHKLanguageRepositoryProtocol).self) }
        set { set(newValue, for: (any FHKLanguageRepositoryProtocol).self) }
    }
    
    var fhkLoginRepository: any FHKLoginRepositoryProtocol {
        get { get((any FHKLoginRepositoryProtocol).self) }
        set { set(newValue, for: (any FHKLoginRepositoryProtocol).self) }
    }
    
    var fhkSplashRepository: any FHKSplashRepositoryProtocol {
        get { get((any FHKSplashRepositoryProtocol).self) }
        set { set(newValue, for: (any FHKSplashRepositoryProtocol).self) }
    }
    
    var fhkRegisterRepository: any RegisterRepositoryProtocol {
        get { get((any RegisterRepositoryProtocol).self) }
        set { set(newValue, for: (any RegisterRepositoryProtocol).self) }
    }
    
    var fhkRegisterMembersRepository: any FHKRegisterMembersRepositoryProtocol {
        get { get((any FHKRegisterMembersRepositoryProtocol).self) }
        set { set(newValue, for: (any FHKRegisterMembersRepositoryProtocol).self) }
    }
    
    var fhkSupabaseMembers: any FHKSupabaseMembersProtocol {
        get { get((any FHKSupabaseMembersProtocol).self) }
        set { set(newValue, for: (any FHKSupabaseMembersProtocol).self) }
    }
    
    var fhkSupabaseTask: any FHKSupabaseTaskProtocol {
        get { get((any FHKSupabaseTaskProtocol).self) }
        set { set(newValue, for: (any FHKSupabaseTaskProtocol).self) }
    }
    
    var fhkHomeRepository: any FHKHomeRepositoryProtocol {
        get { get((any FHKHomeRepositoryProtocol).self) }
        set { set(newValue, for: (any FHKHomeRepositoryProtocol).self) }
    }
    
    var fhkProfileRepository: any FHKProfileRepositoryProtocol {
        get { get((any FHKProfileRepositoryProtocol).self) }
        set { set(newValue, for: (any FHKProfileRepositoryProtocol).self) }
    }
    
    var fhkTasksRepository: any FHKTasksRepositoryProtocol {
        get { get((any FHKTasksRepositoryProtocol).self) }
        set { set(newValue, for: (any FHKTasksRepositoryProtocol).self) }
    }
}
