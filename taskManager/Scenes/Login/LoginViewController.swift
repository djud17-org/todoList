//
//  LoginViewController.swift
//  taskManager
//
//  Created by Давид Тоноян  on 22.02.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ILoginDisplayLogic: AnyObject {

	/// Функция рендерит вью по модели.
	/// - Parameter viewModel: модель для отображения.
	func renderData(with viewModel: LoginModel.ViewModel)
}

final class LoginViewController: UIViewController {

	// MARK: - Outlets

	private let loginTextField: UITextField = {
		let textField = UITextField()
		textField.placeholder = "Введите логин"
		textField.borderStyle = .roundedRect
		textField.translatesAutoresizingMaskIntoConstraints = false

		return textField
	}()

	private let passwordTextField: UITextField = {
		let textField = UITextField()
		textField.placeholder = "Введите пароль"
		textField.borderStyle = .roundedRect
		textField.translatesAutoresizingMaskIntoConstraints = false

		return textField
	}()

	private let loginButton: UIButton = {
		let button = UIButton()
		button.setTitle("Login", for: .normal)
		button.layer.cornerRadius = 10
		button.backgroundColor = Constants.Color.lightBlue
		button.setTitleColor(.white, for: .normal)
		button.setTitleColor(.white.withAlphaComponent(0.5), for: .highlighted)
		button.translatesAutoresizingMaskIntoConstraints = false

		return button
	}()

	// MARK: - Parameters

	private let interactor: ILoginBusinessLogic
	var router: ILoginRoutingLogic?

	var loginText: String {
		get {
			loginTextField.text ?? ""
		}

		set {
			loginTextField.text = newValue
		}
	}

	var passText: String {
		get {
			passwordTextField.text ?? ""
		}

		set {
			passwordTextField.text = newValue
		}
	}

	// MARK: - Inits

	init(interactor: ILoginBusinessLogic) {
		self.interactor = interactor

		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - ViewController Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()

		setupLayout()
	}

	// MARK: - Private funcs

	private func setupView() {
		view.addSubview(loginTextField)
		view.addSubview(passwordTextField)
		view.addSubview(loginButton)

		view.backgroundColor = Constants.Color.white

		loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
	}

	private func setupLayout() {
		let largeOffset = Constants.Offset.largeOffset
		let smallOffset = Constants.Offset.smallOffset
		let fieldHeight = Constants.Size.fieldHeight
		NSLayoutConstraint.activate([
			loginTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
			loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: largeOffset),
			loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -largeOffset),
			loginTextField.heightAnchor.constraint(equalToConstant: fieldHeight),

			passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: smallOffset),
			passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: largeOffset),
			passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -largeOffset),
			passwordTextField.heightAnchor.constraint(equalToConstant: fieldHeight),

			loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: largeOffset),
			loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: largeOffset),
			loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -largeOffset),
			loginButton.heightAnchor.constraint(equalToConstant: fieldHeight)
		])
	}

	// MARK: - Actions

	@objc private func loginButtonTapped() {
		let request = LoginModel.Request(login: loginText, password: passText)
		interactor.login(request: request)
	}
}

extension LoginViewController: ILoginDisplayLogic {
	func renderData(with viewModel: LoginModel.ViewModel) {
		switch viewModel {
		case .success:
			router?.navigateToMainScreen()
		case .failure(let errorMessage):
			router?.showError(errorMessage: errorMessage)
		}
	}
}
