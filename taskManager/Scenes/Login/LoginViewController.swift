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
import PinLayout

protocol ILoginDisplayLogic: AnyObject {

	/// Функция рендерит вью по модели.
	/// - Parameter viewModel: модель для отображения.
	func renderData(with viewModel: LoginModel.ViewModel)
}

final class LoginViewController: UIViewController {

	// MARK: - UI Elements

	private lazy var loginTextField: UITextField = createLoginTextField()
	private lazy var passwordTextField: UITextField = createPasswordTextField()
	private lazy var loginButton: UIButton = createLoginButton()

	// MARK: - Parameters

	private let interactor: ILoginBusinessLogic
	var router: ILoginRoutingLogic?

	var loginText: String {
		get { loginTextField.text ?? "" }
		set { loginTextField.text = newValue }
	}

	var passText: String {
		get { passwordTextField.text ?? "" }
		set { passwordTextField.text = newValue }
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

		setupView()
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()

		setupLayout()
	}

	// MARK: - Private Methods

	private func setupView() {
		view.addSubview(loginTextField)
		view.addSubview(passwordTextField)
		view.addSubview(loginButton)

		view.backgroundColor = Theme.white

		loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
	}

	private func setupLayout() {
		let largeOffset = Constants.Offset.largeOffset
		let smallOffset = Constants.Offset.smallOffset
		let fieldHeight = Constants.Size.fieldHeight
		let upperPadding = Constants.Padding.upperPadding

		loginTextField.pin
			.top(upperPadding)
			.left(largeOffset)
			.right(largeOffset)
			.height(fieldHeight)

		passwordTextField.pin.below(of: loginTextField)
			.marginTop(smallOffset)
			.left(largeOffset)
			.right(largeOffset)
			.height(fieldHeight)

		loginButton.pin.below(of: passwordTextField)
			.marginTop(largeOffset)
			.left(largeOffset)
			.right(largeOffset)
			.height(fieldHeight)
	}

	private func createLoginTextField() -> UITextField {
		let textField = UITextField()
		textField.placeholder = L10n.Authorization.Placeholder.login
		textField.borderStyle = .roundedRect

		return textField
	}

	private func createPasswordTextField() -> UITextField {
		let textField = UITextField()
		textField.placeholder = L10n.Authorization.Placeholder.password
		textField.borderStyle = .roundedRect

		return textField
	}

	private func createLoginButton() -> UIButton {
		let button = UIButton()
		button.setTitle(L10n.Authorization.Button.title, for: .normal)
		button.layer.cornerRadius = 10
		button.backgroundColor = Theme.blue
		button.setTitleColor(.white, for: .normal)
		button.setTitleColor(.white.withAlphaComponent(0.5), for: .highlighted)

		return button
	}

	// MARK: - Actions

	@objc private func loginButtonTapped() { login() }

	func login() {
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
