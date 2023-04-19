# taskManager

The main objective is to create a tiny task manager application for managing tasks on iOS devices.

## Stack
- Swift
- CleanSwift
- UIKit
- XCTest
	- The App is fully test covered
- OOP/POP
- SwiftGen
	-  Used to solve localization issues
- Swift Package Manager
	- All business logic is carried away in the separate package - TaskManagerPackage
- SwiftLint
- PinLayout

## Dependencies
### Swift Package Manager:
- [PinLayout](https://github.com/layoutBox/PinLayout) - used for interface layout
### [Homebrew](https://brew.sh/):
- [SwiftLint](https://github.com/realm/SwiftLint) - a tool to enforce Swift style and conventions

## Features. First  Module
### First version
* Create taskManager, which manage tasks in app
### Second version
* Create MVC app to show tasks from manager in tableView
* Add repository to loadTasks
### Third version
* Move app to MVP architecture
* Add sortedManager to sort tasks
* Add sectionManager to work with tableViewSections
### Fourth version
* Move app to CleanSwift architecture
* Add Login screen
* Add module assemblers
* Add gitignore

## Features. Second  Module (Team Work)
### First version
- [x] Integrate SwiftLint into the project
- [x] Cover the following classes with tests: TaskManager, Task, RegularTask, ImportantTask
### Second version
- [x] Create SPM package and move all the business logic into it
- [x] Write tests for TaskRepository and SectionManager
### Third version
- [x] Cover the authorization VIP cycle with tests
- [x] Cover the task list VIP cycle with tests
### Forth version
- [x] Get rid of the storyboard
- [x] Enable PinLayout usage via SPM
- [x] Layout both scenes using PinLayout concise syntax
### Fifth version
- [x] Cover two scenes with UI tests
- [x] Continuos Integration (CI) included into the project. It helps in stabilizing the git flow and makes sure that tests run outcome is successfull and the project compiles before merging


## Setup
* Clone
* Open .xcodeproj file
* Run simulator
