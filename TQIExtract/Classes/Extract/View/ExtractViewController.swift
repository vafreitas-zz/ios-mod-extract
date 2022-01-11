//
//  ExtractViewController.swift
//  DIOExtract
//
//  Created by Victor Freitas on 11/01/22.
//

import UIKit

open class ExtractViewController: UIViewController {

    // MARK: Outlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    
    var viewModel: ExtractViewModel
    let refreshControl = UIRefreshControl()
    
    // MARK: Initializer
    
    public init() {
        self.viewModel = .init()
        super.init(nibName: nil, bundle: nil)
    }
    
    init(viewModel: ExtractViewModel = .init()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        title = "Extrato"
        getTransactions()
        setupRefreshControl()
        setupTableView()
    }
    
    func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(getTransactions), for: .valueChanged)
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.addSubview(refreshControl)
        tableView.register(ExtractTransactionCell.self)
        tableView.reloadData()
    }
    
    @objc func getTransactions() {
        viewModel.getTransactions { [weak self] _ in
            guard let self = self else { return }
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
}

// MARK: UITableView Delegate

extension ExtractViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.model.transactions.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(of: ExtractTransactionCell.self, for: indexPath, configure: { [weak self] cell in
            guard let self = self else { return }
            let model = self.viewModel.model.transactions[indexPath.row]
            cell.setup(model)
        })
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        75.0
    }
}

