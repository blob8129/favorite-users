//
//  ViewController.swift
//  FavoriteUsers
//
//  Created by Andrey Volobuev on 21/07/2021.
//

import UIKit

final class LoginViewController: UIViewController, LoginViewProtocol, KeyboardStateObserverDelegate {
    
    private let interactor: LoginInteractorInput
    
    private var bottomConstraint: NSLayoutConstraint?
    private lazy var keyboardStateObserver: KeyboardStateObserver = { kso in
        kso.delegate = self
        return kso
    }(KeyboardStateObserver())
    
    private lazy var loginView: DoubleTextFieldView = {
        let padding = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        let dtv = DoubleTextFieldView(textFieldsPadding: padding, cornerRadius: 6)
        dtv.translatesAutoresizingMaskIntoConstraints = false
        dtv.applyLoginStyle()
        dtv.isButtonEnabledRule = { lgn, pwd in !lgn.isEmpty && !pwd.isEmpty }
        dtv.button.addTarget(self, action: #selector(loghInAction(sender:)), for: .touchUpInside)
        return dtv
    }()
    
    init(interactor: LoginInteractorInput) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        keyboardStateObserver.start()
        loginView.textField1.becomeFirstResponder()
        addAllSubviews()
    }
    
    func addAllSubviews() {
        let loginViewContainer = UIView()
        loginViewContainer.translatesAutoresizingMaskIntoConstraints = false
        
        loginViewContainer.addSubview(loginView)
        view.addSubview(loginViewContainer)

        bottomConstraint = view.bottomAnchor.constraint(equalTo: loginViewContainer.bottomAnchor)
        bottomConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            loginViewContainer.leftAnchor.constraint(equalTo: view.leftAnchor),
            loginViewContainer.topAnchor.constraint(equalTo: view.topAnchor),
            view.rightAnchor.constraint(equalTo: loginViewContainer.rightAnchor),
            
            loginView.centerYAnchor.constraint(equalTo: loginViewContainer.centerYAnchor,
                                               constant: 68),
            loginViewContainer.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),

            loginView.widthAnchor.constraint(equalTo: loginViewContainer.widthAnchor,
                                             multiplier: 0.8)
        ])
    }
    
    // MARK: KeyboardStateObserverDelegate
    func keyboardDidChangeState(to state: KeyboardState) {
        switch state {
        case .visible(let frame):
            bottomConstraint?.constant = frame.height
        case .hidden:
            bottomConstraint?.constant = 0
        }
    }
    
    // MARK: Actions
    @objc func loghInAction(sender: UIButton) {
        interactor.logIn(username: loginView.textField1.text ?? "",
                         password: loginView.textField2.text ?? "")
    }
    
    // MARK: LoginViewProtocol
    func renderSuccess(complition: @escaping () -> Void) {
        DispatchQueue.main.async {
            complition()
        }
    }
    
    func showError(description: String) {
        
    }
}
