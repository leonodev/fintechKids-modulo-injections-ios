//
//  ModulesKeyPaths.swift
//  FHKInjections
//
//  Created by Fredy Leon on 7/3/26.
//

import FHKDomain

public extension DependenciesInjection {
    
    var fhkLanguage: any FHKLanguageManagerProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkLanguageRepository: any FHKLanguageRepositoryProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkLoginRepository: any FHKLoginRepositoryProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkSplashRepository: any FHKSplashRepositoryProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkRegisterRepository: any RegisterRepositoryProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkRegisterMembersRepository: any FHKRegisterMembersRepositoryProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkSupabaseMembers: any FHKSupabaseMembersProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkSupabaseTask: any FHKSupabaseTaskProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkSupabaseGoal: any FHKSupabaseGoalProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkHomeRepository: any FHKHomeRepositoryProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkProfileRepository: any FHKProfileRepositoryProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkTasksRepository: any FHKTasksRepositoryProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkGoalsRepository: any FHKGoalRepositoryProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkSupabaseBalance: any FHKSupabaseBalanceProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkBalanceRepository: any FHKBalanceRepositoryProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkSupabaseRewards: any FHKSupabaseRewardsProtocol
    { get { get() } set { set(newValue) } }
    
    var fhkRewardsRepository: any FHKRewardRepositoryProtocol
    { get { get() } set { set(newValue) } }
    
    /*var fhkLanguage: any FHKLanguageManagerProtocol {
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
    */
}

