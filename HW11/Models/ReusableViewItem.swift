import Foundation

struct ReusableViewItem : Identifiable {
    var id : String = UUID().uuidString
    let title : String
    var buttonImage : String?
    var buttonText : String?
    
    static func getMockData() -> [ReusableViewItem] {
        [
            ReusableViewItem(title: "Devices", buttonImage: "device"),
            ReusableViewItem(title: "Topics", buttonText: "see more"),
            ReusableViewItem(title: "Devices", buttonText: "show all")
        ]
    }
}
