//
//  DependenciesInjection.swift
//  FHKInjections
//
//  Created by Fredy Leon on 29/12/25.
//

import Foundation

public protocol LanguageManagerProtocol: ObservableObject, Sendable {
    var selectedLanguage: String { get }
    func readLanguage() async
    func saveLanguage(_ language: String) async
}

public extension DependenciesInjection {
    var languageManager: any LanguageManagerProtocol {
        get { self[(any LanguageManagerProtocol).self] }
        set { self[(any LanguageManagerProtocol).self] = newValue }
    }
}
