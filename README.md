![](https://github.com/pedrommcarrasco/Constrictor/blob/Revamp/cover.jpg?raw=true)

> **Constrict** *(/ˈkənˈstrɪkt/)*, *verb*
>
> "... to make something become tighter and narrower:"

Constrict your Auto Layout code with **Constrictor**, your chainable sugar.

<p align="center">
    <img src="https://github.com/pedrommcarrasco/Constrictor/blob/Revamp/presentation.gif?raw=true" alt="Presentation" width="100%"/>
</p>

[![Build Status](https://travis-ci.org/pedrommcarrasco/Constrictor.svg?branch=master)](https://travis-ci.org/pedrommcarrasco/Constrictor) 
[![codecov](https://codecov.io/gh/pedrommcarrasco/Constrictor/branch/master/graph/badge.svg)](https://codecov.io/gh/pedrommcarrasco/Constrictor)
[![CocoaPods](https://img.shields.io/cocoapods/v/Constrictor.svg)](https://cocoapods.org/pods/Constrictor)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![GitHub contributors](https://img.shields.io/github/contributors/pedrommcarrasco/constrictor.svg)
[![apm](https://img.shields.io/apm/l/vim-mode.svg)](https://github.com/pedrommcarrasco/Constrictor/blob/master/LICENSE)

## Features ✨
* Compatible with Auto Layout
* Short and chainable syntax
* Automatically sets `translateAutoresizingMaskIntoConstraints`
* Constraints are active by default
* Easily update constraints
* Allows setting priority upon creation

## Usage Examples ⌨️ 

### Simple
Constrictor allows you to **fully replace** your `NSLayoutAnchor`. For example:
```swift
// NSLayoutAnchor
label.topAnchor.constraint(equalTo: view.topAnchor)

// Constrictor
label.constrictor.top(to: view)
```
If you want to any other `view`'s anchor and with a constant, you can do as follows:
```swift
// NSLayoutAnchor
label.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 10)

// Constrictor
label.constrictor.top(to: view, .bottom, with: 10)
```
What about setting relation, priority and avoid activating it? Do it as follows:
```swift
// NSLayoutAnchor
let constraint = label.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor)
constraint.priority = .defaultHigh

// Constrictor
label.constrictor.top(as: .greaterOrEqual, to: view, prioritizeAs: .high, state: .notActive)
```
### Edge

### Center

### Size

### Animate


## Installation 📦 
### CocoaPods
Constrictor's available through [CocoaPods](https://cocoapods.org/pods/Constrictor). To do so, add the following line to your PodFile:

```swift
pod 'Constrictor'
```
And then run the following command in terminal:

```swift
pod install
```

### Carthage
Add this to your Cartfile:

```swift
github "pedrommcarrasco/Constrictor"
```

And then run the following command in terminal:

```swift
carthage update
```

##  Sample Project 📲
There's a sample project in this repository called [Example](https://github.com/pedrommcarrasco/Constrictor/tree/master/Example), if you want to take a look at Constrictor before using it in your projects, feel free to take a look at it and try to apply some constraints with it.

## Contributing 🙌 
Feel free to contribute to this project by [reporting bugs](https://github.com/pedrommcarrasco/Constrictor/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc) or open [pull requests](https://github.com/pedrommcarrasco/Constrictor/pulls?q=is%3Apr+is%3Aopen+sort%3Aupdated-desc). Also, feel free to ask me anything on [Twitter](https://twitter.com/pedrommcarrasco)

## License ⛔
Constrictor's available under the MIT license. See the [LICENSE](https://github.com/pedrommcarrasco/Constrictor/blob/master/LICENSE) file for more information.
