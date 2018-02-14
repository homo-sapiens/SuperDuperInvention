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
    private let refreshControl = UIRefreshControl()

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
        tableView.register(UINib(nibName: "\(ItemTableViewCell.self)", bundle: Bundle.main),
                           forCellReuseIdentifier: "\(ItemTableViewCell.self)")

        tableView.insertSubview(refreshControl, at: 0)
        refreshControl.sendActions(for: .valueChanged)

    }

    private func setupBindings() {
        guard let viewModel = itemListViewModel else {
            return
        }


//        viewModel.items.asObservable()
//            .bind(to: tableView.rx.items(cellIdentifier: "ItemTableViewCell", cellType: ItemTableViewCell.self)) { (row, item, cell) in
//                cell.setName(item.title + " AND " + item.subtitle)
//            }
//            .disposed(by: disposeBag)

//        tableView.rx
//            .modelSelected(Item.self)
//            .subscribe(onNext:  { [weak self] value in
//               print("Cell selected")
//                //self?.onItemSelect?(value)
//                self?.itemListViewModel?.updateItems()
//            })
//            .disposed(by: disposeBag)


        // View Model outputs to the View Controller
        viewModel.items.asObservable()
            .do(onNext: { [weak self] _ in self?.refreshControl.endRefreshing() })
            .bind(to: tableView.rx.items(cellIdentifier: "ItemTableViewCell", cellType: ItemTableViewCell.self)) { [weak self] (row, item, cell) in
                cell.setName(item.title + " AND " + item.subtitle)
            }
            .disposed(by: disposeBag)

        viewModel.title
            .bind(to: navigationItem.rx.title)
            .disposed(by: disposeBag)

        // View Controller UI actions to the View Model
        refreshControl.rx.controlEvent(.valueChanged)
            .bind(to: viewModel.reload)
            .disposed(by: disposeBag)

        tableView.rx.modelSelected(Item.self)
            .bind(to: viewModel.selectItem)
            .disposed(by: disposeBag)


    }
}

