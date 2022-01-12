//
//  UseCaseModel.swift
//  Stolovka
//
//  Created by Nikita Shvad on 07.01.2022.
//  Copyright © 2022 Владислав Лисянский. All rights reserved.
//

//import Foundation

// Повторил один раз. Просто чтобы повторить. Использовать буду готовый package
//protocol AsyncUseCaseProtocolNikita {
//    associatedtype Argument
//    associatedtype Res
//
//    func executeAsync(_ requestArgument: Argument, completion: @escaping (Result<Res, Error>) -> Void)
//}
//
//class AsyncUseCaseNikita<Argument, Res>: AsyncUseCaseProtocolNikita {
//
//    func executeAsync(_ requestArgument: Argument, completion: @escaping (Result<Res, Error>) -> Void) {
//        fatalError("Must Be Overriden")
//    }
//}
//
//extension AsyncUseCaseNikita where Argument == Void {
//    func executeAsync(completion: @escaping (Result<Res, Error>) -> Void) {
//        executeAsync(Void(), completion: completion)
//    }
//}
