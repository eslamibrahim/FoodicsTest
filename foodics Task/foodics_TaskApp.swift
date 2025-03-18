//
//  foodics_TaskApp.swift
//  foodics Task
//
//  Created by islam Awaad on 16/03/2025.
//

import SwiftUI
import AppFlow

@main
struct MoviesApp: App {

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().compactScrollEdgeAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RecipsView<RecipesListViewModel>(
                    viewModel: RecipesListViewModelFactory().viewModel()
                )
            }
        }
    }
}

extension UINavigationController: UINavigationControllerDelegate {

    open override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
    }
    
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.backButtonTitle = " "
    }
}
