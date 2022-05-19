---
layout: post
title: Clean Naming
excerpt: "Rules and ideas on how to name your variables and methods"
categories: articles
tags: [clean-code, uncle-bob, naming]
image:
  path: /images/js-minified-code.jpeg
  feature: js-minified-code.jpeg
  creditlink: https://www.pexels.com/photo/full-frame-shot-of-multi-colored-pattern-330771/
  credit: Markus Spiske
share: true
ads: false
---
Usually, I struggle to choose a good name each time I have to define a new variable or function. This article is a compilation of rules about naming, based on the "Clean Code" book.
  
### Reveal intent

The variable and function names should reveal intentions. Ask yourself:  

_What does it have to do?_  
_What information does the name suggest?_  

### Long, boring and meaningless

Don't use long names that look alike. It will confuse both future you and other programmers, and may cause bugs if you are not paying attention to the autocomplete.

```swift
    UITableViewControllerShapeCustomPage
    UITableViewControllerShareCustomPage
```

How long did it take you to spot the difference ?

### White noise

Avoid noise words, that don't add new information, like 
* ..Info
* ..Data
* ..Object  

If by removing a part of the name its intent becomes clearer, you found a noise word.

Don't use the type of the variable in the variable name if it's not necessary: **`nameString`**, **`clientObject`**.

If you have variables with similar names, make sure that others can distinguish them and understand their purpose.

### Searchable

Use names that are easy to search.  

> The length of a name should correspond to the size of its scope  
>
> &mdash; <cite>Uncle Bob</cite>  

Single-letter variables should be used only in short functions.  
Use short names in short functions and longer names in class or global scope.  
It's easier to search for **`currentCurrencyID`** than **`j`**.  

### Puns and consistency
Be consistent: 1 concept = 1 name. Don't use different words with the same meaning. If you have "Product**Manager**", "Customer**Controller**" and "Client**Handler**" classes in the same project, something might be wrong. Stick to a single naming convention.  
  
Don't make puns: 1 name = 1 concept. Don't use a single name for two different ideas, because it may confuse other programmers.  
```swift
Game()               .update()              // Frame update loop for a game
ScoreViewController().update(score: Int)    // Updates the UI with the latest changes
```
In the example, the `update` methods do different things, but have the same name. For different concepts, use different, distinguishable names.

### Classes and interfaces

* You use an interface name more often than those of its implementation classes.  
Don't add particles to the name to show that it's an interface; better change the implementation class name.  
* Don't use verbs for class names. 
* Avoid names like "..Manager", "..Data", "..Info".    
* Shorter class names usually are better than longer ones. Count how many letters or words provide actual information and how many are just dead weight.  

### Death to literals

Instead of using hard-coded string and numerical values, replace them with constants. It will help you avoid mistakes and make the code more understandable.  

Many people know about this rule but when in a hurry, don't use it.  

Example:
```swift
    if response.statusCode == 200 {
```
vs
```swift
    if response.statusCode == HTTPStatusCode.ok {
```
Usually, I create a **private struct** where I define the constants. In the provided example, it would be more logical to use an **enum**.

### Cleaning code

If a function does too many things, split it and give meaningful names to the smaller functions.
  

---
---
  
  
###### In the end, if you are not sure, just try to make your code more clean and readable.