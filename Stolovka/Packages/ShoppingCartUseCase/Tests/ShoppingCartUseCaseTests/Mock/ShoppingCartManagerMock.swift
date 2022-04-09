//
//  ShoppingCartManagerMock.swift
//  
//
//  Created by Vladislav Lisianskii on 09.04.2022.
//

import Managers
import Models
@testable import ShoppingCartUseCase

final class ShoppingCartManagerMock {
    private(set) var didCallAddToCart = false
    private(set) var didCallRemoveFromCart = false
    private(set) var didCallFetchCartItems = false
}

extension ShoppingCartManagerMock: ShoppingCartManagerProtocol {
    func addToCart(foodItem: FoodItem, completion: @escaping (Result<Void, Error>) -> Void) {
        didCallAddToCart = true
        completion(.success(Void()))
    }

    func removeFromCart(foodItem: FoodItem, completion: @escaping (Result<Void, Error>) -> Void) {
        didCallRemoveFromCart = true
        completion(.success(Void()))
    }

    func fetchCartItems(completion: @escaping (Result<[CountableContainer<FoodItem>], Error>) -> Void) {
        didCallFetchCartItems = true
        completion(.success([]))
    }
}
