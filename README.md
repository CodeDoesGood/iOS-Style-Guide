# CodeDoesGood iOS Style Guide

In order for our volunteers to be able to easily jump between projects and also to facilitate easy code review we are strict about having our platform style guides followed.

Some guidelines are required and some are optional -- labelled as "Project Specific" in each section. This style guide should be copied into the wiki for each new project. Lead Mentors may make changes to Project Specific guidelines either at their own discretion or through consensus with their team.

There are additional things covered by Ray Wenderlich's [Swift Style Guide](https://github.com/raywenderlich/swift-style-guide) if you are interested in how to format your code. What is listed below however are the only things that we are asking all devs to do the same.

\* Lead Mentors: Please add any additional style guidelines to the bottom section _"Miscellaneous Project Specific"_ and please feel free to edit any of the guidelines labelled Project Specific. If you feel something is missing from the general guide or you'd like us to change one of the required guidelines let us know so we can all discuss and come to a consensus.

##Swift
We are a Swift-first dev group. This means  
- Resort to Objective-C types only when required. 
- Use Swift initialiatizers not the Objective-C `Type.init(...)` versions
- Use protocol extensions to provide empty default implementations for functions rather than marking a protocol @objc in order to have a protocol function be optional
- Constants should be in a struct and should not use Objective-C conventions like ALL_CAPS or prefixing with "k". A Constants file is included in the template project.
- Do your best to use Swift 3 naming conventions, discuss on the #dev-ios Slack channel if you are unsure about naming something. Please see Apple's [Swift 3 API Design Guidelines](https://swift.org/documentation/api-design-guidelines) for more information

##Documentation
IOS projects should be self documenting but sometimes documentation is required.

- The code is a work around for a bug (please include the URL of where you found the work around if you found it online)
- A large chunk of code has been copied from another project or article (please include the URL and other identifying information of where the work comes from as well as the License if it comes from a hosted repository / not an article or Stack Overflow post)
- You are doing anything that may seem out of the ordinary

In general though if you need to write documentation to explain what a function does that code is not written well. If you are not sure how to fix it talk to another person on your team or post the snippet in your platform channel on Slack for help. Usually it can be resolved by encapsulating parts of the function into smaller single purpose functions.

Please do not leave code commented out without adding a `TODO://` statement which explains why it is commented out.

####Project Specific
If you are working on an API that will be consumed by other projects or turned into a framework/library additional documentation will be required. Your Lead Mentor will adjust this style guide in that scenario with more information specific to your project.

##Empty Lines and Line Breaks
Emtpy lines are used to help with encapsulation and readability.

- Last line of a file
- Last line in each case statement in a switch if the cases are several lines
- Last line of a closure if followed by another closure, if the closure contains several lines
- First line in an if-else-guard-do-catch (etc) statement if the statement contains several lines

\* There is no limit on what "several lines" means, use your judgement, but generally for readability it will mean 4 or more lines.

Additionally please set your Xcode to use spaces and not tabs, use 4 spaces. If your Xcode is set this way you will be able to use the tab button to "tab" 4 spaces.

####Project Specific
- Two line breaks between classes, extensions, protocols, enums, etc
- else, catch, and additional closures should be on a new line. They should not be on the same line as the closing brace from the previous statement.
- Both before and after an if-else-guard-do-catch (etc) statement
- Both before and after a call to super
- First line of a function

##Less Is More
- Use Swift type inference when possible rather than explicitly labelling the type.
- When braces are not required, do not use them. 
- Always use self in a class init function and otherwise only use self when required.
- Use underscores if the parameter will not be used.

###Closures
When there is only one closure use trailing closure syntax:

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
- Force Unwrapping (using the bang ! operator to unwrap an optional), and Force Casting (using as!) is not allowed at all except in tests. 
- Only IBOutlets may be Implicity Unwrapped (@IBOutlet weak var titleLabel: UILabel!). 
- Watch when you use Xcode's "fix-it" option on compiler errors as it will often default to Force Unwrapping.

###Guard-Lets & If-Lets
When unwrapping an optinal use the option that makes the most sense. If you will use the variable throughout the function use a guard and exit if unwrapping fails.

###Nil-Coalescing
Nil-coalescing is when you provide a default value when a variable is nil.   

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
- Use switches not if-else statements for enums
- Use `for item in items.enumerated`, not `for-i-0..items.count` to go through an array
- Use pattern matching in switches, not nested if-else statements for tuples
   
##Miscellaneous Project Specific
- When calling a function with multiple parameters, each should be on their own line only if it improves readability
- Use shadow naming when unwrapping optionals
- Use for-in loops instead of forEach
- Opening braces should be on the same line as the function
