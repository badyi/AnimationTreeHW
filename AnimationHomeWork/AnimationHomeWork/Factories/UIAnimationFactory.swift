//
//  UIAnimationFactory.swift
//  AnimationHomeWork
//
//  Created by badyi on 28.05.2021.
//

import UIKit

enum AnimationType {
    case minusY
    case plusY
}

final class UIAnimationFactory {
    func makeOpacityAnimation(from: Float, to: Float, duration: Float) -> CABasicAnimation {
        let animationOpacity = CABasicAnimation(keyPath: "opacity")
        animationOpacity.fromValue = from
        animationOpacity.toValue = to
        animationOpacity.duration = CFTimeInterval(duration)
        animationOpacity.autoreverses = false
        animationOpacity.isRemovedOnCompletion = false
        animationOpacity.fillMode = .forwards
        return animationOpacity
    }
    
    func makeChangePositionAnimation(x: CGFloat, y: CGFloat, type: AnimationType, max: CGFloat ,duration: Double, step: CGFloat) -> CAKeyframeAnimation {
        let changePositionAnimation = CAKeyframeAnimation(keyPath: "position")
        var path: [[CGFloat]]
        
        switch type {
        case .minusY:
            path = minusY(x, y, step, max)
        case .plusY:
            path = plusY(x, y, step, max)
        }
        
        changePositionAnimation.values = path
        changePositionAnimation.duration = duration
        return changePositionAnimation
    }
    
    func minusY (_ x: CGFloat, _ y: CGFloat, _ step: CGFloat, _ maxDown: CGFloat) -> [[CGFloat]] {
        var pathArray = [[CGFloat]]()
        var subtrahend: CGFloat = 0;
        while (subtrahend - step < maxDown) {
            pathArray.append([x, y - subtrahend])
            subtrahend += step
        }
        return pathArray
    }
    
    func plusY (_ x: CGFloat, _ y: CGFloat, _ step: CGFloat, _ maxUp: CGFloat) -> [[CGFloat]] {
        var pathArray = [[CGFloat]]()
        var term: CGFloat = 0;
        while(term < maxUp) {
            pathArray.append([x, y + term])
            term += step
        }
        return pathArray
    }
}
