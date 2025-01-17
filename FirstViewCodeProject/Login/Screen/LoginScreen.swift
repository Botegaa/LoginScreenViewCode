//
//  LoginScreen.swift
//  FirstViewCodeProject
//
//  Created by Pedro Botega on 02/08/24.
//

import UIKit
import SnapKit

protocol LoginScreenProtocol : AnyObject {
    func tappedLoginButton()
}

class LoginScreen: UIView{
    
    private weak var delegate: LoginScreenProtocol?
    
    public func delegate(delegate: LoginScreenProtocol?){
        self.delegate = delegate
    }
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Login"
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.placeholder = "Digite Seu Email:"
        tf.textColor = .darkGray
        return tf
    }()
   
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Digite Sua Senha:"
        tf.textColor = .darkGray
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let button : UIButton = UIButton()
        button.setTitle("Logar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray.withAlphaComponent(0.8)
        button.isEnabled = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedLoginButton(_ sender: UIButton){
        print("SIUUU")
        delegate?.tappedLoginButton()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBlue
        addElements()
        configLoginLabelConstraints()
        configEmailTextFieldConstraints()
        configPasswordTextFieldConstraints()
        configLoginButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements(){
        addSubview(loginLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
    }
  
    
    private func configLoginLabelConstraints(){
        loginLabel.snp.makeConstraints{make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    private func configEmailTextFieldConstraints(){
        emailTextField.snp.makeConstraints{make in
            make.top.equalTo(loginLabel.snp.bottom).offset(45)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
    }
    
    private func configPasswordTextFieldConstraints(){
        passwordTextField.snp.makeConstraints{make in
            make.top.equalTo(emailTextField.snp.bottom).offset(25)
            make.leading.equalTo(emailTextField.snp.leading)
            make.trailing.equalTo(emailTextField.snp.trailing)
            make.height.equalTo(emailTextField)
        }
    }
    
    private func configLoginButtonConstraints(){
        loginButton.snp.makeConstraints{make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(50)
            make.leading.equalTo(emailTextField)
            make.trailing.equalTo(emailTextField)
            make.height.equalTo(emailTextField)
        }
    }
    
    public func configTextFieldDelegate(delegate : UITextFieldDelegate){
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
}
