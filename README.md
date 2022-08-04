# ToastPresenter

[![CI Status](https://img.shields.io/travis/FirstDo/ToastPresenter.svg?style=flat)](https://travis-ci.org/FirstDo/ToastPresenter)
[![Version](https://img.shields.io/cocoapods/v/ToastPresenter.svg?style=flat)](https://cocoapods.org/pods/ToastPresenter)
[![SwiftPM](https://img.shields.io/badge/SPM-supported-DE5C43.svg?style=flat)](https://swift.org/package-manager/)
[![License](https://img.shields.io/cocoapods/l/ToastPresenter.svg?style=flat)](https://cocoapods.org/pods/ToastPresenter)
[![Platform](https://img.shields.io/cocoapods/p/ToastPresenter.svg?style=flat)](https://cocoapods.org/pods/ToastPresenter)

ToastPresenter is a very simple ToastMessage Presenter

## Example
![toastPresenterExample](https://user-images.githubusercontent.com/69573768/182770760-72997c85-442f-4337-b8a2-3dfe6a3a9371.gif)

## How To Use

```swift
ToastView(message: "HI! ToastPresenter is Very Simple!!", font: .preferredFont(forTextStyle: .largeTitle))
    .setImage(UIImage(systemName: "checkmark.circle.fill"))
    //.setTextColor(.white)
    //.setBackgroundColor(.black, alpha: 0.5)
    .show(in: self.view, position: .bottom(constant: 50), holdingTime: 2, fadeAnimationDuration: 2)
```

#### Functions

All the methods return ToastView, so it can be eaily chained and used declaratively

```swift
setImage(_ image: UIImage) -> ToastView
```

> Add an image to the left of the view

```swift
setTextColor(_ color: UIColor) -> ToastView
```

> Change text color

```swift
setBackgroundColor(_ color: UIColor, alpha: CGFloat) -> ToastView
```

> Change backgroundColor and alpha value

```swift
show(in: UIView, position: ToastView.Position, holdingTime: TimeInterval, fadeAnimationDuration: TimeInterval)

// position: determine autolayout
// holdingTime: determine how long you want to show on the view
// fadeAnimationDuration: determine the animation time when the ToastView disappears
```

> presentToastView on the view

## Requirements

- iOS 13.0 ~

## Installation

#### Swift Package Manager

- File > Swift Packages > Add Package Dependency
- Add "https://github.com/fistDO.ToastPresenter"

#### CocoaPods

ToastPresenter is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ToastPresenter'
```

## Author

FirstDo, whqtkf12@naver.com

## License

ToastPresenter is available under the MIT license. See the LICENSE file for more info.
