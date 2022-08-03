//
//  ViewController.swift
//  ToastPresenter
//
//  Created by FirstDo on 08/04/2022.
//  Copyright (c) 2022 FirstDo. All rights reserved.
//

import UIKit
import ToastPresenter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }

    @IBAction func didTapToastButton(_ sender: UIButton) {
        ToastView(message: "SimpleMessage")
            .setImage(UIImage(systemName: "checkmark.circle.fill"))
            .show(in: view, position: .bottom(constant: 30), holdingTime: 2, fadeAnimationDuration: 1)
    }
}

