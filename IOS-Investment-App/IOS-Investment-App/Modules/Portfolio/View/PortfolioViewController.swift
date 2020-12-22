//
//  PortfolioViewController.swift
//  IOS-Investment-App
//
//  Created by enki corbin on 01/12/2020.
//  Copyright (c) 2020 enki corbin. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class PortfolioViewController: UIViewController {

    // MARK: - Public properties -

    @IBOutlet weak var transactionsCollectionView: UICollectionView!
    @IBOutlet weak var currentInvestmentsTableView: UITableView!
    @IBOutlet weak var walletBalanceLabel: UILabel!
    var presenter: PortfolioPresenterInterface!
    
    var coins: [CoinBoughtEntity] = []
    var transactionCoins: [TransactionEntity] = []
    
    var loadingViewCurrentInvestments: LoadingView?

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoadingCurrentinvestmentsView()
        
        transactionsCollectionView.delegate = self
        transactionsCollectionView.dataSource = self
        currentInvestmentsTableView.delegate = self
        currentInvestmentsTableView.dataSource = self
        
        walletBalanceLabel.text = presenter.getMoneyWallet() + " $"
        
        presenter.getTransactions()
        presenter.getBoughtCoinsInfos()
    }

    override func viewWillAppear(_ animated: Bool) {
    }

    @IBAction func addMoneyClick(_ sender: Any) {
        
        let msg = Bundle.main.localizedString(forKey: "addMoneyToWallet", value: "Add money to your wallet", table: "Localizable")
        Alert.showMoneyInput(animName: "money", message: msg, controller: self, completionHandler: addMoneyCompletionHandler)
        
    }
    
    func setupLoadingCurrentinvestmentsView() {
        loadingViewCurrentInvestments = LoadingView(parentViewFrame: currentInvestmentsTableView.frame, navigationControllerHeight: (navigationController?.navigationBar.frame.height ?? 0))
        currentInvestmentsTableView.addSubview(loadingViewCurrentInvestments!)
        loadingViewCurrentInvestments?.showIndicator()
        currentInvestmentsTableView.separatorStyle = .none
    }
    
    private func addMoneyCompletionHandler(amount: String) {
        
        presenter.storeMoneyWallet(add: amount)
        
    }
}

// MARK: - Extensions -

extension PortfolioViewController: PortfolioViewInterface {
    
    func updateCoinsView(coins: [CoinBoughtEntity]) {
        self.coins = coins
        currentInvestmentsTableView.reloadData()
        loadingViewCurrentInvestments?.hideIndicator()
                
        if self.coins.count == 0 {
            let noTransactionsLabel = UILabel()
            
            noTransactionsLabel.text = "You have no current investments"
            noTransactionsLabel.textColor = .systemGray
            
            currentInvestmentsTableView.backgroundView = noTransactionsLabel
        } else {
            currentInvestmentsTableView.separatorStyle = .singleLine
            currentInvestmentsTableView.backgroundView = nil
        }
    }
    
    func updateTransactionsView(transactions: [TransactionEntity]) {
        self.transactionCoins = transactions
        transactionsCollectionView.reloadData()
        
        if transactions.count == 0 {
            let noTransactionsLabel = UILabel()
            
            noTransactionsLabel.text = "You have not sell any coin"
            noTransactionsLabel.textColor = .systemGray
            
            transactionsCollectionView.backgroundView = noTransactionsLabel
        } else {
            transactionsCollectionView.backgroundView = nil
        }
    }
    
    func storeMoneyWalletCallback(success: Bool, walletBalance: Int) {
        if success {
            Toast.show(message: "You now have \(walletBalance) $ on your wallet", controller: self, type: "success", toastDuration: 2)
            walletBalanceLabel.text = String(walletBalance) + "$"
        } else {
            Toast.show(message: "Invalid amount", controller: self, type: "danger", toastDuration: 2)
        }
    }
    
}

extension PortfolioViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentInvestmentsCell", for: indexPath) as? PortfolioCurrentInvestmentsCell {
            
            cell.coinNameLabel.text = coins[indexPath.row].symbol
            cell.coinImage.image = UIImage(data: coins[indexPath.row].iconData ?? Data())
            if coins[indexPath.row].profits != nil {
                cell.coinExchangeValueLabel.text = String(format: "%.1f", coins[indexPath.row].profits!) + " $"
                
                if coins[indexPath.row].profits! <= -0.1 {
                    cell.coinExchangeValueLabel.textColor = .systemRed
                } else if coins[indexPath.row].profits! >= 0.1 {
                    cell.coinExchangeValueLabel.textColor = .systemGreen
                } else {
                    cell.coinExchangeValueLabel.textColor = .systemGray
                }
            } else {
                cell.coinExchangeValueLabel.text = "NaN"
                cell.coinExchangeValueLabel.textColor = .black
            }
                        
            return cell
        }
        
        return UITableViewCell()
    }
    
}

extension PortfolioViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return transactionCoins.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = transactionsCollectionView.dequeueReusableCell(withReuseIdentifier: "TransactionsCell", for: indexPath) as? PortfolioTransactionCell {
            
            cell.coinImage.image = UIImage(data: transactionCoins[indexPath.row].iconData ?? Data())
            cell.coinNameLabel.text = transactionCoins[indexPath.row].name
            cell.profitsLabel.text = String(format: "%.1f", transactionCoins[indexPath.row].usdProfits) + " $"
            if transactionCoins[indexPath.row].usdProfits <= -0.1 {
                cell.profitsLabel.textColor = .systemRed
            } else if transactionCoins[indexPath.row].usdProfits >= 0.1 {
                cell.profitsLabel.textColor = .systemGreen
            } else {
                cell.profitsLabel.textColor = .systemGray
            }
        
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: transactionsCollectionView.frame.height, height: transactionsCollectionView.frame.height)
    }
        
}