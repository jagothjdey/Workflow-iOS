import SwiftUI
import GridStack

struct ContentView: View {
    @EnvironmentObject var data : ViewModel
    
    var body: some View {
        NavigationView{
            VStack{
                GeometryReader{g in
                    GridStack(minCellWidth: UIScreen.main.bounds.width/3-20, spacing: 3, numItems: self.data.photos.count){
                        index, cellWidth in
                        NavigationLink(destination: LazyView(List().environmentObject(Counter(index: index)))){
                            Text("\(self.data.photos[index].name)")
                                .frame(width : cellWidth, height: cellWidth)
                                .foregroundColor(.primary)
                                .background(Color.secondary)
                        }
                    }
                }
            }
            .padding(.vertical)
            
            .navigationBarTitle("Photo App")
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
}

class Counter : ObservableObject{
    @Published var id : Int = 0
    init(index : Int){
        self.id = index
    }
}

struct List : View{
    @EnvironmentObject var data : ViewModel
    @EnvironmentObject var indexTracker : Counter
    
    var body: some View{
        HStack(spacing : 0){
                ForEach(data.photos){ photo in
                    CardView(width : UIScreen.main.bounds.width, photo: photo)
                }
        }
            
        .navigationBarItems(trailing:
            Button(action:{
                self.data.photos.remove(at: self.indexTracker.id)
                print("tapped")
            }){
                Image(systemName: "trash").resizable().frame(width : 35, height: 35).foregroundColor(Color.red)
            }
        )
            
        .navigationBarTitle("", displayMode: .inline)
    }
}



struct CardView : View{
    @EnvironmentObject var data : ViewModel
    @EnvironmentObject var indexTracker : Counter
    var width : CGFloat
    var photo : Model
    
    var body: some View{
        VStack{
            VStack{
                Text(self.photo.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top,20)
                    .foregroundColor(Color.gray)
                
                Text("\(self.photo.index)")
                    .foregroundColor(Color.gray)
                    .padding(.vertical)
                
                Spacer(minLength: 0)
                
                Image(systemName: "person")
                    .resizable()
                    .frame(width : self.width - 100, height: 250)
                    .cornerRadius(20)
                    .foregroundColor(Color.white)
                
                Text("\(self.photo.id)")
                    .fontWeight(.medium)
                    .font(.title)
                    .padding(.top,20)
                    .foregroundColor(Color.gray)
                
                Button(action : {
                    
                }){
                    Text("Buy")
                        .padding(.horizontal,30)
                        .padding(.vertical,10)
                        .foregroundColor(Color.gray)
                }
                .background(Color.yellow.opacity(0.3))
                .clipShape(Capsule())
                .padding(.top,20)
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal,20)
            .padding(.vertical,25)
            .background(Color.black)
            .cornerRadius(20)
        }
        .frame(width: self.width)
    }
}


struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
