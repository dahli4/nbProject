import Foundation
class TaskMange {
    func saveTasks(_ tasks: [Task]) {
        let data = tasks.map {
            [
                "title": $0.title,
                "done": $0.done,
                "category": $0.category
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(data, forKey: "tasks")
    }
    
    func loadTasks() -> [Task] {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "tasks") as? [[String: Any]] else { return [] }
        return data.compactMap{
            guard let title = $0["title"] as? String else { return nil }
            guard let done = $0["done"] as? Bool else { return nil }
            guard let category = $0["category"] as? String else { return nil }
            
            return Task(title: title, done: done, category: category)
        }
    }
}
