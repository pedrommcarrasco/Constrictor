# Documentation 🐍



- [Core](#core)
  * [Constraint between equal attributes](#constraint-between-equal-attributes)
    + [Multiple Attributes](#multiple-attributes)
    + [Set Constant for all attributes](#set-constant-for-all-attributes)
    + [Set Constant for a specific attribute](#set-constant-for-a-specific-attribute)
    + [Set Relation](#set-relation)
    + [Set Multiplier](#set-multiplier)
    + [Set Priority](#set-priority)
    + [All Above](#all-above)
  * [Constraint between different attributes](#constraint-between-different-attributes)
    + [Set Constant](#set-constant)
    + [Set Relation](#set-relation-1)
    + [Set Multiplier](#set-multiplier-1)
    + [Set Priority](#set-priority-1)
    + [All Above](#all-above-1)
  * [Constraint to `superview`](#constraint-to--superview-)
- [Edges](#edges)
  * [Constraint edges between 2 elements](#constraint-edges-between-2-elements)
    + [Set Constant to One Edge](#set-constant-to-one-edge)
    + [Set Constant to Two or More Edges](#set-constant-to-two-or-more-edges)
    + [Set Constant to All Edges](#set-constant-to-all-edges)
    + [Set Relation](#set-relation-2)
    + [Set Multiplier](#set-multiplier-2)
    + [Set Priority](#set-priority-2)
    + [Ignore SafeArea or Guides](#ignore-safearea-or-guides)
    + [All Above](#all-above-2)
  * [Constraint to `UIViewController`](#constraint-to--uiviewcontroller-)
    + [All Modifiers](#all-modifiers)
  * [Constraint to `superview`](#constraint-to--superview--1)
    + [All Modifiers](#all-modifiers-1)




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

#### Set Relation

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

#### Set Relation

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

### Constraint to `superview`

```swift
aView.constrictToParent(attributes: .top, .leading)
```

Setting constant, relation, multiplier and priority works the same as [Constraint between equal attributes](#constraint-between-equal-attributes) except that you don't need to pass a `Constrictable` object.

## Edges

The following functions will be used to apply the same edges (leading, top, trailing, bottom), if needed with modifiers like spacing, between two `Constrictable` objects.

### Constraint edges between 2 elements

Abstracts the complexity of deciding when to use `topLayoutGuide` & `bottomLayoutGuide` or `safeAreaLayoutGuide` (Pre-iOS 11.0 vs iOS 11.0 onwards).

```swift
aView.constrictEdges(to: bView)
```

#### Set Constant to One Edge

```swift
aView.constrictEdges(to: bView, with: .top(8.0))
```

#### Set Constant to Two or More Edges

```swift
aView.constrictEdges(to: bView, with: .top(8.0) & .bottom(8.0))
```

#### Set Constant to All Edges

```swift
aView.constrictEdges(to: bView, with: .all(8.0))
```

#### Set Relation

```swift
aView.constrictEdges(as: .greaterThanOrEqual, to: bView)
```

#### Set Multiplier

```swift
aView.constrictEdges(to: bView, multiplyBy: 0.5)
```

#### Set Priority

```swift
aView.constrictEdges(to: bView, prioritizeAs: .defaultLow)
```

#### Ignore SafeArea or Guides

```swift
aView.constrictEdges(to: bView, withinGuides: false)
```

#### All Above

```swift
aView.constrictEdges(as: .greaterThanOrEqual, to: bView, with: .all(8.0), multiplyBy: 0.5, prioritizeAs: .defaultLow, withinGuides: false)
```

### Constraint to `UIViewController`

Abstracts the complexity of deciding when to use `topLayoutGuide` & `bottomLayoutGuide` or `safeAreaLayoutGuide` (Pre-iOS 11.0 vs iOS 11.0 onwards).

```swift
aView.constrictEdgesToController(exampleController)
```

The function call and parameters are similar to [Constraint edges between 2 elements](#constraint-edges-between-2-elements)

#### All Modifiers

```swift
aView.constrictEdgesToController(exampleController, with: .all(8.0), as: .greaterThanOrEqual, multiplyBy: 0.5, prioritizeAs: .defaultLow, withinGuides: false)
```

### Constraint to `superview`

```swift
aView.constrictEdgesToParent()
```

The function call and parameters are similar to [Constraint edges between 2 elements](#constraint-edges-between-2-elements)

#### All Modifiers

```swift
aView.constrictEdgesToParent(as: .lessThanOrEqual, with: .all(8.0), multiplyBy: 0.7, prioritizeAs: .fittingSizeLevel)
```
