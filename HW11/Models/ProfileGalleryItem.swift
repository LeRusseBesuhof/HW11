import Foundation

struct ProfileGalleryItem : Identifiable {
    var id : String = UUID().uuidString
    let image : String
    
    static func getMockData() -> [ProfileGalleryItem] {
        [
            ProfileGalleryItem(image: "natural"),
            ProfileGalleryItem(image: "happy"),
            ProfileGalleryItem(image: "lovely"),
            ProfileGalleryItem(image: "dangerous"),
            ProfileGalleryItem(image: "musician"),
            ProfileGalleryItem(image: "bf"),
            ProfileGalleryItem(image: "train"),
            ProfileGalleryItem(image: "blyat"),
        ]
    }
}
