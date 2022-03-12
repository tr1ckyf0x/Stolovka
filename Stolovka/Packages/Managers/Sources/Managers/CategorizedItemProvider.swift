//
//  CategorizedItemProvider.swift
//  Stolovka
//
//  Created by Nikita Shvad on 09.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

import Foundation
import Models
import SharedResources

protocol CategorizedItemsProviderProtocol {
    func fetchCategorizedItems (completion: @escaping(Result<[CategorizedFoodItems], Error>) -> Void)
}

final class CategorizedItemsProvider: CategorizedItemsProviderProtocol {
    func fetchCategorizedItems(completion: @escaping (Result<[CategorizedFoodItems], Error>) -> Void) {
        
        let categorizedFoodItems: [CategorizedFoodItems] = [
            
            CategorizedFoodItems(category: .bakery, products: [
                FoodItem(name: "Булочка", price: 5.00, description: "Былочка с присыпкой.", pictureUrl: .local(SharedResources.Asset.Assets.Products.bun), isLikedByUser: false, itemID: "113"),
                FoodItem(name: "Пирожок с мясом", price: 8.000, description: "Ты никогда не узнаешь, чье это мясо.", pictureUrl: .local(Asset.Assets.Products.meatPie), isLikedByUser: false, itemID: "112312"),
                FoodItem(name: "Пицца", price: 14.000, description: "Быстро заканчивается", pictureUrl: .local(Asset.Assets.Products.pizza), isLikedByUser: false, itemID: "12333"),
                FoodItem(name: "Сосиска в тесте", price: 12.000, description: "Старшаки очень любят", pictureUrl: .local(Asset.Assets.Products.sosiskaVTeste), isLikedByUser: false, itemID: "123123"),
                FoodItem(name: "Белый хлеб", price: 0.33, description: "Можно и без супа", pictureUrl: .local(Asset.Assets.Products.whiteBread), isLikedByUser: false, itemID: "132111")
            ]),
            
            CategorizedFoodItems(category: .hot, products: [
                FoodItem(name: "Гречка вегетарианская", price: 7.000, description: "Каждый годо дорожает", pictureUrl: .local(Asset.Assets.Products.buckwheat), isLikedByUser: false, itemID: "1114"),
                FoodItem(name: "Макарошки с чем-то", price: 23.000, description: "Скорее всего с курицей.", pictureUrl: .local(Asset.Assets.Products.pasta), isLikedByUser: false, itemID: "1116"),
            ]),
            
            CategorizedFoodItems(category: .soup, products: [
                FoodItem(name: "Борщ", price: 9.000, description: "Красный горячий борщ", pictureUrl: .local(Asset.Assets.Products.borsh), isLikedByUser: false, itemID: "r3r3r"),
                FoodItem(name: "Щи", price: 7.000, description: "Борщ, с капусткой, но не красный. Вообще он меня бесит.", pictureUrl: .local(Asset.Assets.Products.shi), isLikedByUser: false, itemID: "1114"),
            ]),
            
            CategorizedFoodItems(category: .beverage, products: [
                FoodItem(name: "Сок яблочный", price: 4.000, description: "Для маленьких экстремистов", pictureUrl: .local(Asset.Assets.Products.juiceApple), isLikedByUser: false, itemID: "148888"),
                FoodItem(name: "Сок персиковый", price: 4.000, description: "Нектар со вкусом персика", pictureUrl: .local(Asset.Assets.Products.juicePeach), isLikedByUser: false, itemID: "21"),
                FoodItem(name: "Кофейный Напиток", price: 6.000, description: "Старшаки очень любят", pictureUrl: .local(Asset.Assets.Products.cofeinyiNapitok), isLikedByUser: false, itemID: "11"),
            ]),
            
            CategorizedFoodItems(category: .desert, products: [
                FoodItem(name: "Золотой Ключик", price: 0.10, description: "Лучше сдачи", pictureUrl: .local(Asset.Assets.Products.fudge), isLikedByUser: false, itemID: "12443"),
                FoodItem(name: "Твикс", price: 21.000, description: "Импортный Золотой Ключик в шоколаде", pictureUrl: .local(Asset.Assets.Products.twix), isLikedByUser: false, itemID: "re2"),
                FoodItem(name: "Сникерс", price: 21.000, description: "Марс с орешками", pictureUrl: .local(Asset.Assets.Products.snikers), isLikedByUser: false, itemID: "333333"),
            ]),
            
            CategorizedFoodItems(category: .fromYesterday, products: [
                FoodItem(name: "Каша Манная", price: 7.000, description: "Чуть теплая и комковатая. Как и твоя жизнь.", pictureUrl: .local(Asset.Assets.Products.semolinaPorrige), isLikedByUser: false, itemID: "114"),
                FoodItem(name: "Пюрешка с котлеткой", price: 10.000, description: "Уважаемая еда. Текстура великолепна.", pictureUrl: .local(Asset.Assets.Products.pyreshkaSKotletkoi), isLikedByUser: false, itemID: "115"),
                FoodItem(name: "Оливье", price: 7.450, description: "Прошлогодний", pictureUrl: .local(Asset.Assets.Products.olivie), isLikedByUser: false, itemID: "3e4324e"),
                FoodItem(name: "Винегрет", price: 7.000, description: "Оливье в уксусе со свеколкой", pictureUrl: .local(Asset.Assets.Products.vinegret), isLikedByUser: false, itemID: "3333")
            ]),
        ]
        
        completion(.success(categorizedFoodItems))
    }
}
