//
//  ItemListViewController.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 12/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

final class ItemsListViewController: BaseViewController, ItemsListView {

    //controller handler
    var onItemSelect: ((Item) -> ())?
    var onCreateItem: (() -> Void)?
    var onLogout: (() -> Void)?

    @IBAction func addItemButtonClicked(_ sender: UIBarButtonItem) { onCreateItem?() }
    @IBAction func logoutButtonClicked(_ sender: UIBarButtonItem) { onLogout?() }

    @IBOutlet weak var tableView: UITableView!
    //mock datasource
    var items = (0...10).map { index in return Item(title: "Item № \(index)", subtitle: "Item descripton") }
    var authCheck = false

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Items"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(ItemsListViewController.addItemButtonClicked(_:))
        )

        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .trash,
            target: self,
            action: #selector(ItemsListViewController.logoutButtonClicked(_:))
        )
    }
}

extension ItemsListViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let cell = UITableViewCell()
        let item = items[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.subtitle
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onItemSelect?(items[(indexPath as NSIndexPath).row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
