import UIKit
import CoreData

final class TaskListViewController: UITableViewController {
    
    private var taskList: [ToDoTask] = []
    private let cellID = "task"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self , forCellReuseIdentifier: cellID)
        view.backgroundColor = .systemBackground
        setupNavigationBar()
        fetchData()
    }

    @objc private func addNewTask() {
        let newTaskVC = NewTaskViewController()
        present(newTaskVC, animated: true)
        
    }
    
    private func fetchData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let fetchRequest =  ToDoTask.fetchRequest()
        
        do {
            taskList = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print(error)
        }
        
    }
}

//  MARK: - UITableViewTableDataSource
extension TaskListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let toDoTask = taskList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = toDoTask.title
        cell.contentConfiguration = content
        return cell
    }
}

//  MARK: - Setup UI
private extension TaskListViewController {
    func setupNavigationBar() {
        title = "Task List"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //  Кастомизация внешнего вида NavigationBarAppearance
        let navBarAppearence = UINavigationBarAppearance()
        navBarAppearence.configureWithOpaqueBackground()
        
        navBarAppearence.backgroundColor = .milkBlue
        
        navBarAppearence.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearence.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = navBarAppearence
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearence
        
        //  Добавление кнопки в Navigation Bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addNewTask)
        )
        navigationController?.navigationBar.tintColor = .white
    }
}

