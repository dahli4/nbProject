import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var editButton: UIBarButtonItem!
    @IBOutlet var addButton: UIBarButtonItem!
    var doneButton: UIBarButtonItem?
    var taskMange = TaskMange()
    var tasks = [Task]() {
        didSet {
            taskMange.saveTasks(tasks)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTap))
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tasks = taskMange.loadTasks()
    }
    
    @objc func doneButtonTap(){
        self.navigationItem.leftBarButtonItem = self.editButton
        self.tableView.setEditing(false, animated: true)
        self.addButton.isEnabled = true
    }
    
    @IBAction func tapEditButton(_ sender: UIBarButtonItem) {
        guard !self.tasks.isEmpty else { return }
        self.navigationItem.leftBarButtonItem = self.doneButton
        self.tableView.setEditing(true, animated: true)
        self.addButton.isEnabled = false
    }
    
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "할 일 등록", message: nil, preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "등록", style: .default, handler: { [weak self] _ in
            guard let title = alert.textFields?[0].text,
                  let category = alert.textFields?[1].text else { return }
            let task = Task(title: title, done: false, category: category)
            self?.tableView.setEditing(false, animated: true)
            self?.tasks.append(task)
            self?.tableView.reloadData()
        })

        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        alert.addTextField(configurationHandler: {textField in
            textField.placeholder = "할 일을 입력해주세요."
        })
        alert.addTextField { textField in
                textField.placeholder = "카테고리를 입력해주세요."
        }
        self.present(alert, animated: true, completion: nil)
    }
    

}
