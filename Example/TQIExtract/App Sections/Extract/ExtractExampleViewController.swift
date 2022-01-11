//
//  ExtractExampleViewController.swift
//  DIOExtract_Example
//
//  Created by Victor Freitas on 10/01/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import TQIExtract
import SwiftUI

class ExtractExampleViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var switfuiSwitch: UISwitch!
    
    // MARK: Properties
    
    let extractController = ExtractViewController()
    let extractSwiftUIView = ExtractSwiftUIView()
    lazy var extractSwiftUIController = UIHostingController(rootView: extractSwiftUIView)
    
    // MARK: Actions
    
    @IBAction func openExtract(_ sender: Any) {
        guard let navigation = navigationController else {
            return
        }
        
        if switfuiSwitch.isOn {
            extractSwiftUIController.navigationController?.isNavigationBarHidden = true
            navigation.pushViewController(extractSwiftUIController, animated: true)
            
        } else {
            navigation.pushViewController(extractController, animated: true)
        }
    }
}
