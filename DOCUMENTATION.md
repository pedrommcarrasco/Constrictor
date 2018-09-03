# Documentation 🐍

- [Core](#core)
  * [Constraint between equal attributes](#constraint-between-equal-attributes)
    + [Multiple Attributes](#multiple-attributes)
    + [Set Constant for all attributes](#set-constant-for-all-attributes)
    + [Set Constant for a specific attribute](#set-constant-for-a-specific-attribute)
    + [Set relation](#set-relation)
    + [Set Multiplier](#set-multiplier)
    + [Set Priority](#set-priority)
    + [All Above](#all-above)
  * [Constraint between different attributes](#constraint-between-different-attributes)
    + [Set Constant](#set-constant)
    + [Set relation](#set-relation-1)
    + [Set Multiplier](#set-multiplier-1)
    + [Set Priority](#set-priority-1)
    + [All Above](#all-above-1)

## Core 

With the following functions you'll be able to achieve every possible constraint.

### Constraint between equal attributes

For example, the code bellow will constrain `aView`'s `.bottom` to `bView`'s `.bottom`

```swift
aView.constrict(to: bView, attribute: .bottom)
```

#### Multiple Attributes

```swift
aView.constrict(to: bView, attribute: .bottom, .top)
```

#### Set Constant for all attributes

```swift
aView.constrict(to: bView, attribute: .bottom, .top, .leading, with: .all(8.0)
```

#### Set Constant for a specific attribute

```swift
aaView.constrict(to: bView, attribute: .bottom, .top, .leading, with: .bottom(8.0) & .top(8.0))
```

#### Set relation

```swift
aaView.constrict(as: .greaterThanOrEqual, to: bView, attribute: .bottom, .top, .leading)
```

#### Set Multiplier

```swift
aaView.constrict(to: bView, attribute: .bottom, .top, .leading, multiplyBy: 0.5)
```

#### Set Priority

```swift
aaView.constrict(to: bView, attribute: .bottom, .top, .leading, prioritizeAs: .fittingSizeLevel)
```

#### All Above

```swift
aaView.constrict(as: .greaterThanOrEqual, to: bView, attribute: .bottom, .top, .leading, with: .bottom(8.0) & .top(8.0), multiplyBy: 0.5, prioritizeAs: .fittingSizeLevel)
```

### Constraint between different attributes

```swift
aView.constrict(.top, to: bView, attribute: .bottom)
```

#### Set Constant

```swift
aView.constrict(.top, to: bView, attribute: .bottom, with: 8.0)
```

#### Set relation

```swift
aView.constrict(.top, as: .greaterThanOrEqual, to: bView, attribute: .bottom)
```

#### Set Multiplier

```swift
aView.constrict(.top, to: bView, attribute: .bottom, multiplyBy: 0.4)
```

#### Set Priority

```swift
aView.constrict(.top, to: bView, attribute: .bottom, prioritizeAs: .defaultHigh)
```

#### All Above

```swift
aView.constrict(.top, as: .greaterThanOrEqual, to: bView, attribute: .bottom, with: 8.0, multiplyBy: 0.4, prioritizeAs: .defaultHigh)
```