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

public protocol CategorizedItemsProviderProtocol {
    func fetchCategorizedItems (completion: @escaping(Result<[CategorizedFoodItems], Error>) -> Void)
}

public final class CategorizedItemsProvider: CategorizedItemsProviderProtocol {

    public init() {
    }

    // swiftlint:disable:next function_body_length
    public func fetchCategorizedItems(completion: @escaping (Result<[CategorizedFoodItems], Error>) -> Void) {

        let categorizedFoodItems: [CategorizedFoodItems] = [

            CategorizedFoodItems(
                category: .bakery,
                products: [
                    FoodItem(
                        name: "Булочка",
                        price: 5.00,
                        description: "Былочка с присыпкой.",
                        pictureUrl: .local(SharedResources.Asset.Assets.Products.bun),
                        isLikedByUser: false,
                        itemID: "bun"
                    ),
                    FoodItem(
                        name: "Пирожок с мясом",
                        price: 8.000,
                        description: "Ты никогда не узнаешь, чье это мясо.",
                        pictureUrl: .local(Asset.Assets.Products.meatPie),
                        isLikedByUser: false,
                        itemID: "pirog"
                    ),
                    FoodItem(
                        name: "Пицца",
                        price: 14.000,
                        description: "Быстро заканчивается",
                        pictureUrl: .local(Asset.Assets.Products.pizza),
                        isLikedByUser: false,
                        itemID: "pizza"
                    ),
                    FoodItem(
                        name: "Сосиска в тесте",
                        price: 12.000,
                        description: "Старшаки очень любят",
                        pictureUrl: .local(Asset.Assets.Products.sosiskaVTeste),
                        isLikedByUser: false,
                        itemID: "sausage"
                    ),
                    FoodItem(
                        name: "Белый хлеб",
                        price: 0.33,
                        description: "Можно и без супа",
                        pictureUrl: .local(Asset.Assets.Products.whiteBread),
                        isLikedByUser: false,
                        itemID: "bread"
                    )
                ]
            ),

            CategorizedFoodItems(
                category: .hot,
                products: [
                    FoodItem(
                        name: "Гречка вегетарианская",
                        price: 7.000,
                        description: "Каждый годо дорожает",
                        pictureUrl: .local(Asset.Assets.Products.buckwheat),
                        isLikedByUser: false,
                        itemID: "buckwheat"
                    ),
                    FoodItem(
                        name: "Макарошки с чем-то",
                        price: 23.000,
                        description: "Скорее всего с курицей.",
                        pictureUrl: .local(Asset.Assets.Products.pasta),
                        isLikedByUser: false,
                        itemID: "pasta"
                    )
                ]
            ),

            CategorizedFoodItems(
                category: .soup,
                products: [
                    FoodItem(
                        name: "Борщ",
                        price: 9.000,
                        description: "Красный горячий борщ",
                        pictureUrl: .local(Asset.Assets.Products.borsh),
                        isLikedByUser: false,
                        itemID: "borch"
                    ),
                    FoodItem(
                        name: "Щи",
                        price: 7.000,
                        description: "Борщ, с капусткой, но не красный. Вообще он меня бесит.",
                        pictureUrl: .local(Asset.Assets.Products.shi),
                        isLikedByUser: false,
                        itemID: "whiteBorch"
                    )
                ]
            ),

            CategorizedFoodItems(
                category: .beverage,
                products: [
                    FoodItem(
                        name: "Сок яблочный",
                        price: 4.000,
                        description: "Для маленьких экстремистов",
                        pictureUrl: .local(Asset.Assets.Products.juiceApple),
                        isLikedByUser: false,
                        itemID: "juiceApple"
                    ),
                    FoodItem(
                        name: "Сок персиковый",
                        price: 4.000,
                        description: "Нектар со вкусом персика",
                        pictureUrl: .local(Asset.Assets.Products.juicePeach),
                        isLikedByUser: false,
                        itemID: "juicePeach"
                    ),
                    FoodItem(
                        name: "Кофейный Напиток",
                        price: 6.000,
                        description: "Старшаки очень любят",
                        pictureUrl: .local(Asset.Assets.Products.cofeinyiNapitok),
                        isLikedByUser: false,
                        itemID: "coffee"
                    )
                ]
            ),

            CategorizedFoodItems(
                category: .dessert,
                products: [
                    FoodItem(
                        name: "Золотой Ключик",
                        price: 0.10,
                        description: "Лучше сдачи",
                        pictureUrl: .local(Asset.Assets.Products.fudge),
                        isLikedByUser: false,
                        itemID: "fudge"
                    ),
                    FoodItem(
                        name: "Твикс",
                        price: 21.000,
                        description: "Импортный Золотой Ключик в шоколаде",
                        pictureUrl: .local(Asset.Assets.Products.twix),
                        isLikedByUser: false,
                        itemID: "twix"
                    ),
                    FoodItem(
                        name: "Сникерс",
                        price: 21.000,
                        description: "Марс с орешками",
                        pictureUrl: .local(Asset.Assets.Products.snikers),
                        isLikedByUser: false,
                        itemID: "snickers"
                    )
                ]
            ),

            CategorizedFoodItems(
                category: .fromYesterday,
                products: [
                    FoodItem(
                        name: "Каша Манная",
                        price: 7.000,
                        description: "Чуть теплая и комковатая. Как и твоя жизнь.",
                        pictureUrl: .local(Asset.Assets.Products.semolinaPorrige),
                        isLikedByUser: false,
                        itemID: "semolina"
                    ),
                    FoodItem(
                        name: "Пюрешка с котлеткой",
                        price: 10.000,
                        description: "Уважаемая еда. Текстура великолепна.",
                        pictureUrl: .local(Asset.Assets.Products.pyreshkaSKotletkoi),
                        isLikedByUser: false,
                        itemID: "mashedPotato"
                    ),
                    FoodItem(
                        name: "Оливье",
                        price: 7.450,
                        description: "Прошлогодний",
                        pictureUrl: .local(Asset.Assets.Products.olivie),
                        isLikedByUser: false,
                        itemID: "olivie"
                    ),
                    FoodItem(
                        name: "Винегрет",
                        price: 7.000,
                        description: "Оливье в уксусе со свеколкой",
                        pictureUrl: .local(Asset.Assets.Products.vinegret),
                        isLikedByUser: false,
                        itemID: "otherSalad1"
                    )
                ]
            )
        ]

        completion(.success(categorizedFoodItems))
    }
}
