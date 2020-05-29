import SwiftUI

class ViewModel : ObservableObject{
    @Published var photos : [Model] = [Model]()
    
    init(){
        fetchData()
    }
    
    func fetchData(){
        photos.append(Model(name: "Image1", index: 1))
        photos.append(Model(name: "Image2", index: 2))
        photos.append(Model(name: "Image3", index: 3))
        photos.append(Model(name: "Image4", index: 4))
        photos.append(Model(name: "Image5", index: 5))
        photos.append(Model(name: "Image6", index: 6))
        photos.append(Model(name: "Image7", index: 7))
        photos.append(Model(name: "Image8", index: 8))
    }
}


struct Model : Identifiable, Hashable{
    var id = UUID()
    var name : String
    var index : Int
}
