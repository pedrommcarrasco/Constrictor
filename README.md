# 🐍 Constrictor 
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
redView.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
redView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
```

### How you can do it with Constrictor 😍
```swift
let redView = UIView()
redView.backgroundColor = .red
view.addSubview(redView)
 
redView.constrictFillContainer()
        
let blueView = UIView()
blueView.backgroundColor = .blue

redView.addSubview(blueView)

blueView.constrict(.width, constant: 50.0)
    .constrict(.height, constant: 50.0)
    .constrictCenterInContainer()
```

## 📲 Sample Project
There's a sample project in this repository called **Example**, if you want to take a look at Constrictor before using it in your projects, feel free to take a look at it and try to apply some constraints with it.

## ✅ To-Do


## 🙌 Contributing
Feel free to contribute to this project by **reporting bugs** or open **pull requests**.

## ⛔ License
Constrictor's available under the MIT license. See the LICENSE file for more informations.
