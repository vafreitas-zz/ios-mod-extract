//
//  BaseViewController.swift
//  TQIExtract
//
//  Created by Victor Freitas on 14/01/22.
//

import Foundation

open class BaseViewController: UIViewController {
        
    // MARK: Properties
    
    public var navBarHidden: Bool = false
    
    // MARK: Lifecycle
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(navBarHidden, animated: true)
    }
}
