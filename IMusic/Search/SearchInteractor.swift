//
//  searchInteractor.swift
//  IMusic
//
//  Created by Дмитрий Рудаков on 21.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SearchBusinessLogic {
    func makeRequest(request: search.Model.Request.RequestType)
}

class SearchInteractor: SearchBusinessLogic {
    
    var networkService = NetworkService()
    var presenter: SearchPresentationLogic?
    var service: SearchService?
    
    func makeRequest(request: search.Model.Request.RequestType) {
        if service == nil {
            service = SearchService()
        }
        switch request {
        case .getTracks(let searchTerm):
            presenter?.presentData(response: .presentFooterView)
            networkService.fetchTracks(searchText: searchTerm) { [weak self] searchResponse in
                self?.presenter?.presentData(response: .presentTracks(searchResponse: searchResponse))
            }
        }
        
    }
    
}
