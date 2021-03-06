//
//  HomeViewController.swift
//  Task
//
//  Created by Nrmeen Tomoum on 12/22/18.
//  Copyright (c) 2018 MobileNOC. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import FCAlertView
protocol HomeDisplayLogic: class
{
    func displayIndecator()
    func stopIndecator()
    func createAlert(title: String, subTitle: String)
    func displayListOfServers(viewModel: [Home.Server.ViewModel])
}

class HomeViewController: UIViewController, HomeDisplayLogic
{
    var isLoadingMore = false
    var  indexOfPage = 0
    var interactor: HomeBusinessLogic?
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
    var listOfServers : [Home.Server.ViewModel]?
    var viewLoader = loader ()
    @IBOutlet weak var tableView: UITableView!
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.rowHeight = Constants.ScreenSize.SCREEN_HEIGHT * 0.1
        
        tableView.register(UINib(nibName: "ServerTableViewCell", bundle: nil), forCellReuseIdentifier:"ServerTableViewCell" )
        getDataOfServers()
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func getDataOfServers()
    {
        let request = Home.Server.Request(page: self.indexOfPage ,size : 10)
        interactor?.getServersData(request: request)
    }
    
    func displayListOfServers(viewModel: [Home.Server.ViewModel])
    {
        //  isLoadingMore = viewModel.isL
        if listOfServers != nil
        {
            listOfServers?.append(contentsOf: viewModel)
        }
        else
        {
            listOfServers = viewModel
        }
        if viewModel.count > 0
        {
            isLoadingMore = viewModel[0].isLoadingMore
        }
        tableView.reloadData()
    }
    func createAlert(title: String, subTitle: String) {
        CAlert.createAlert(title: title, subTitle: subTitle,vc: self)
    }
    
    func displayIndecator()
    {
        viewLoader.startIndecator(self.view)
    }
    func stopIndecator()
    {
        viewLoader.stopIndecator(self.view)
    }
}
extension HomeViewController : UITableViewDelegate, UITableViewDataSource
{
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        let contentOffset = scrollView.contentOffset.y
        if !isLoadingMore && (maximumOffset - contentOffset) <= 100
        {
            self.indexOfPage = indexOfPage + 1
            getDataOfServers()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cindex = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServerTableViewCell", for: indexPath) as! ServerTableViewCell
        
        cell.configCell(serverName: listOfServers![cindex].name, ipAddress: listOfServers![cindex].ipAddress, deviceIPSubnetMask: listOfServers![cindex].deviceIPSubnetMask, status: listOfServers![cindex].status)
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list = listOfServers
        {
            return  list.count
        }
        else
        {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        interactor?.id =   displayedArtworks[indexPath.row].id
        //        router?.routeToBrowseArtWorkDetails()
    }
}
extension HomeViewController: FCAlertViewDelegate
{
    func fcAlertDoneButtonClicked(_ alertView: FCAlertView!) {
    }
    
}
