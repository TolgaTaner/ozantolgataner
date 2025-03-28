//
//  MockHomeViewModel.swift
//  OzanSuperAppTests
//
//  Created by Tolga Taner on 28.03.2025.
//

import Foundation
@testable import OzanSuperApp

final class MockHomeViewModel: HomeViewModelDelegate {

    var invokedFetchedCoinsSuccessfully = false
    var invokedFetchedCoinsSuccessfullyCount = 0

    func fetchedCoinsSuccessfully() {
        invokedFetchedCoinsSuccessfully = true
        invokedFetchedCoinsSuccessfullyCount += 1
    }

    var invokedFetchedCoinsFailed = false
    var invokedFetchedCoinsFailedCount = 0
    var invokedFetchedCoinsFailedParameters: (error: Error, Void)?
    var invokedFetchedCoinsFailedParametersList = [(error: Error, Void)]()

    func fetchedCoinsFailed(_  error: Error) {
        invokedFetchedCoinsFailed = true
        invokedFetchedCoinsFailedCount += 1
        invokedFetchedCoinsFailedParameters = (error, ())
        invokedFetchedCoinsFailedParametersList.append((error, ()))
    }

    var invokedFilterDidFinished = false
    var invokedFilterDidFinishedCount = 0
    var invokedFilterDidFinishedParameters: (type: HomeViewModel.SortType, Void)?
    var invokedFilterDidFinishedParametersList = [(type: HomeViewModel.SortType, Void)]()

    func filterDidFinished(_ type: HomeViewModel.SortType) {
        invokedFilterDidFinished = true
        invokedFilterDidFinishedCount += 1
        invokedFilterDidFinishedParameters = (type, ())
        invokedFilterDidFinishedParametersList.append((type, ()))
    }

    var invokedConfigureAfterViewDidLoad = false
    var invokedConfigureAfterViewDidLoadCount = 0

    func configureAfterViewDidLoad() {
        invokedConfigureAfterViewDidLoad = true
        invokedConfigureAfterViewDidLoadCount += 1
    }

    var invokedConfigureAfterViewWillAppear = false
    var invokedConfigureAfterViewWillAppearCount = 0

    func configureAfterViewWillAppear() {
        invokedConfigureAfterViewWillAppear = true
        invokedConfigureAfterViewWillAppearCount += 1
    }
}
