//
//  UseCaseMock.swift
//  
//
//  Created by Vladislav Lisianskii on 10.04.2022.
//

import Foundation
import UseCase

public final class UseCaseMock<Argument, Res>: UseCase<Argument, Res> {

    public var result: Res!
    public private(set) var didCallExecute = false

    override public func execute(_ requestArgument: Argument) -> Res {
        didCallExecute = true
        return result
    }
}
