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
    
    var fhkLoginRepository: FHKLoginRepository {
        get { get(FHKLoginRepository.self) }
        set { set(newValue, for: FHKLoginRepository.self) }
    }
    
    var fhkSplashRepository: FHKSplashRepository {
        get { get(FHKSplashRepository.self) }
        set { set(newValue, for: FHKSplashRepository.self) }
    }
    
    var fhkRegisterRepository: FHKRegisterRepository {
        get { get(FHKRegisterRepository.self) }
        set { set(newValue, for: FHKRegisterRepository.self) }
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
    
    var fhkSupabaseGoal: any FHKSupabaseGoalProtocol {
        get { get((any FHKSupabaseGoalProtocol).self) }
        set { set(newValue, for: (any FHKSupabaseGoalProtocol).self) }
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
    
    var fhkGoalsRepository: any FHKGoalRepositoryProtocol {
        get { get((any FHKGoalRepositoryProtocol).self) }
        set { set(newValue, for: (any FHKGoalRepositoryProtocol).self) }
    }
    
    var fhkSupabaseBalance: any FHKSupabaseBalanceProtocol {
        get { get((any FHKSupabaseBalanceProtocol).self) }
        set { set(newValue, for: (any FHKSupabaseBalanceProtocol).self) }
    }
    
    var fhkBalanceRepository: any FHKBalanceRepositoryProtocol {
        get { get((any FHKBalanceRepositoryProtocol).self) }
        set { set(newValue, for: (any FHKBalanceRepositoryProtocol).self) }
    }
    
    var fhkSupabaseRewards: any FHKSupabaseRewardsProtocol {
        get { get((any FHKSupabaseRewardsProtocol).self) }
        set { set(newValue, for: (any FHKSupabaseRewardsProtocol).self) }
    }
    
    var fhkRewardsRepository: any FHKRewardRepositoryProtocol {
        get { get((any FHKRewardRepositoryProtocol).self) }
        set { set(newValue, for: (any FHKRewardRepositoryProtocol).self) }
    }
    
}

