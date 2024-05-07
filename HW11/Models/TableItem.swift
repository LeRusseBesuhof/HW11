import Foundation

struct TableItem : Identifiable {
    var id : String = UUID().uuidString
    let image : String
    let name : String
    let text : String
    
    static func getMockData() -> [TableItem] {
        [
            TableItem(image: "swift", name: "Alex Skutarenko", text: "God be with you! Do your homework, learn Swift and you'll do well"),
            TableItem(image: "islam", name: "Islam", text: "Yeah, it's simpler than that)"),
            TableItem(image: "dushnila", name: "Dushnila", text: "Do you agree that AI will replace most of the programmers? "),
            TableItem(image: "gpt", name: "ChatGPT", text: "Now you need to implement UICollectionViewDataSource methods to display data in the collection and UICollectionViewDelegate methods to handle events in the collection"),
            TableItem(image: "ninja", name: "Digital Ninja", text: "Debates, S0ER vs Anton Nazarov\nOn Saturday, May 4, 12-00 Moscow time, on my channel, there will be a debate on the topic \"How to monetise the profession of \"programmer\"\""),
            TableItem(image: "anton", name: "Anton about IOS & Life", text: "YAY! We've started planning for the new video!"),
        ]
    }
}
