//
//  ProductsViewController.swift
//  Example
//
//  Created by Adam Campbell on 1/7/20.
//  Copyright © 2020 Afterpay. All rights reserved.
//

import Foundation
import UIKit

final class ProductsViewController: UITableViewController {

  private var products: [ProductDisplay] = []
  private let cellIdentifier = String(describing: ProductCell.self)
  private let eventHandler: (Event) -> Void

  enum Event {
    case productEvent(ProductCell.Event)
  }

  init(eventHandler: @escaping (Event) -> Void) {
    self.eventHandler = eventHandler

    super.init(nibName: nil, bundle: nil)

    tableView.register(ProductCell.self, forCellReuseIdentifier: cellIdentifier)
  }

  func update(products: [ProductDisplay]) {
    self.products = products
    tableView.reloadData()
  }

  // MARK: UITableViewDataSource

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    products.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! ProductCell
    let product = products[indexPath.row]
    cell.configure(with: product) { [unowned self] in self.eventHandler(.productEvent($0)) }
    return cell
  }

  // MARK: Unavailable

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
