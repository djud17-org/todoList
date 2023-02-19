//
//  ViewController.swift
//  taskManager
//
//  Created by Давид Тоноян  on 12.02.2023.
//

import UIKit

final class TaskListViewController: UITableViewController {
	// MARK: - Parameters

	private let presenter: ITaskPresenter

	// MARK: - Inits

	init(presenter: ITaskPresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)

		self.presenter.delegate = self
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - ViewController Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()

		setupView()
		setupTableView()
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
		presenter.numberOfSections
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		presenter.getNumberOfRows(inSection: section)
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let model = presenter.getDataModel(forRowAt: indexPath) else { return UITableViewCell() }

		return tableView.dequeueReusableCell(withModel: model, for: indexPath)
	}
}

// MARK: - TableView Delegate

extension TaskListViewController {
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		50
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		presenter.cellTapped(at: indexPath)
		tableView.deselectRow(at: indexPath, animated: true)
	}

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		presenter.getTitle(forHeaderInSection: section)
	}
}

protocol IViewDelegate: AnyObject {
	/// Функция для "общения" с view
	func renderData()
}

extension TaskListViewController: IViewDelegate {
	func renderData() {
		tableView.reloadData()
	}
}
