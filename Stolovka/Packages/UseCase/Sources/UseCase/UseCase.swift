public protocol UseCaseProtocol {
    associatedtype Argument
    associatedtype Res

    func execute(_ requestArgument: Argument) -> Res
}

open class UseCase<Argument, Res>: UseCaseProtocol {

    public init() { }

    open func execute(_ requestArgument: Argument) -> Res {
        fatalError("Must be overriden")
    }
}

public extension UseCase where Argument == Void {
    func execute() -> Res {
        execute(Void())
    }
}
