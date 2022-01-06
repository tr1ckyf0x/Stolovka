//
//  AsyncUseCase.swift
//  
//
//  Created by Vladislav Lisianskii on 06.01.2022.
//

import Foundation

public protocol AsyncUseCaseProtocol {
    associatedtype Argument
    associatedtype Res

    func executeAsync(_ requestArgument: Argument, completion: @escaping (Result<Res, Error>) -> Void)
}

open class AsyncUseCase<Argument, Res>: AsyncUseCaseProtocol {
    public init() { }

    open func executeAsync(_ requestArgument: Argument, completion: @escaping (Result<Res, Error>) -> Void) {
        fatalError("Must be overriden")
    }
}

public extension AsyncUseCase where Argument == Void {
    func executeAsync(completion: @escaping (Result<Res, Error>) -> Void) {
        executeAsync(Void(), completion: completion)
    }
}


