//
//
//Copyright (c) 2019 Nick Kopilovskii <nkopilovskii@gmail.com>
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.
//
//  AnyViewModel.swift
//
//  Created by Nick Kopilovskii on 7/4/19.
//  Copyright © 2019 Nick Kopilovskii. All rights reserved.
//

import UIKit

//MARK: - NKAnyViewModel protocol
public protocol NKAnyViewModel {
  static var viewAnyType: UIView.Type { get }
  func setupAny(view: UIView)
}
//MARK: -

//MARK: - NKViewModel protocol
public protocol NKViewModel: NKAnyViewModel {
  associatedtype ViewType: UIView
  func setup(view: ViewType)
}
//MARK: -

//MARK: - NKViewModel base implementation
public extension NKViewModel {
  static var viewAnyType: UIView.Type {
    return ViewType.self
  }
  
  func setupAny(view: UIView) {
    if let view = view as? ViewType {
      setup(view: view)
    } else {
      //TODO: Handle this
      assertionFailure("Error: \(#function) \(#file) \(#line)")
    }
  }
}
//MARK: -
