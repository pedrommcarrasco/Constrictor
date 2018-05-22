# Constrictor 🐍
AutoLayout's µFramework

## Example

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
