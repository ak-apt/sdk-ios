//
//  Afterpay.swift
//  Afterpay
//
//  Created by Adam Campbell on 17/6/20.
//  Copyright © 2020 Afterpay. All rights reserved.
//

import Foundation
import UIKit

public enum Afterpay {

  /// Present Afterpay Checkout modally over the specified view controller loading your
  /// generated checkout URL.
  /// - Parameters:
  ///   - viewController: The viewController on which `UIViewController.present` will be called.
  ///   The Afterpay Checkout View Controller will be presented modally over this view controller
  ///   or it's closest parent that is able to handle the presentation.
  ///   - checkoutUrl: The checkout URL to load generated via the /checkouts endpoint on the
  ///   Afterpay backend.
  ///   - animated: Pass true to animate the presentation; otherwise, pass false.
  ///   - completion: The block executed after the user has completed the checkout.
  ///   - result: The result of the user's completion (a success or cancellation).
  public static func presentCheckoutModally(
    over viewController: UIViewController,
    loading checkoutUrl: URL,
    animated: Bool = true,
    completion: @escaping (_ result: CheckoutResult) -> Void
  ) {
    let checkoutViewController = WebViewController(
      checkoutUrl: checkoutUrl,
      completion: completion
    )

    viewController.present(checkoutViewController, animated: animated, completion: nil)
  }

}
