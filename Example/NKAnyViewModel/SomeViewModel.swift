//
//  SomeViewModel.swift
//  NKAnyViewModel_Example
//
//  Created by Nick Kopilovskii on 7/4/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import NKAnyViewModel

//MARK: SomeViewModel
class SomeViewModel: NKViewModel {
  func setup(view: CustomView) {
    view.lblTitle.text = String(describing: type(of: view))
    view.lblSubtitle.text = String(describing: type(of: self))
    view.lblBody.text = """
    This view configurated by view model
    
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    """
  }
}
