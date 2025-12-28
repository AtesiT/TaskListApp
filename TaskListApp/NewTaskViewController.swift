import UIKit

final class NewTaskViewController: UIViewController {
    private lazy var taskTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "New Task"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        //  Установка атрибутов для кнопки
        var attributes = AttributeContainer()
        attributes.font = UIFont.boldSystemFont(ofSize: 18)
        
        //  Создание кнопки
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.baseBackgroundColor = .milkBlue
        buttonConfig.attributedTitle = AttributedString("Save Task", attributes: attributes)
        
        let button = UIButton(configuration: buttonConfig, primaryAction: UIAction {[unowned self] _ in
            save()
        })
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var cancelButton: UIButton = {
        //  Установка атрибутов для кнопки
        var attributes = AttributeContainer()
        attributes.font = UIFont.boldSystemFont(ofSize: 18)
        
        //  Создание кнопки
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.baseBackgroundColor = .milkRed
        buttonConfig.attributedTitle = AttributedString("Cancel", attributes: attributes)
        
        let button = UIButton(configuration: buttonConfig, primaryAction: UIAction {[unowned self] _ in
            dismiss(animated: true)
        })
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupSubviews(taskTextField, saveButton, cancelButton)
        setConstraints()
    }
    
    private func save() {
        
        dismiss(animated: true)
    }
    
}

//  MARK: - Setup UI
private extension NewTaskViewController {
    func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate(
            [
                taskTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
                taskTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                taskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
                
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                saveButton.topAnchor.constraint(equalTo: taskTextField.bottomAnchor, constant: 20),
                saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
                
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                cancelButton.topAnchor.constraint(equalTo:  saveButton.bottomAnchor, constant: 20),
                cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
                
            ]
        )
    }
}


#Preview {
    NewTaskViewController()
}
