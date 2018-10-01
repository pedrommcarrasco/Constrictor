# Documentation 🐍

* [Core](#core)
  + [Constrain between equal attributes](#constrain-between-equal-attributes)
    - [Multiple Attributes](#multiple-attributes)
    - [Set Constant for all attributes](#set-constant-for-all-attributes)
    - [Set Constan for a specific attribute](#set-constan-for-a-specific-attribute)
    - [Set Relation](#set-relation)
    - [Set Multiplier](#set-multiplier)
    - [Set Priority](#set-priority)
    - [All Above](#all-above)
  + [Constrain between different attributes](#constrain-between-different-attributes)
    - [Set Constant](#set-constant)
    - [Set Relation](#set-relation-1)
    - [Set Multiplier](#set-multiplier-1)
    - [Set Priority](#set-priority-1)
    - [All Above](#all-above-1)
  + [Constrain to `superview`](#constrain-to--superview-)
* [Edges](#edges)
  + [Constrain edges between 2 elements](#constrain-edges-between-2-elements)
    - [Set Constant to One Edge](#set-constant-to-one-edge)
    - [Set Constant to Two or More Edges](#set-constant-to-two-or-more-edges)
    - [Set Constant to All Edges](#set-constant-to-all-edges)
    - [Set Relation](#set-relation-2)
    - [Set Multiplier](#set-multiplier-2)
    - [Set Priority](#set-priority-2)
    - [All Above](#all-above-2)
  + [Constrain to `UIViewController`](#constrain-to--uiviewcontroller-)
    - [Ignore SafeArea or Guides](#ignore-safearea-or-guides)
    - [All Modifiers](#all-modifiers)
  + [Constrain to `superview`](#constrain-to--superview--1)
    - [All Modifiers](#all-modifiers-1)
* [Center](#center)
  + [Constraint center between 2 elements](#constraint-center-between-2-elements)
    - [Set Constant to One Axis](#set-constant-to-one-axis)
    - [Set Constant to All Edges](#set-constant-to-all-edges-1)
    - [Set Relation](#set-relation-3)
    - [Set Multiplier](#set-multiplier-3)
    - [Set Priority](#set-priority-3)
    - [All Above](#all-above-3)
  + [Constrain to `UIViewController`](#constrain-to--uiviewcontroller--1)
    - [All Modifiers](#all-modifiers-2)
  + [Constrain to `superview`](#constrain-to--superview--2)
    - [All Modifiers](#all-modifiers-3)
* [Size](#size)
  + [Constrain size between 2 elements](#constrain-size-between-2-elements)
    - [Set Constant Offset to one dimension](#set-constant-offset-to-one-dimension)
    - [Set Constant to both dimensions (height and width)](#set-constant-to-both-dimensions--height-and-width-)
    - [Set Relation](#set-relation-4)
    - [Set Multiplier](#set-multiplier-4)
    - [Set Priority](#set-priority-4)
    - [All Above](#all-above-4)
  + [Constrain to `superview`](#constrain-to--superview--3)
    - [All Modifiers](#all-modifiers-4)
  + [Constrain to Constant](#constrain-to-constant)
    - [Different Values for Width and Height](#different-values-for-width-and-height)
    - [Same Values for Width and Height](#same-values-for-width-and-height)
    - [All Modifiers](#all-modifiers-5)
* [Utils](#utils)
  + [`UILayoutPriority` Operators](#-uilayoutpriority--operators)

## Core 

With the following functions you'll be able to achieve every possible constraint. Notice that, Constrictor **takes care of handling bottom, trailing and right negative values for constant**.

### Constrain between equal attributes

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

#### Set Constan for a specific attribute

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

### Constrain between different attributes

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

### Constrain to `superview`

```swift
aView.constrictToParent(attributes: .top, .leading)
```

Setting constant, relation, multiplier and priority works the same as [Constraint between equal attributes](#constraint-between-equal-attributes) except that you don't need to pass a `Constrictable` object.

## Edges

The following functions will be used to apply the same edges (leading, top, trailing, bottom), if needed with modifiers like spacing, between two `Constrictable` objects.

### Constrain edges between 2 elements

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

#### All Above

```swift
aView.constrictEdges(as: .greaterThanOrEqual, to: bView, with: .all(8.0), multiplyBy: 0.5, prioritizeAs: .defaultLow)
```

### Constrain to `UIViewController`

It's also possible to constrain to a `UIViewController` and with it you abstract the complexity of deciding when to use `topLayoutGuide` & `bottomLayoutGuide` or `safeAreaLayoutGuide` (Pre-iOS 11.0 vs iOS 11.0 onwards). You should use this everytime you want to use the `view` property from a `UIViewController`.

```swift
aView.constrictEdges(to: exampleController)
```

The function call and parameters are similar to [Constraint edges between 2 elements](#constraint-edges-between-2-elements)

#### Ignore SafeArea or Guides

```swift
aView.constrictEdgesToController(exampleController, withinGuides: false)
```

#### All Modifiers

```swift
aView.constrictEdges(to: exampleController, with: .all(8.0), as: .greaterThanOrEqual, multiplyBy: 0.5, prioritizeAs: .defaultLow, withinGuides: false)
```

### Constrain to `superview`

```swift
aView.constrictEdgesToParent()
```

The function call and parameters are similar to [Constraint edges between 2 elements](#constraint-edges-between-2-elements)

#### All Modifiers

```swift
aView.constrictEdgesToParent(as: .lessThanOrEqual, with: .all(8.0), multiplyBy: 0.7, prioritizeAs: .fittingSizeLevel)
```

## Center

The following functions will be used to apply the same center in x and y, if needed with modifiers like offset, between two `Constrictable` objects.

### Constraint center between 2 elements

```swift
aView.constrictCenter(to: bView)
```

#### Set Constant to One Axis

```swift
aView.constrictCenter(to: bView, with: .x(8.0))
```

#### Set Constant to All Edges

```swift
aView.constrictCenter(to: bView, with: .all(8.0))
```

#### Set Relation

```swift
aView.constrictCenter(as: .greaterThanOrEqual, to: bView)
```

#### Set Multiplier

```swift
aView.constrictCenter(to: bView, multiplyBy: 0.5)
```

#### Set Priority

```swift
aView.constrictCenter(to: bView, prioritizeAs: .defaultLow)
```

#### All Above

```swift
aView.constrictCenter(as: .greaterThanOrEqual, to: bView, with: .all(8.0), multiplyBy: 0.5, prioritizeAs: .defaultLow)
```

### Constrain to `UIViewController`

It's also possible to constrain to a `UIViewController` and with it you abstract the complexity of deciding when to use `topLayoutGuide` & `bottomLayoutGuide` or `safeAreaLayoutGuide` (Pre-iOS 11.0 vs iOS 11.0 onwards). You should use this everytime you want to use the `view` property from a `UIViewController`.

```swift
aView.constrictCenter(in: exampleController)
```

The function call and parameters are similar to [Constraint center between 2 elements](#constraint-center-between-2-elements)

#### All Modifiers

```swift
aView.constrictCenterInController(exampleController, with: .all(8.0), as: .greaterThanOrEqual, multiplyBy: 0.5, prioritizeAs: .defaultLow, withinGuides: false)
```

### Constrain to `superview`

```swift
aView.constrictCenterInParent()
```

The function call and parameters are similar to [Constraint center between 2 elements](#constraint-center-between-2-elements)

#### All Modifiers

```swift
aView.constrictCenterInParent(as: .lessThanOrEqual, with: .all(8.0), multiplyBy: 0.7, prioritizeAs: .fittingSizeLevel)
```

## Size

The following functions will be used to apply the width and height constraints.

### Constrain size between 2 elements

```swift
aView.constrictSize(to: bView)
```

#### Set Constant Offset to one dimension

```swift
aView.constrictSize(to: bView, with: .width(8.0))
```

#### Set Constant to both dimensions (height and width)

```swift
aView.constrictSize(to: bView, with: .all(8.0))
```

#### Set Relation

```swift
aView.constrictSize(as: .greaterThanOrEqual, to: bView)
```

#### Set Multiplier

```swift
aView.constrictSize(to: bView, multiplyBy: 0.5)
```

#### Set Priority

```swift
aView.constrictSize(to: bView, prioritizeAs: .defaultLow)
```

#### All Above

```swift
aView.constrictSize(as: .greaterThanOrEqual, to: bView, with: .all(8.0), multiplyBy: 0.5, prioritizeAs: .defaultLow)
```

### Constrain to `superview`

```swift
aView.constrictSizeToParent()
```

The function call and parameters are similar to [Constraint size between 2 elements](#constraint-size-between-2-elements)

#### All Modifiers

```swift
aView.constrictSizeToParent(as: .lessThanOrEqual, with: .all(8.0), multiplyBy: 0.7, prioritizeAs: .fittingSizeLevel)
```

### Constrain to Constant

#### Different Values for Width and Height

```swift
aView.constrictSize(to: .width(50.0) & .height(100.0))
```

#### Same Values for Width and Height

```swift
aView.constrictSize(to: 100.0)
```

#### All Modifiers

```swift
aView.constrictSizeToParent(as: .lessThanOrEqual, to: .width(50.0) & .height(100.0), prioritizeAs: .fittingSizeLevel)
```

```swift
aView.constrictSizeToParent(as: .lessThanOrEqual, to: 100.0, prioritizeAs: .fittingSizeLevel)
```

## Utils 

### `UILayoutPriority` Operators

Short syntax to create non-enumerated priorities. Instead of:

```swift
let priority = UILayoutPriority(UILayoutGuide.defaultLow.rawValue + 1)
```

You can now do:

```swift
let priority: UILayoutPriority = .defaultLow + 1
```

There are two operators: **+** (plus) and **-** (minus).
