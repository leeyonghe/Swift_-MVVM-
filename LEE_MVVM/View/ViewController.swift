//
//  ViewController.swift
//  LEE_MVVM
//
//  Created by leedev on 2020/10/18.
//

import UIKit
import SwiftyJSON

protocol ViewControllerProtocol {
    var viewModel : ViewModel { get set }
    func configure()
}

class ViewController: UIViewController, ViewControllerProtocol {
    
    @IBOutlet weak var userName : UILabel!
    
    var viewModel = ViewModel()
    
    func configure() {
        self.viewModel.getFromServer(completion: self.complete)
    }
    
    func complete(_ json : JSON){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
    }
    
}
