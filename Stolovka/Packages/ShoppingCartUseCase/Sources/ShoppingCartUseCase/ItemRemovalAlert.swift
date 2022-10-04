import UIKit
import SharedResources

public protocol ItemRemovalAlertProtocol {
    func presentRemoveItemAlert(
        itemName: String,
        success: @escaping () -> Void?,
        cancel: @escaping () -> Void?
    )
}

public final class ItemRemovalAlert: ItemRemovalAlertProtocol {
    let viewController: UIViewController

   public init(viewController: UIViewController) {
        self.viewController = viewController
    }

    public func presentRemoveItemAlert(
        itemName: String,
        success: @escaping () -> Void?,
        cancel: @escaping () -> Void?
    ) {
        let alert = UIAlertController(
            title: SharedResources.L10n.removeItemAlertTitle,
            message: SharedResources.L10n.removeItemAlertMessage(itemName),
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

        viewController.present(alert, animated: true)
    }
}
