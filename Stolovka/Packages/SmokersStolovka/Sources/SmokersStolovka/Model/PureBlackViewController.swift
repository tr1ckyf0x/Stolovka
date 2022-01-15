//
//  File.swift
//  
//
//  Created by Nikita Shvad on 15.01.2022.
//

import Foundation
import UIKit

class PureBlackViewController: UIViewController {
    
    let blackSquare: UIView = {
        let view1 = UIView()
        view1.backgroundColor = .black
        return view1
    }()
    
    override func viewDidLoad() {
        view.addSubview(blackSquare)
        blackSquare.frame = view.bounds
    }
}
