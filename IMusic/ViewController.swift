//
//  ViewController.swift
//  IMusic
//
//  Created by Дмитрий Рудаков on 21.12.2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
    }

    override class func willChangeValue(forKey key: String) {
        print(0)
    }

}

