//
//  ViewController.swift
//  taskManager
//
//  Created by Давид Тоноян  on 12.02.2023.
//

import UIKit

final class TaskListViewController: UITableViewController {
	// MARK: - Parameters

	private var viewData: TaskListModel.ViewModel = .init(tasksBySections: [])
	var interactor: ITaskListBusinessLogic?

	// MARK: - ViewController Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()

		setupView()
		setupTableView()
		interactor?.viewIsReady()
	}

	// MARK: - Setups

	private func setupView() {
		navigationItem.title = "Список задач"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationController?.navigationBar.largeTitleTextAttributes = [
			NSAttributedString.Key.foregroundColor: Constants.Color.white
		]
		navigationController?.navigationBar.tintColor = Constants.Color.white

		view.backgroundColor = Constants.Color.blue
	}

	private func setupTableView() {
		tableView.separatorStyle = .none

		tableView.register(
			ImportantTaskTableViewCell.self,
			forCellReuseIdentifier: ImportantTaskTableViewCell.identifier
		)
		tableView.register(
			RegularTaskTableViewCell.self,
			forCellReuseIdentifier: RegularTaskTableViewCell.identifier
		)
	}
}

// MARK: - TableView DataSource

extension TaskListViewController {
	override func numberOfSections(in tableView: UITableView) -> Int {
		viewData.tasksBySections.count
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		viewData.tasksBySections[section].tasks.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let tasks = viewData.tasksBySections[indexPath.section].tasks
		let taskData = tasks[indexPath.row]

		let model: ICellViewAnyModel
		switch taskData {
		case let .regularTask(task):
			model = RegularTaskCellModel(
				taskStatus: task.taskStatus,
				taskName: task.title
			)
		case let .importantTask(task):
			model = ImportantTaskCellModel(
				taskStatus: task.taskStatus,
				taskPriority: task.priority,
				taskName: task.title,
				taskDeadline: task.deadLine,
				taskIsOverdue: task.isOverdue
			)
		}

		return tableView.dequeueReusableCell(withModel: model, for: indexPath)
	}
}

// MARK: - TableView Delegate

extension TaskListViewController {
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		Constants.Size.tableViewRowHeight
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		interactor?.didTaskSelected(at: indexPath)
		tableView.deselectRow(at: indexPath, animated: true)
	}

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		viewData.tasksBySections[section].title
	}
}

protocol ITaskListDisplayLogic: AnyObject {
	/// Функция для "общения" с view.
	func render(viewData: TaskListModel.ViewModel)
}

extension TaskListViewController: ITaskListDisplayLogic {
	func render(viewData: TaskListModel.ViewModel) {
		self.viewData = viewData
		tableView.reloadData()
	}
}
