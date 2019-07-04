//
//  ViewController.swift
//  NKAnyViewModel
//
//  Created by Nick Kopilovskii on 07/01/2019.
//  Copyright (c) 2019 Nick Kopilovskii. All rights reserved.
//

import UIKit


//MARK: ViewController
class ViewController: UIViewController {
  
  @IBOutlet weak var customView: CustomView!
  
  var viewModel = SomeViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel.setup(view: customView)
  }

}

