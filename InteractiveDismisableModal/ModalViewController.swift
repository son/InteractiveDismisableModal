//
//  ModalViewController.swift
//  InteractiveDismisableModal
//
//  Created by Takeru Sato on 2019/03/16.
//  Copyright © 2019 son. All rights reserved.
//

import UIKit

final class ModalViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panned)))
    }
    
    @objc private func panned(gesture: UIPanGestureRecognizer) {
        weak var navi = navigationController as? ModalNavigationController
        navi?.handleGesture(sender: gesture)
    }
}
