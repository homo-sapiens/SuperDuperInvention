//
//  ItemListViewController.swift
//  SuperDuperInvention
//
//  Created by Denis Moskalenko on 12/02/2018.
//  Copyright © 2018 PunicApp. All rights reserved.
//

final class ItemsListViewController: BaseViewController, ItemsListView, ItemListViewInput {

    //MARK: ItemsListView
    var onItemSelect: ((Item) -> ())?
    var onCreateItem: (() -> Void)?
    var onLogout: (() -> Void)?

    //MARK: ItemListViewInput
    var itemListViewModel: ItemListViewModel?


    @IBAction func addItemButtonClicked(_ sender: UIBarButtonItem) { onCreateItem?() }
    @IBAction func logoutButtonClicked(_ sender: UIBarButtonItem) { onLogout?() }

    @IBOutlet private weak var tableView: UITableView!

    let disposeBag = DisposeBag()

    var authCheck = false

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupBindings()
        
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

    private func setupUI() {
        title = itemListViewModel?.title.value
        tableView.register(UINib(nibName: "\(ItemTableViewCell.self)", bundle: Bundle.main),
                           forCellReuseIdentifier: "\(ItemTableViewCell.self)")
    }

    private func setupBindings() {
        guard let viewModel = itemListViewModel else {
            return
        }

        viewModel.items
            .bind(to: tableView.rx.items(cellIdentifier: "ItemTableViewCell", cellType: ItemTableViewCell.self)) { (row, item, cell) in
                cell.setName(item.title + " AND " + item.subtitle)
            }
            .disposed(by: disposeBag)

        tableView.rx
            .modelSelected(Item.self)
            .subscribe(onNext:  { [weak self] value in
               print("Cell selected")
                self?.onItemSelect?(value)
            })
            .disposed(by: disposeBag)


    }
}

