//
//  CoraTextField.swift
//  cora-ios-master
//
//  Created by Marcel Felipe Gottardi Anesi on 05/09/24.
//

import UIKit

enum CoraTextFieldType {
    case cpf
    case password
}

protocol CoraTextFieldDelegate: AnyObject {
    func textFieldDidComplete(_ textField: CoraTextField, isValid: Bool)
}

final class CoraTextField: UITextField {
    
    weak var customDelegate: CoraTextFieldDelegate?
    
    private let eyeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        button.tintColor = .pinkFE3E6D
        return button
    }()
    
    private var textFieldType: CoraTextFieldType
    private let textInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 40)
    private let rightViewInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
    
    init(type: CoraTextFieldType) {
        textFieldType = type
        super.init(frame: .zero)
        configureTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTextField() {
        delegate = self
        borderStyle = .none
        clearButtonMode = .whileEditing
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layer.cornerRadius = 16
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.grayC7CBCF.cgColor
        
        switch textFieldType {
            case .cpf:
                keyboardType = .numberPad
                addTarget(self, action: #selector(formatCPF), for: .editingChanged)
            case .password:
                isSecureTextEntry = true
                rightView = eyeButton
                rightViewMode = .always
                eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        }
    }
    
    func getUnformattedCPF() -> String? {
        guard let text = self.text else { return nil }
        return text.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
}

// MARK: - Functions
extension CoraTextField {
    
    private func formatCPFText(_ text: String) -> String {
        let cpfMask = "XXX.XXX.XXX-XX"
        var result = ""
        var index = text.startIndex
        
        for character in cpfMask {
            if index == text.endIndex { break }
            if character == "X" {
                result.append(text[index])
                index = text.index(after: index)
            } else {
                result.append(character)
            }
        }
        return result
    }
    
    private func validateText() {
        guard let text = self.text else {
            customDelegate?.textFieldDidComplete(self, isValid: false)
            return
        }
        
        let isValid: Bool
        switch textFieldType {
            case .cpf:
                isValid = isValidCPF(text)
            case .password:
                isValid = isValidPassword(text)
        }
        
        customDelegate?.textFieldDidComplete(self, isValid: isValid)
    }
    
    private func isValidCPF(_ cpf: String) -> Bool {
        let cpfRegex = "^[0-9]{3}\\.[0-9]{3}\\.[0-9]{3}-[0-9]{2}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", cpfRegex)
        return predicate.evaluate(with: cpf)
    }
    
    private func isValidPassword(_ password: String) -> Bool {
        return password.count > 5
    }
    
}

// MARK: - Actions
extension CoraTextField {
    
    @objc 
    private func formatCPF() {
        guard let text = self.text else { return }
        let filteredText = text.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let formattedText = formatCPFText(filteredText)
        self.text = formattedText
        validateText()
    }
    
    @objc 
    private func togglePasswordVisibility() {
        isSecureTextEntry.toggle()
        eyeButton.isSelected = !isSecureTextEntry
    }
    
}


// MARK: - UITextFieldDelegate
extension CoraTextField: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        validateText()
    }
    
}

// MARK: - Textfield Configuration
extension CoraTextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.x -= rightViewInsets.right
        return rect
    }
    
}
