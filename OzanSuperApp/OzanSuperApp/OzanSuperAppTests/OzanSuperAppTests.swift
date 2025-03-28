//
//  OzanSuperAppTests.swift
//  OzanSuperAppTests
//
//  Created by Tolga Taner on 18.03.2025.
//

import Testing
@testable import OzanSuperApp

struct OzanSuperAppTests {
    
    private let viewModel = HomeViewModel()
    private let mocked = MockHomeViewModel()
        
    @Test func test_ViewDidLoadIsCalled_ConfigureShouldBeInvoked() async throws {
        
        viewModel.setDelegate(mocked)
        #expect(mocked.invokedConfigureAfterViewDidLoad == false)
        #expect(mocked.invokedConfigureAfterViewDidLoadCount == 0)
        
        viewModel.viewDidLoad()
        
        #expect(mocked.invokedConfigureAfterViewDidLoad == true)
        #expect(mocked.invokedConfigureAfterViewDidLoadCount == 1)
    }
    
    @Test func test_ViewWillAppearIsCalled_ConfigureShouldBeInvoked() async throws {
        viewModel.setDelegate(mocked)
        
        #expect(mocked.invokedConfigureAfterViewWillAppear == false)
        #expect(mocked.invokedConfigureAfterViewWillAppearCount == 0)
        
        viewModel.viewWillAppear()
        #expect(mocked.invokedConfigureAfterViewWillAppear == true)
        #expect(mocked.invokedConfigureAfterViewWillAppearCount == 1)
    }

}

