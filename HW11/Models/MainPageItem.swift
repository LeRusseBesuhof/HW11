import Foundation

struct MainPageItem : Identifiable {
    var id: String = UUID().uuidString
    let image: String
    let text: String
    var title: String?
    var date: DateComponents?
}
