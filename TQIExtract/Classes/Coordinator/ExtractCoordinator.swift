//
//  ExtractCoordinator.swift
//  DIOExtract
//
//  Created by Victor Freitas on 10/01/22.
//

import TQICoordinator

open class ExtractCoordinator: Coordinator {
    
    // MARK: Properties
    
    public var delegate: CoordinatorDelegate?
    public var childCoordinator: Coordinator?
    public var viewController: UIViewController!
    public var navigationController: UINavigationController?
    
    // MARK: Initializer
    
    public init() {
        viewController = ExtractListViewController(viewModel: .init())
        navigationController = UINavigationController(rootViewController: viewController)
    }
}
