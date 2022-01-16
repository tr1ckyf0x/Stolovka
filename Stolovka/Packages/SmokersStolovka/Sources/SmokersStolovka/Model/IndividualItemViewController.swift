//
//  File.swift
//  
//
//  Created by Nikita Shvad on 15.01.2022.
//

import Foundation
import UIKit
import SharedResources

class IndividualItemViewController: UIViewController {
    
    let individualProductView = IndividualItemView()
    var indexPath: IndexPath?
    
    override func viewDidLoad() {
        view = individualProductView
    }
}

//MARK: - Public Methods
extension IndividualItemViewController {
    func configure(indexPath: IndexPath) {
        self.indexPath = indexPath
        individualProductView.scrollToIndexPath = indexPath
    }
}



