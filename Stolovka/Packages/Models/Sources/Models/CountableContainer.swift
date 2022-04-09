//
//  CountableContainer.swift
//  
//
//  Created by Vladislav Lisianskii on 09.04.2022.
//

import Foundation

public struct CountableContainer<Element> {
    public let item: Element
    public var quantity: Int

    public init(
        item: Element,
        quantity: Int
    ) {
        self.item = item
        self.quantity = quantity
    }
}

extension CountableContainer: Hashable where Element: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(item)
        hasher.combine(quantity)
    }
}

extension CountableContainer: Equatable where Element: Equatable {
    public static func == (lhs: CountableContainer<Element>, rhs: CountableContainer<Element>) -> Bool {
        lhs.item == rhs.item && lhs.quantity == rhs.quantity
    }
}
