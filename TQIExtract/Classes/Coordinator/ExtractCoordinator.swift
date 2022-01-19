//
//  ExtractCoordinator.swift
//  DIOExtract
//
//  Created by Victor Freitas on 10/01/22.
//

import TQICoordinator

open class ExtractCoordinator: Coordinator {
    
    // MARK: Properties
    
    public typealias V = ExtractListViewController
    public var view: ExtractListViewController?
    public var navigation: UINavigationController?
    public var presentationType: PresentationType?
    
    // MARK: Initializer
    
    public init() {
        view = ExtractListViewController(viewModel: .init())
    }
    
    public func stop() {
        navigation = nil
        view = nil
        presentationType = nil
    }
}
