//
//  ExtractViewController.swift
//  DIOExtract
//
//  Created by Victor Freitas on 11/01/22.
//

import UIKit

open class ExtractListViewController: BaseViewController {

    // MARK: Outlet
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    // MARK: Properties
    
    var viewModel: ExtractListViewModel
    let refreshControl = UIRefreshControl()
    
    // MARK: Initializer
    
    public init() {
        self.viewModel = .init()
        super.init(nibName: nil, bundle: nil)
    }
    
    init(viewModel: ExtractListViewModel = .init()) {
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
        navBarHidden = false
        setupRefreshControl()
        setupTableView()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getTransactions()
    }
    
    // MARK: Setup
    
    func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(getTransactionsRefresh), for: .valueChanged)
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.addSubview(refreshControl)
        tableView.register(ExtractTransactionCell.self)
    }
    
    func isLoading(_ loading: Bool) {
        indicatorView.isHidden = !loading
        loading ? indicatorView.startAnimating() : indicatorView.stopAnimating()
    }
    
    // MARK: API Methods
    
    @objc func getTransactionsRefresh() {
        getTransactions(showLoading: false)
    }
    
    func getTransactions(showLoading: Bool = true) {
        isLoading(showLoading)
        viewModel.getTransactions { [weak self] _ in
            guard let self = self else { return }
            self.isLoading(false)
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
}

// MARK: UITableView Delegate & DataSource

extension ExtractListViewController: UITableViewDelegate, UITableViewDataSource {
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
        80.0
    }
}

