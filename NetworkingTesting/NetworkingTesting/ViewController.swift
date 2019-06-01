//
//  ViewController.swift
//  NetworkingTesting
//
//  Created by Robert Taylor-Anderson on 5/23/19.
//  Copyright © 2019 Robert Taylor-Anderson. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var listOfHolidays = [HolidayDetail](){
        didSet {
            DispatchQueue.main.async {
                //self.tableView.reloadData()
                self.navigationItem.title = "\(self.listOfHolidays.count)  Holidays found"
                
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        searchBar.delegate = self as UISearchBarDelegate
    }
        
       func numberOfSections(in tableView: UITableView, numberOfRowsInSection section: Int)-> Int{
            return 1
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int {
        return listOfHolidays.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let holiday = listOfHolidays[indexPath.row]
        
        cell.textLabel?.text = holiday.name
        cell.detailTextLabel?.text = holiday.date.iso
        
        return cell
    }
        
        
        
}

extension ViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        
        guard let searchBarText = searchBar.text else {return}
        let holidayRequest = HolidayRequest(countryCode: searchBarText)
        holidayRequest.getHolidays {[weak self] result in
            switch result{
            case .failure(let error):
                print(error)
            case .success(let holidays):
                self?.listOfHolidays = holidays
            }
        }
        
    }
}
