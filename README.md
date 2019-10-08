# PullToDismiss
PullToDismiss provides dismiss modal viewcontroller function like Facebook Messenger by pulling scrollview or navigationbar with smooth and rich background effect.  

[![GitHub release](https://img.shields.io/github/release/sgr-ksmt/PullToDismiss.svg)](https://github.com/Sam-Spencer/PullToDismiss/releases)
![Language](https://img.shields.io/badge/language-Swift%205.0-orange.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods](https://img.shields.io/badge/Cocoa%20Pods-✓-4BC51D.svg?style=flat)](https://cocoapods.org/pods/PullToDismiss)

|            sample            |            blur sample            |
| :--------------------------: | :-------------------------------: |
| ![gif](Documents/sample.gif) | ![gif](Documents/blur_sample.gif) |


> [Appetize.io Demo](https://appetize.io/app/hett44vca458r9artkbq0awxrc?device=iphone7&scale=75&orientation=portrait&osVersion=10.0)

## Features
- Supports all types of scrolling views:  
  - UIScrollView  
  - UITableView  
  - UICollectionView  
  - UIWebView  
  - WKWebView  
- Customizable:  
  - Dismiss background color  
  - Alpha and blur strength  
  - Height percentage for auto-dismiss  
- Available in UIViewController and UINavigationController  
- Automatically adds pan gesture to the navigation bar  
- Blur effect support  

## Usage
### Getting Started
(1) Setup `PullToDismiss`

```swift
import PullToDismiss

class SampleViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private var pullToDismiss: PullToDismiss?
    override func viewDidLoad() {
        super.viewDidLoad()
        pullToDismiss = PullToDismiss(scrollView: tableView)
    }
}
```

(2) Create view controller and set `modalPresentationStyle`. Then present view controller

```swift
let vc = SampleViewController()
let nav = UINavigationController(rootViewController: vc)
nav.modalPresentationStyle = .overCurrentContext

self.present(nav, animated: true, completion: nil)
```

### Use `(UIScrollView|UITableView|UICollectionView)Delegate`

You can use all scroll view's delegate by set `pullToDismiss.delegate`.

```swift
import PullToDismiss

class SampleViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private var pullToDismiss: PullToDismiss?
    override func viewDidLoad() {
        super.viewDidLoad()
        pullToDismiss = PullToDismiss(scrollView: tableView)
        pullToDismiss?.delegate = self
    }
}

extension SampleViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // ...
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // ...
    }
}
```

### Customize
You can customize `backgroundEffect`, `dismissableHeightPercentage:`

#### Shadow background effet

- background (default: `ShadowEffect.default`, [color: black, alpha: 0.8])

![img1](Documents/img1.png)

```swift
pullToDismiss?.background = ShadowEffect(color: .red, alpha: 0.5) // color: red, alpha: 0.5
```

#### Blur background effect
New feature for v1.0.

![gif](Documents/blur_sample.gif)

```swift
// preset blur (.extraLight, .light, .dark)
pullToDismiss?.background = BlurEffect.extraLight

// set custom Blur
pullToDismiss?.background = BlurEffect(color: .red, alpha: 0.5, blurRadius: 40.0, saturationDeltaFactor: 1.8)
```

#### dismissableHeightPercentage

![img2](Documents/img2.png)


```swift
// to pull half size of view controller, dismiss view controller.
pullToDismiss?.dismissableHeightPercentage = 0.5
```


## Requirements
- iOS 11.0+
- Xcode 11.0+
- Swift 5.0+

## Installation

### Swift Package Manager
Add the following in Xcode's Swift Package Manager and specify at least v2.3.0

    https://github.com/Sam-Spencer/PullToDismiss.git
    
    
### Carthage

- Add the following to your *Cartfile*:

```bash
github "sgr-ksmt/PullToDismiss"
```

- Run `carthage update`
- Add the framework as described.

> Details: [Carthage Readme](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application)


### CocoaPods

**PullToDismiss** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PullToDismiss', '~> 2.2'
```

Then, run `pod install`.

### Manually Install
Download all `*.swift` files and put your project.
