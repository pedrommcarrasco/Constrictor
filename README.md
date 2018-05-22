# 🐍 Constrictor 

[![Build Status](https://travis-ci.org/pedrommcarrasco/Constrictor.svg?branch=master)](https://travis-ci.org/pedrommcarrasco/Constrictor) 
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

***(Boe)*** Constrictor's AutoLayout µFramework with the goal of simplying your constraints by reducing the amount of code you have to write.

## 📦 Installation
### CocoaPods
Constrictor's available through CocoaPods. To do so, add the following line to your PodFile:

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

## ⌨️ Usage Example
After installing Constrictor, you should import the framework:

```swift
import Constrictor
```

Once imported you can start using Constrictor to apply constraints to your views programmatically.

### How you're *probably* doing it without Constrictor 😰
```swift
let redView = UIView()
redView.backgroundColor = .red
redView.translatesAutoresizingMaskIntoConstraints = false  
view.addSubview(redView)
        
redView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
redView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
redView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
redView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
let blueView = UIView()
blueView.backgroundColor = .blue
blueView.translatesAutoresizingMaskIntoConstraints = false     
view.addSubview(blueView)
        
blueView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
blueView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
blueView.widthAnchor.constraint(equalToConstant: 75.0).isActive = true
blueView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true

let greenView = UIView()
greenView.backgroundColor = .green
greenView.translatesAutoresizingMaskIntoConstraints = false     
redView.addSubview(greenView)

greenView.widthAnchor.constraint(equalTo: blueView.widthAnchor).isActive = true
greenView.heightAnchor.constraint(equalTo: blueView.heightAnchor).isActive = true
greenView.centerYAnchor.constraint(equalTo: blueView.centerYAnchor).isActive = true
greenView.trailingAnchor.constraint(equalTo: blueView.leadingAnchor, constant: 50.0).isActive = true
```

### How you can do it with Constrictor 😍
```swift
let redView = UIView()
redView.backgroundColor = .red
view.addSubview(redView)
 
redView.constrictEdgesToContainer()
        
let blueView = UIView()
blueView.backgroundColor = .blue
redView.addSubview(blueView)

blueView.constrict(.width, constant: 75)
    .constrict(.height, constant: 100)
    .constrictCenterInContainer()
    
let greenView = UIView()
greenView.backgroundColor = .green
redView.addSubview(greenView)
 
greenView.constrict(attributes: .width, .height, .centerY, to: blueView)
    .constrict(.trailing, to: blueView, attribute: .leading, constant: 50)
```

## 📲 Sample Project
There's a sample project in this repository called [Example](https://github.com/pedrommcarrasco/Constrictor/tree/master/Example), if you want to take a look at Constrictor before using it in your projects, feel free to take a look at it and try to apply some constraints with it.

## ✅ To-Do
- [x] Code Documentation
- [ ] Tests
- [x] TravisCI integration
- [ ] Use TravisCI to run the tests
- [ ] Add more short syntax methods like edges and center.

## 🙌 Contributing
Feel free to contribute to this project by [reporting bugs](https://github.com/pedrommcarrasco/Constrictor/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc) or open [pull requests](https://github.com/pedrommcarrasco/Constrictor/pulls?q=is%3Apr+is%3Aopen+sort%3Aupdated-desc).

## ⛔ License
Constrictor's available under the MIT license. See the [LICENSE](https://github.com/pedrommcarrasco/Constrictor/blob/master/LICENSE) file for more informations.
