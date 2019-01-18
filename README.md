![](https://github.com/pedrommcarrasco/Constrictor/blob/master/cover.jpg?raw=true)

> **Constrict** *(/ˈkənˈstrɪkt/)*, *verb*
>
> "... to make something become tighter and narrower:"

Constrict your Auto Layout code with **Constrictor**, your chainable sugar.

<p align="center">
    <img src="https://github.com/pedrommcarrasco/Constrictor/blob/master/presentation.gif?raw=true" alt="Presentation" width="100%"/>
</p>

[![Build Status](https://travis-ci.org/pedrommcarrasco/Constrictor.svg?branch=master)](https://travis-ci.org/pedrommcarrasco/Constrictor) 
[![codecov](https://codecov.io/gh/pedrommcarrasco/Constrictor/branch/master/graph/badge.svg)](https://codecov.io/gh/pedrommcarrasco/Constrictor)
[![CocoaPods](https://img.shields.io/cocoapods/v/Constrictor.svg)](https://cocoapods.org/pods/Constrictor)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![GitHub contributors](https://img.shields.io/github/contributors/pedrommcarrasco/constrictor.svg)
[![apm](https://img.shields.io/apm/l/vim-mode.svg)](https://github.com/pedrommcarrasco/Constrictor/blob/master/LICENSE)

# Features ✨

- [x] Compatible with Auto Layout 👍
- [x] Concise and chainable syntax ⛓️
- [x] Automatically sets `translateAutoresizingMaskIntoConstraints` 😍
- [x] Constraints are active by default 🤩
- [x] Easily update constraints 🏃
- [x] Allows setting priority upon creation 💁‍♂️

# Usage Examples ⌨️ 

## Simple
Constrictor allows you to **fully replace**  `NSLayoutAnchor`. For example:
```swift
// NSLayoutAnchor
label.topAnchor.constraint(equalTo: view.topAnchor)

// Constrictor
label.constrictor.top(to: view)
```
Another anchor and an offset? Do it as follows:
```swift
// NSLayoutAnchor
label.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 10)

// Constrictor
label.constrictor.top(to: view, .bottom, with: 10)
```
Relation, priority and inactive? Not a problem!
```swift
// NSLayoutAnchor
let constraint = label.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor)
constraint.priority = .defaultHigh

// Constrictor
label.constrictor.top(as: .greaterOrEqual, to: view, prioritizeAs: .high, is: .disabled)
```
## Edge
How you constrain edges with `NSLayoutAnchor`:
```swift
label.topAnchor.constraint(equalTo: view.topAnchor)
label.bottomAnchor.constraint(equalTo: label.bottomAnchor.constraint)
label.leadingAnchor.constraint(equalTo: view.leadingAnchor)
label.trailingAnchor.constraint(equalTo: view.trailingAnchor)
```
How you can easily do it with **Constrictor**:
```swift
label.constrictor.edge(to: view)
```
Want to change the spacing in leading and trailing?
```swift
label.constrictor.edge(to: view, with: .horizontal(15))
```
What if you want to constrain every edge except bottom?
```swift
label.constrictor.edge(to: view, .top, .leading, .trailing, with: .horizontal(15))
```
## Center
Centering with `NSLayoutAnchor`:
```swift
label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
label.centerYAnchor.constraint(equalTo: view.centerXAnchor)
```
With **Constrictor**:
```swift
label.constrictor.center(in: label)
```
Different offsets?
```swift
label.constrictor.center(in: label, with: .centerX(-16) & .centerY(32))
```

## Size
Defining size with `NSLayoutAnchor`:
```swift
label.widthAnchor.constraint(equalToConstant: 10)
label.heightAnchor.constraint(equalTo: label.widthAnchor)
```
**Constrictor** does it better:
```swift
label.constrictor.size(to: 10)
```
To another view with multiplier? Just like this:
```swift
label.constrictor.size(view, multiplyBy: 0.75)
```

## Animate
Everybody loves animations, so does **Constrictor**:
```swift
// Only have one constraint for an anchor?
label.constrictor.updateFirst(.top) { $0?.enable() }

// Have two constraints for an anchor but for different elements? Provide more details
label.constrictor.update(.bottom, to: imageView) { $0?.constant = 16 }

// Call UIView.animate(...) { view.layoutIfNeeded() } to animate changes
```

## Chain
One of the key features of **Constrictor** is how you can easily chain with it. As an example:
```swift
label.constrictor
    .size(view, multiplyBy: 0.75)
    .center(view)
    .bottom(as: .greaterOrEqual, to: imageView, .top)
```

# Installation 📦 
## CocoaPods
Constrictor's available through [CocoaPods](https://cocoapods.org/pods/Constrictor). To do so, add the following line to your PodFile:

```swift
pod 'Constrictor'
```
And then run the following command in terminal:

```swift
pod install
```

## Carthage
Add this to your Cartfile:

```swift
github "pedrommcarrasco/Constrictor"
```

And then run the following command in terminal:

```swift
carthage update
```

#  Sample Project 📲
There's a sample project in this repository called [Example](https://github.com/pedrommcarrasco/Constrictor/tree/master/Example), if you want to take a look at Constrictor before using it in your projects, feel free to take a look at it and try to apply some constraints with it.

# Contributing 🙌 
Feel free to contribute to this project by [reporting bugs](https://github.com/pedrommcarrasco/Constrictor/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc) or open [pull requests](https://github.com/pedrommcarrasco/Constrictor/pulls?q=is%3Apr+is%3Aopen+sort%3Aupdated-desc). Also, feel free to ask me anything on [Twitter](https://twitter.com/pedrommcarrasco)

# License ⛔
Constrictor's available under the MIT license. See the [LICENSE](https://github.com/pedrommcarrasco/Constrictor/blob/master/LICENSE) file for more information.
