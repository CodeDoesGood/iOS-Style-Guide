# CodeDoesGood iOS Style Guide

In order for our volunteers to be able to easily jump between projects and also to facilitate easy code review we are strict about having our platform style guides followed. We are a professional group of developers and one of our main purposes to is train up new developers. We believe that part of being an effective team member and a high quality developer is creating high quality, readable, consistent code. We believe following a style guide is an important part of being a developer.

There are additional things covered by Ray Wenderlich's [Swift Style Guide](https://github.com/raywenderlich/swift-style-guide) if you are interested in how to format your code. What is listed below however are the only things that we are asking all devs to do the same. We find large style guides difficult to follow and mostly unnecessary and so we have only included what we consider the most important for a readable codebase with consistent formatting.

[Swift](#Swift)  
[Documentation](#Documentation)  
[Empty Lines and Line Breaks](#Empty-Lines-and-Line-Breaks)  
[Less Is More](#Less-Is-More)   
[Optionals](#Optionals)   
[Switches and Enumerating](#Switches-and-Enumerating)   
[Miscellaneous Project Specific](#Miscellaneous-Project-Specific)   

##Lead Mentors
(please delete this section when you copy the style guide into your project)  

This style guide should be copied into the wiki for each new project either by the Lead Mentor or by someone the Lead Mentor assigns this task to. One of our guiding principles is to demonstrate distributed authority and teach our volunteers autonomy. What this means to us is that as long as our volunteers adhere to the processes and policies we do set, they have the freedom to make decisions. We know that every developer has a preferred way of working and coding and we do not want to get in the way of your efficiency (hey, another one of our guiding principles is to make efficient use of volunteer time!) and for that reason we want our Lead Mentors to be able to set the style guidelines for their own project. 

Some guidelines are required, some are preferred, and some are optional. Guidelines which are not required will be under the heading **Project Specific** may be changed by the Lead Mentor either at their own discretion or through consensus with their team. Please note guidelines which are marked as _"Preferred"_ really are preferred and we would prefer you change them only if you have a good reason...but you are free to change them if you wish. Please delete the word "Preferred" from the ones that are labelled preferred so that your Hatchlings do not get confused and think they do not need to follow the guideline.

\* With optional and preferred guidelines there is actually one requirement. The requirement is that you _must_ list a guideline for that item. No guidelines may be removed, but they can be edited. Note: You are more than welcome to add additional guidelines if there are things that are important to you which we have not included.

##Swift
We are a Swift-first dev group. This means  
- Resort to Objective-C types only when required. 
- Use Swift initialiatizers not the Objective-C `Type.init(...)` versions
- Use protocol extensions to provide empty default implementations for functions rather than marking a protocol @objc in order to have a protocol function be optional
- Constants should be in a struct and should not use Objective-C conventions like ALL_CAPS or prefixing with "k". A Constants file is included in the template project.
- All strings should be in Localizable.strings and should maintain the same naming convention. An extension for localizable strings is in each project.
- Do your best to use Swift 3 naming conventions, discuss on the #dev-ios Slack channel if you are unsure about naming something. Please see Apple's [Swift 3 API Design Guidelines](https://swift.org/documentation/api-design-guidelines) for more information

##Documentation
IOS projects should be self documenting but sometimes documentation is required.

- The code is a work around for a bug (please include the URL of where you found the work around if you found it online)
- A large chunk of code has been copied from another project or article (please include the URL and other identifying information of where the work comes from as well as the License if it comes from a hosted repository / not an article or Stack Overflow post)
- You are doing anything that may seem out of the ordinary / not a native or standard approach
- Functions should be grouped by type and labelled with a `// MARK:` statement. 
- Parameters should be listed at the top of classes and structs, followed by initialization functions, and then lifecycle functions (each section should be grouped as stated in the above guideline).
- Commented out code must include a // TODO: statement explaining why it is commented out

In general though if you need to write documentation to explain what a function does that code is not written well. If you are not sure how to fix it talk to another person on your team or post the snippet in your platform channel on Slack for help. Usually it can be resolved by encapsulating parts of the function into smaller single purpose functions.

Please do not leave code commented out without adding a `TODO://` statement which explains why it is commented out. If we find code commented without a TODO statement we will be contacting the dev who wrote it to ask why.

####Project Specific
- Lead Mentors: If you prefer your MARK's in a specific order please include that here otherwise please delete the text in these brackets
- Extensions may be used for encapsulation, for example including delegate functions in their own extension. This should be consistent through the project and decided by the Lead Mentor or by consensus (please update your style guide to reflect this if it is decided). 

\* If you are working on an API that will be consumed by other projects or turned into a framework/library additional documentation will be required. Your Lead Mentor will adjust this style guide in that scenario with more information specific to your project. Lead Mentors please delete this line when creating your project style guide.

##Empty Lines and Line Breaks
Emtpy lines are used to help with encapsulation and readability.

- Last line of a file
- Please set your Xcode to use spaces and not tabs, use 4 spaces. If your Xcode is set this way you will be able to use the tab button to "tab" 4 spaces.

####Project Specific
- Two line breaks between classes, extensions, protocols, enums, etc
- else, catch, and additional closures should be on a new line. They should not be on the same line as the closing brace from the previous statement.
- First line in an if-else-guard-do-catch (etc) statement if the statement contains several lines
- Both before and after an if-else-guard-do-catch (etc) statement
- Both before and after a call to super
- First line of a function
- Last line in each case statement in a switch if the cases are several lines
- Last line of a closure if followed by another closure, if the closure contains several lines

\* There is no limit on what "several lines" means, use your judgement, but generally for readability it will mean 4 or more lines.

##Less Is More
- Use Swift type inference when possible rather than explicitly labelling the type.
- When braces are not required, do not use them. 
- Always use self in a class init function and otherwise only use self when required.
- Use underscores if the parameter will not be used.

###Closures
####Project Specific
_Preferred_ When there is only one closure use trailing closure syntax:

```
functionWithOneClosure() { _ in 
      // do stuff
   }
```

Not

```
functionWithOneClosure(closure: { _ in 
      // do stuff
   })
```
   
Multiple closures should look like:

```
functionWithTwoClosures(one: { _ in
      // do stuff
   },
   two: { _ in
      // do stuff
   })
```

##Optionals
- Force Unwrapping (using the bang ! operator to unwrap an optional), and Force Casting (using as!) is not allowed _at all_ except in tests or when creating cells (simply to save you from writing unnecessary code). 
- Only IBOutlets may be Implicity Unwrapped (@IBOutlet weak var titleLabel: UILabel!). 
\* Watch when you use Xcode's "fix-it" option on compiler errors as it will often default to Force Unwrapping.

###Guard-Lets & If-Lets
####Project Specific
- _Preferred_ When unwrapping an optional use the option that makes the most sense. If you will use the variable throughout the function use a guard and exit if unwrapping fails.

###Nil-Coalescing
- _Preferred_ Please use nil-coalescing when appropriate. Nil-coalescing is when you provide a default value when a variable is nil.   

```
return array?.count ?? 0
```
   
The code above will return the count in the array if the array exist. If the array is nil 0 will be returned instead. This should be used instead of the longer forms

```
guard let array = array else {
      return 0
   }
   return array.count
```
   
or

```
if let array = array {
      return array.count
   }
   else {
      return 0
   }
```
   
##Switches and Enumerating
####Project Specific
- _Preferred_ Use switches not if-else statements for enums
- _Preferred_ Use `for item in items.enumerated`, not `for-i-0..items.count` to go through an array
- _Preferred_ Use pattern matching in switches, not nested if-else statements for tuples
   
##Miscellaneous Project Specific
- _Preferred_ When calling a function with multiple parameters, each should be on their own line only if it improves readability
- Use shadow naming when unwrapping optionals
- Use for-in loops instead of forEach
- Opening braces should be on the same line as the function
