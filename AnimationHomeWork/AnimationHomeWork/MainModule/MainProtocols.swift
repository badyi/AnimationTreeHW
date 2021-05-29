//
//  MainProtocols.swift
//  AnimationHomeWork
//
//  Created by badyi on 29.05.2021.
//

import Foundation

protocol GrowingTreeViewProtocol: AnyObject {
    func configView()
    func animateGrowingSproutFlowersAndGrass()
    func animateTrunk()
    func animateBrunches()
    func animateLeaves()
    func animateSun()
    func animateStartButton()
    func showRestoreButton()
    func didLayoutSubviews()
}

protocol MainViewControllerProtocol: AnyObject {
    func startButtonTapped()
    func restoreButtonTapped()
}
