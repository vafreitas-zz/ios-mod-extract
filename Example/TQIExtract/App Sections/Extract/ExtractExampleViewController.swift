//
//  ExtractExampleViewController.swift
//  DIOExtract_Example
//
//  Created by Victor Freitas on 10/01/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import TQIExtract

class ExtractExampleViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var openExtractButton: UIButton!
    
    // MARK: Properties
    
    let extractController = ExtractViewController()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
    
    // MARK: Actions
    
    @IBAction func openExtract(_ sender: Any) {
        guard let navigation = navigationController else {
            return
        }
        
        navigation.pushViewController(extractController, animated: true)
    }
}
