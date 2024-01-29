import Foundation
import UIKit

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Task.categories.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
        let textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 20))
        textLabel.text = Task.categories[section]
        textLabel.textColor = UIColor.white
        view.backgroundColor = .brown
        view.addSubview(textLabel)
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let category = Task.categories[section]
        return self.tasks.filter { $0.category == category }.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let category = Task.categories[indexPath.section]
        let tasksInSection = self.tasks.filter { $0.category == category }
        let task = tasksInSection[indexPath.row]
        cell.textLabel?.text = task.title
        if task.done {
            cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let category = Task.categories[indexPath.section]
            let tasksInSection = self.tasks.filter { $0.category == category }
            let taskToDelete = tasksInSection[indexPath.row]
            
            if let indexToDelete = self.tasks.firstIndex(of: taskToDelete) {
                self.tasks.remove(at: indexToDelete)
                tableView.deleteRows(at: [indexPath], with: .fade)
                
                if self.tasks.isEmpty {
                    self.doneButtonTap()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var tasks = self.tasks
        let task = tasks[sourceIndexPath.row]
        tasks.remove(at: sourceIndexPath.row)
        tasks.insert(task, at: destinationIndexPath.row)
        self.tasks = tasks
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var task = self.tasks[indexPath.row]
        task.done = !task.done
        self.tasks[indexPath.row] = task
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
