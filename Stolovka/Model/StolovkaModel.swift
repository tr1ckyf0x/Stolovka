//
//  StolovkaModel.swift
//  Stolovaya5
//
//  Created by Nikita Shvad on 02.01.2022.
//

import Foundation
import UIKit

enum CellItemType {
    case greeting
    case searchBar
    case productCollection
}

protocol CellItem {
    var cellItemType: CellItemType { get }
    var rowCount: Int { get }
    var sectionTitle: String { get }
    
}

extension CellItem {
    var rowCount: Int {
        return 1
    }
}

class StolovkaViewModel: NSObject {
    var items = [CellItem]()
    let response = UserData()
    
    override init (){
        guard let profile = MainMenuResponseModel.init(stringNameFunction: response.returnUserName(), stringQouteFunction: response.returnQouteOfTheDay(), doesContainSearchBar: response.returnSearchBar()) else { return }
        
        if let name = profile.userName, let qoute = profile.qouteOfTheDay {
            let greetingModelItem = GreetingModel(name: name, qouteOfTheDay: qoute)
            items.append(greetingModelItem)
        }

        if let _ = profile.doesContainSearchBar {
            let searchBarItem = SearchBarModel(searchBarString: constants.searchBarMessage, searchBarSettingImageString: constants.searchBarImageString)
            items.append(searchBarItem)
        }
        
    }
}

//MARK: - UITableViewDataSource

extension StolovkaViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        switch item.cellItemType {
            
        case .greeting:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "\(GreetingCell.self)", for: indexPath) as? GreetingCell {
                cell.item = item
                return cell
            }
        case .searchBar:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "\(SearchBarCell.self)", for: indexPath) as? SearchBarCell {
                cell.item = item
                return cell
            }
            
        case .productCollection:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
        if constants.tableViewAllowsHeaderNames {
        return items[section].sectionTitle
    }
        return nil
    }
}

    
//MARK: - CellItems
class GreetingModel: CellItem {
    
    var sectionTitle: String {
        return "Приветствие Клекта"
    }
    
    var cellItemType: CellItemType {
        return .greeting
    }
    var userName: String?
    var qouteOfTheDay: String?
    var usernameGreeting: String?
    
    init (name: String, qouteOfTheDay: String) {
        self.userName = name
        self.usernameGreeting = "\(constants.standardGreeting) \(name)!"
        self.qouteOfTheDay = qouteOfTheDay
    }
}

class SearchBarModel: CellItem {
    
    var cellItemType: CellItemType {
        return .searchBar
    }
    var sectionTitle: String {
        return "Поисковая клетка"}
    
    var searchBarString: String?
    var searchBarSettingImageString: String?
    
    init(searchBarString: String, searchBarSettingImageString: String) {
        self.searchBarString = searchBarString
        self.searchBarSettingImageString = searchBarSettingImageString
    }
}

class CollectionModel {
    
}
