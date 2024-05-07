import Foundation

struct MainPageSection : Identifiable {
    var id :  String = UUID().uuidString
    let header : String
    var footer : String?
    let group : [MainPageItem]
    
    internal static func getMockData() -> [MainPageSection] {
        
        let devicesGroup = [
            MainPageItem(image: "iphone", text: "The iPhone is a line of smartphones produced by Apple", title: "iPhone"),
            MainPageItem(image: "mac", text: "MacBook is a brand of Mac notebook computers designed and marketed by Apple", title: "MacBook"),
            MainPageItem(image: "airpods", text: "AirPods are wireless Bluetooth earbuds designed by Apple", title: "AirPods")
        ]
        
        let topicsGroup = [
            MainPageItem(image: "label", text: "UILabel: displays one or more lines of informational text."),
            MainPageItem(image: "textfield", text: "UITextField: displays an editable text area in your interface."),
            MainPageItem(image: "textview", text: "UITextView: scrollable, multiline text region."),
            MainPageItem(image: "button", text: "UIButton: control that executes your custom code in response to user interactions."),
            MainPageItem(image: "image", text: "UIImageView: displays a single image or a sequence of animated images in your interface."),
            MainPageItem(image: "stack", text: "UIStackView: streamlined interface for laying out a collection of views in either a column or a row."),
            MainPageItem(image: "table", text: "UITableView presents data using rows in a single column."),
            MainPageItem(image: "collection", text: "UICollectionView: manages an ordered collection of data items and presents them using customizable layouts."),
            MainPageItem(image: "header", text: "UICollectionReusableView: defines the behavior for all cells and supplementary views presented by a collection view."),
        ]
        
        let usersGroup = [
            MainPageItem(image: "swift", text: "Learn Swift with free YouTube course", title: "Alex Skutarenko"),
            MainPageItem(image: "islam", text: "Error=nil school. Learn UIKit, Development and SwiftUI", title: "Islam"),
            MainPageItem(image: "dushnila", text: "Funny Flutter developer and his YouTube chanel", title: "Dushnila")
        ]
        
        let devicesSection = MainPageSection(header: "Devices", group: devicesGroup)
        let topicsSection = MainPageSection(header: "Topics", group: topicsGroup)
        let usersSection = MainPageSection(header: "Users", group: usersGroup)
        
        return [devicesSection, topicsSection, usersSection]
    }
}
