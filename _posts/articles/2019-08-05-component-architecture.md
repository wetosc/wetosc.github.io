---
layout: post
title: Component based architecture
excerpt: "A new way to structure iOS apps code"
categories: articles
tags: [iOS, swift, Clean Swift, MVVM, architecture]
image:
  feature: apartment-architecture-black-and-white.jpg
  credit: Yentl Jacobs
  creditlink: https://www.pexels.com/photo/grayscale-photo-of-concrete-building-157811/
share: true
ads: false
---

In order to simplify the VIP and VIPER architectures i propose a new approach: component-based architecture.

We keep some of the logic from VIP: we have the view and the interactor, but with slightly different roles; the model and the router stays the same. The presenter is deprecated, because it adds more complexity without improving the project.

---

## Elements description

### **UIComponent**:
The most important part of the architecture; Represents an isolated UI element, which can be reused later on multiple screens.  
Can contain some logic, but it must be specific to the UI it represents. For example, a drop-down field can handle the display of an action sheet and be the delegate for item selection, but can’t interact with the backend or save to DB.  
There might be some exceptions from this rule, like a social login component which interacts with social media, but doesn’t handle the actual login part; this way the component will be self-sufficient and isolated from the rest of the app at the same time.

Each component has an input and an output trought which all the interactions are done. 
In order to customize the component we use the
`configure(viewModel: ViewModel)` method.  
  
The view model is defined inside the component; if you want to be able to configure it with another view model, you can make an extension and overload the configure method. The view model should be dumb, ideally a struct with some simple values.
  
As output we can provide computed fields, to access some values, and callbacks, to delegate event handling. The delegate pattern might be used instead of callbacks, but it’s a matter of preference.
  
The components are easy to design and implement because of their tangence with the real world; you can apply the OOP principles learned before in a more obvious manner. 
  
The components are meant to be used as building blocks to another components; This way you can hide the complexity in a structured manner.
  
### **ViewController**:  
The view part from VIP. Controls the components of a single screen; has the same role as in other architectures + takes the role of the presenter ( updates the components with the transformed model).  
  
In order to keep the view uncluttered ideally it should have only 3-4 UIComponents. If it has more then there might be some way to compose them and create a more complex component. 
  
The ViewController configures the components and serves as a bridge between them and the interactor. Also it contains some layout logic ( places the components in a scroll view / stack view, adds constraints to its view.

### **Interactor**: 
As in VIP, it receives requests from ViewController and calls some web / storage services to do the actual busses logic. This time it doesn’t pass the response to the presenter, but right back to the ViewController, to whom it has a weak reference.

### **Router**: 
Same as in VIP;  
ViewController instantiation is preferred to segues.

### **Model**: 
Same as in VIP;  
Defines the models for the ViewController and the Interactor.

---

## Working in a team
In a big team there always will be small changes to the code base which might affect everyone else. In order to avoid trouble we recommend to minimize the change to the existing components and to create a new one, if it has some different functionality. 
  
Avoid making the components too generic / too customizable; 
  
It’s better to have two button components with different styling than to make a generic component which needs to be styled everywhere we use it.  
As a rule of thumb, if you start using flags to change the behavior of the component it means you need to split it and make two more specialized ones.
  
The components should change together with the UI; if the UI was changed only on a single page, you have to create new components or change the view.  
If an UI element changed on every page you have to change that UI element and check if it doesn’t break anything on all the screens it appears.

---

## Testing
The UIComponents are meant to be isolated, so they can be tested without affecting the rest of the app.
  
The interactor and the router can be tested the same way as in VIP. 
  
The problematic one is the view, because it depends on UIComponents.  
I propose to keep the view as simple as possible and not to test it, or use UI tests instead of unit-tests.  
Another approach would be to use interfaces for each component, which will allow to mock them and unit-test the view.

---

## Conclusion
The architecture was born from the daily struggles with VIP ( which is too complicated for small projects) and MV* ( which bloats the view controller one way or another).  
  
It’s not a silver bullet, but it might find its niche. I’ll keep you updated with more details about how it worked for me and which changes would i like to make.