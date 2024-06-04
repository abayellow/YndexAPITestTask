import UIKit

struct NetworkModel: Decodable {
    let fact: Fact
}

struct Fact: Decodable {
    let temp: Int
    let condition: String
}
