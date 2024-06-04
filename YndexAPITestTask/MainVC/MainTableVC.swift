import UIKit

class MainTableVC: UITableViewController {
    
    //  MARK: - Properties
    private let networking = NetworkingManager()

    //  MARK: - Lifecycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNetworkManager()
    }
    
    //  MARK: - Methods
    private func setupTableView() {
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.cellID)
    }
        
    private func setupNetworkManager() {
        networking.getCoordinateFor(city: "Yuzhno-Sakhalinsk")
        networking.getDataFrom(latitude: 55.75396, longitude: 37.620393)
    }
    
    // MARK: - TableView dataSourse
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.cellID, for: indexPath) as! CustomCell
        return cell
    }
}

