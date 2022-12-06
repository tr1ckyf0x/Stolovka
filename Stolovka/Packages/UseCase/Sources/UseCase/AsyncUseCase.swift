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

extension AsyncUseCase where Argument == Void {
    public func executeAsync(completion: @escaping (Result<Res, Error>) -> Void) {
        executeAsync(Void(), completion: completion)
    }
}
