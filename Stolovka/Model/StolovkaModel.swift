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
            let searchBarItem = SearchBarModel(searchBarString: L10n.Localized.searchBarMessage, searchBarSymbol: SFSymbol.sliderHorizontal)
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
}

    
//MARK: - CellItems
class GreetingModel: CellItem {
    
    var cellItemType: CellItemType {
        return .greeting
    }
    var userName: String
    var qouteOfTheDay: String
    var usernameGreeting: String
    
    init(name: String, qouteOfTheDay: String) {
        self.userName = name
        self.usernameGreeting = L10n.Localized.standardGreeting(name)
        self.qouteOfTheDay = qouteOfTheDay
    }
}

class SearchBarModel: CellItem {
    
    var cellItemType: CellItemType {
        return .searchBar
    }
    
    var searchBarString: String
    var searchBarSymbol: SFSymbolRepresentable
    
    init(searchBarString: String, searchBarSymbol: SFSymbolRepresentable) {
        self.searchBarString = searchBarString
        self.searchBarSymbol = searchBarSymbol
    }
}

class CollectionModel {
    
}
