//
//  MainScreenProductCarouselCollectionManager.swift
//  Stolovka
//
//  Created by Vladislav Lisianskii on 06.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import UIKit
import ProductModels

final class MainScreenProductCarouselCollectionManager: NSObject {
    private var products = [MainScreenProduct]()
}

extension MainScreenProductCarouselCollectionManager: MainScreenProductCarouselCollectionManagerProtocol {
    func setProducts(_ products: [MainScreenProduct]) {
        self.products = products
    }
}

extension MainScreenProductCarouselCollectionManager: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ProductCollectionCell.self)", for: indexPath) as? ProductCollectionCell
        let product = products[indexPath.item]
        cell?.configure(product: product)
        return cell!
    }
}
