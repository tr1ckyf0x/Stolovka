import UIKit
import SharedResources

public protocol ItemRemovalAlertProtocol {
    func onSuccess(
        itemName: String,
        success: @escaping () -> Void?,
        cancel: @escaping () -> Void?
    )
}

public final class ItemRemovalAlert: ItemRemovalAlertProtocol {
    weak var viewController: UIViewController?

   public init(viewController: UIViewController) {
        self.viewController = viewController
    }

    public func onSuccess(
        itemName: String,
        success: @escaping () -> Void?,
        cancel: @escaping () -> Void?
    ) {
        let alert = UIAlertController(
            title: SharedResources.L10n.removeItemAlertTitle,
            message: SharedResources.L10n.removeItemAlertMessage,
            preferredStyle: UIAlertController.Style.alert
        )

        let cancelAction = UIAlertAction(title: SharedResources.L10n.cancel, style: .cancel) {_ in
            cancel()
        }
        let okAction = UIAlertAction(title: SharedResources.L10n.ok, style: .default) {_ in
            success()
        }

        alert.addAction(okAction)
        alert.addAction(cancelAction)

        guard let viewController = viewController else { return }
        viewController.present(alert, animated: true)
    }
}
