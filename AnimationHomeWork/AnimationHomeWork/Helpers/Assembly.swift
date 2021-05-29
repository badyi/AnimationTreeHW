//
//  Assembly.swift
//  AnimationHomeWork
//
//  Created by badyi on 29.05.2021.
//

import Foundation

final class MainAssembly {
    static func createMainModule() -> MainViewController {
        let view = GrowingTreeView()
        let controller = MainViewController(with: view)
        view.controller = controller
        return controller
    }
}
