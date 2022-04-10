//
//  AsyncUseCaseMock.swift
//  
//
//  Created by Vladislav Lisianskii on 10.04.2022.
//

import Foundation
import UseCase

public final class AsyncUseCaseMock<Argument, Res>: AsyncUseCase<Argument, Res> {

    public var result: Result<Res, Error>?
    public private(set) var didCallExecuteAsync = false

    override public func executeAsync(
        _ requestArgument: Argument,
        completion: @escaping (Result<Res, Error>) -> Void
    ) {
        didCallExecuteAsync = true

        if let result = result {
            completion(result)
        }
    }
}
