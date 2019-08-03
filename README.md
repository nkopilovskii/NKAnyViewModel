# NKAnyViewModel

<!-- [![CI Status](https://img.shields.io/travis/nkopilovskii/NKAnyViewModel.svg?style=flat)](https://travis-ci.org/nkopilovskii/NKAnyViewModel) -->
[![Version](https://img.shields.io/cocoapods/v/NKAnyViewModel.svg?style=flat)](https://cocoapods.org/pods/NKAnyViewModel)
[![License](https://img.shields.io/cocoapods/l/NKAnyViewModel.svg?style=flat&color=yellow)](https://cocoapods.org/pods/NKAnyViewModel)
[![Platform](https://img.shields.io/cocoapods/p/NKAnyViewModel.svg?style=flat&color=black)](https://cocoapods.org/pods/NKAnyViewModel)

## Description

/Users/nkopilovskii/Documents/Pods/NKAnyViewModel/Example/NKAnyViewModelThis solution can be used as a stand-alone view configuration tool, or as an element of the configuration mechanism of composite visual components (for example, `UITableView`)


The purpose of this solution:
1. To structure the program code by dividing the levels of **View** and **Logic**
2. The ability to use one View in different contexts without changing the View's source code
3. Providing a single interface for the configuration of Views and ViewModels


## Interface

### Protocol `NKAnyViewModel`

Basic protocol describes the basic instructions mechanism View configuration

```swift 
  public protocol NKAnyViewModel {
 
    //Type of configurable view
    static var viewAnyType: UIView.Type { get }
    
    //View configurating
    func setupAny(view: UIView)
}
```

### Protocol `NKViewModel`

The protocol inherits the basic protocol `NKAnyViewModel` instructions; describes the association of a ViewModel type with a View type

This solution offers a basic implementation of the properties and methods of the `NKAnyViewModel` protocol

```swift 
  public protocol NKViewModel: NKAnyViewModel {
    associatedtype ViewType: UIView
    func setup(view: ViewType)
  }

  //NKViewModel base implementation
  public extension NKViewModel {
    static var viewAnyType: UIView.Type {
      return ViewType.self
    }

    func setupAny(view: UIView) {
      if let view = view as? ViewType {
        setup(view: view)
      }
    }
  }
```

## Example

1. Create custom view type with components for data display

```swift
  class CustomView: UIView {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var lblBody: UILabel!
  }
```

2. Create ViewModel which implements the protocol

```swift
  class SomeViewModel: NKViewModel {
    func setup(view: CustomView) {}
  }
```

3. Configurate view at `func setup(view:)`
```swift
  func setup(view: CustomView) {
    view.lblTitle.text = String(describing: type(of: view))
    view.lblSubtitle.text = String(describing: type(of: self))
    view.lblBody.text = """
      This view configurated by view model
  
      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
  """
  }
```

4. Add custom view to view controller

```swift
  class ViewController: UIViewController {

    @IBOutlet weak var customView: CustomView!
    
  }
```

5. Init ViewModel

```swift
  class ViewController: UIViewController {

    @IBOutlet weak var customView: CustomView!
    
    var viewModel = SomeViewModel()

  }
```

6. Pass view to the method `setup(view:)` for configuration

```swift
  class ViewController: UIViewController {

    @IBOutlet weak var customView: CustomView!

    var viewModel = SomeViewModel()
    
    ...
      viewModel.setup(view: customView)
    ...

}
```

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation

NKAnyViewModel is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NKAnyViewModel'
```

## Requirements

**iOS** 10.0

## Author

Nick Kopilovskii, nkopilovskii@gmail.com

## License

NKAnyViewModel is available under the MIT license. See the LICENSE file for more info.
