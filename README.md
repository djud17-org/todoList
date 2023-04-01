# taskManager

The main objective is to create a tiny task manager application for managing tasks on iOS devices.

## Stack
- Swift
- CleanSwift
- UIKit
- XCTest
	- The App is fully test covered
- OOP/POP
- Swift Package Manager
	- All business logic is carried away in the separate package - TaskManagerPackage
- SwiftLint (SPM)
- PinLayout

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
- [ ] Layout both scenes using PinLayout concise syntax

## Setup
* Clone
* Open .xcodeproj file
* Run simulator
