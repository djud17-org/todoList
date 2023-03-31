//
//  TaskListInteractorSpy.swift
//  taskManagerTests
//
//  Created by Alexey Radomskiy on 30.03.2023.
//

import Foundation
@testable import taskManager

final class TaskListInteractorSpy: ITaskListBusinessLogic {
	private(set) var viewIsReadyCalled = false
	private(set) var didTaskSelectedCalled = false
	private(set) var selectedTaskIndexPath: IndexPath?

	func viewIsReady() {
		viewIsReadyCalled = true
	}

	func didTaskSelected(at indexPath: IndexPath) {
		didTaskSelectedCalled = true
		selectedTaskIndexPath = indexPath
	}
}
