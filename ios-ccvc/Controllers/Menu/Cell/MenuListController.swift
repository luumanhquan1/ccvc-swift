import Foundation
import UIKit

class ViewControllerA: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var tableView: UITableView = UITableView()
    let animals = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
    let cellReuseIdentifier = "cell"

    override func viewDidLoad()
    {
        super.viewDidLoad()

        tableView.frame = CGRect(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

        self.view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return animals.count
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell? ?? <#default value#>

        cell.textLabel?.text = animals[indexPath.row]

        return cell
    }

    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath)
    {
        print("You tapped cell number \(indexPath.row).")
    }

}
