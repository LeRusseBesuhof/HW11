import Foundation

struct ReusableViewItem : Identifiable {
    var id : String = UUID().uuidString
    let title : String
    var buttonImage : String?
    var buttonText : String?
    var footerText : String?
    
    static func getMockData() -> [ReusableViewItem] {
        [
            ReusableViewItem(title: "Devices", buttonImage: "apple", footerText: "Apple Inc. is a technology company. It designs, develops, and sells consumer electronics, computer software, and online services."),
            ReusableViewItem(title: "Topics", buttonText: "see more"),
            ReusableViewItem(title: "Contacts", buttonText: "show all")
        ]
    }
}
