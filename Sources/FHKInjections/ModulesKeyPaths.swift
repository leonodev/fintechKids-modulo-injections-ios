//
//  ModulesKeyPaths.swift
//  FHKInjections
//
//  Created by Fredy Leon on 7/3/26.
//

import FHKDomain

public extension DependenciesInjection {

    var fhkLanguage: FHKLanguage {
        get { get(FHKLanguage.self) }
        set { set(newValue, for: FHKLanguage.self) }
    }
    
    var fhkLanguageRepository: FHKLanguageRepository {
        get { get(FHKLanguageRepository.self) }
        set { set(newValue, for: (FHKLanguageRepository).self) }
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
    
    var fhkRegisterMembersRepository: FHKRegisterMembersRepository {
        get { get(FHKRegisterMembersRepository.self) }
        set { set(newValue, for: FHKRegisterMembersRepository.self) }
    }
    
    var fhkSupabaseMembers: FHKSupabaseMembers {
        get { get(FHKSupabaseMembers.self) }
        set { set(newValue, for: FHKSupabaseMembers.self) }
    }
    
    var fhkSupabaseTask: any FHKSupabaseTaskProtocol {
        get { get((any FHKSupabaseTaskProtocol).self) }
        set { set(newValue, for: (any FHKSupabaseTaskProtocol).self) }
    }
    
    var fhkSupabaseGoal: any FHKSupabaseGoalProtocol {
        get { get((any FHKSupabaseGoalProtocol).self) }
        set { set(newValue, for: (any FHKSupabaseGoalProtocol).self) }
    }
    
    var fhkHomeRepository: FHKHomeRepository {
        get { get(FHKHomeRepository.self) }
        set { set(newValue, for: FHKHomeRepository.self) }
    }
    
    var fhkProfileRepository: FHKProfileRepository {
        get { get(FHKProfileRepository.self) }
        set { set(newValue, for: FHKProfileRepository.self) }
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

