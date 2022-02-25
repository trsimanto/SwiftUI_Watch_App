//
//  ContentView.swift
//  SwiftUI Watch App UI
//
//  Created by MacBook Pro on 11/2/22.
//

import SwiftUI


struct ContentView: View {
    @State var detail : Bool = false
    //init
    @State var detailData : Watch = data [0]
    var body: some View {
        ZStack{
            Details(detailData: self.$detailData, detail: self.$detail)
            //expanding view when ever details view is tapped
                .frame(width: self.detail ? nil : 100 , height: self.detail ? nil : 100 )
                .opacity(self.detail ? 1 : 0)
            
            
            //hiding main view when details view is visiable
            Home(detailData: self.$detailData, detail: self.$detail)
                .opacity(self.detail ? 0 : 1)
        }.animation(.default)
           // for changes status bar color 
            .preferredColorScheme(self.detail ? .dark : .light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct Home : View {
    
    @State var index = "All"
    @State var tab = 0
    @Binding var detailData : Watch
    @Binding var detail : Bool
    var bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom
    
    var body: some View{
        ZStack{
            Color.black.opacity(0.06).edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    Button(action: {
                        
                    }){
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                    }
                    Spacer()
                    Button(action: {
                        
                    }){
                        Image(systemName: "cart")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical)
                
                HStack{
                    VStack(alignment: .leading, spacing: 10
                    ){
                        Text("Welcome!")
                        Text("Descover")
                            .font(.title)
                            .fontWeight(.bold)
                        
                    }.foregroundColor(.black)
                    Spacer()
                    Button(action:{
                        
                    }){
                        Image(systemName: "magnifyingglass")
                            .font(.title)
                            .foregroundColor(.black)
                        
                    }
                    
                }
                .padding()
                ScrollView(.horizontal,showsIndicators: false
                ){
                    HStack(spacing: 25){
                        ForEach(menu, id: \.self){ i in
                            
                            Button(action: {
                                self.index = i
                            }){
                                Text(i).foregroundColor(
                                    self.index == i ?
                                    Color("orangeColor"):
                                        Color.black.opacity(0.6))
                                    .fontWeight(.bold)
                            }
                        }
                    }.padding(.horizontal)
                }
                ScrollView(.horizontal,showsIndicators: false
                ){
                    HStack(spacing: 25){
                        ForEach(data, id: \.self){ i in
                            ZStack(alignment: .bottom){
                                Color("blackColor").frame(height: UIScreen.main.bounds.height / 3)
                                    .cornerRadius(20)
                                VStack(spacing: 15){
                                    Image(i.image)
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width/1.7).onTapGesture {
                                            // assiging data when ever image is clicked
                                            self.detailData = i
                                            self.detail.toggle()
                                        }
                                    HStack{
                                        
                                        VStack(alignment:.leading, spacing:12){
                                            Text(i.title)
                                            Text("Apple Watch")
                                                .fontWeight(.bold)
                                                .font(.title)
                                        }
                                        .foregroundColor(.white)
                                        
                                        Spacer(minLength: 0)
                                        
                                        Button(action: {
                                            
                                        }){
                                            Image(systemName: "plus")
                                                .font(.title)
                                                .foregroundColor(.white)
                                                .padding()
                                                .background(Color("orangeColor"))
                                                .clipShape(Circle())
                                        }
                                        
                                    }
                                    
                                }
                                .padding(.horizontal)
                                .padding(.bottom)
                                
                            }
                        }
                    }.padding(.horizontal,20)
                        .padding(.vertical, 25)
                }
                HStack{
                    Button(
                        action:{
                            self.tab = 0
                        }){
                            Image(systemName: "suit.heart.fill")
                                .font(.title)
                                .foregroundColor(self.tab == 0 ? .black : Color.black.opacity(0.25))
                        }
                    Spacer(minLength: 0)
                    Button(
                        action:{
                            self.tab = 1
                        }){
                            Image(systemName: "safari")
                                .font(.title)
                                .foregroundColor(self.tab == 1 ? .black : Color.black.opacity(0.25))
                        }
                    Spacer(minLength: 0)
                    Button(
                        action:{
                            self.tab = 2
                        }){
                            Image(systemName: "person.circle")
                                .font(.title)
                                .foregroundColor(self.tab == 2 ? .black : Color.black.opacity(0.25))
                        }
                }
                .padding(.horizontal,30)
                .padding(.top, 25)
                .padding(.bottom,self.bottom ?? 0 == 0 ? 15 : self.bottom ?? 0 + 10 )
                .background(Color.white)
                .clipShape(CShape())
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    

    struct CShape : Shape {
          func path(in rect:CGRect) -> Path {
              let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 45, height: 45))
              return Path(path.cgPath)
          }
      }

    
}

struct Details : View {
    var bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom
    @State var txt = ""
    // sample for design
    @Binding var detailData : Watch //= data[0]
    @Binding var detail : Bool
    @State var index = 0
    var body: some View{
        ZStack{
            Color("blackColor").edgesIgnoringSafeArea(.all)
            VStack{
                
                HStack{
                    Button(action: {
                        
                    }){
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                    Spacer()
                    Button(action: {
                        
                    }){
                        Image(systemName: "cart")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical)
                
                HStack(spacing: 15){
                    Image(systemName: "magnifyingglass")
                        //.font(.title)
                        .foregroundColor(.gray)
                    TextField("Want to search anything",text: self.$txt)
                    
                    
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                HStack{
                    VStack(alignment: .leading, spacing: 10){
                        Text(self.detailData.title)
                        Text("Apple Watch Series 5")
                            .font(.title)
                            .fontWeight(.bold)
                    }.foregroundColor(.white)
                    
                    Spacer()
                }
                .padding(.vertical)
                HStack{
                    VStack(alignment: .leading, spacing: 12){
                        Text("Color")
                            .foregroundColor(Color.white.opacity(0.6))
                        Text(self.detailData.color)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Price")
                            .foregroundColor(Color.white.opacity(0.6))
                            .padding(.top)
                        Text(self.detailData.price)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                    }
                    .offset(y: -50)
                    Spacer(minLength: 0)
                    Image(self.detailData.image)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 2.5 )
                        .rotationEffect(.init(degrees: 10.0))
                    
                }.padding(.horizontal)
                .padding(.bottom,-60)
                    .zIndex(5)
                ZStack(alignment: .topLeading){
                    VStack{
                        // for phone having lesser screen size
                        ScrollView(
                            UIScreen.main.bounds.height < 750 ? .vertical : .init()
                                   ,showsIndicators: false){
                            VStack{
                                HStack(spacing: 0){
                                    Button(action:{
                                        self.index = 0
                                    }){
                                        Text("Details")
                                            .foregroundColor(self.index == 0 ? .white : Color.black.opacity(0.6))
                                            .padding(.vertical,10)
                                            .padding(.horizontal,10)
                                            .background(self.index == 0 ? Color("orangeColor") : Color.clear)
                                            .cornerRadius(8)
                                        
                                    }
                                    
                                    Button(action:{
                                        self.index = 1
                                    }){
                                        Text("Description")
                                            .foregroundColor(self.index == 1 ? .white : Color.black.opacity(0.6))
                                            .padding(.vertical,10)
                                            .padding(.horizontal,10)
                                            .background(self.index == 1 ? Color("orangeColor") : Color.clear)
                                            .cornerRadius(8)
                                        
                                    }
                                    Spacer()
                                }
                                if self.index == 0 {
                                    HStack(spacing: 20){
                                                                        VStack(spacing: 12){
                                                                            Text("15mm")
                                                                                .font(.title)
                                                                                .fontWeight(.bold)
                                                                                .foregroundColor(Color.black.opacity(0.8))
                                                                            
                                                                            Text("Strip Width")
                                                                                .foregroundColor(Color.black.opacity(0.4))
                                                                        }
                                                                        
                                                                        VStack(spacing: 12){
                                                                            Text("Leather")
                                                                                .font(.title)
                                                                                .fontWeight(.bold)
                                                                                .foregroundColor(Color.black.opacity(0.8))
                                                                            
                                                                            Text("Strip material")
                                                                                .foregroundColor(Color.black.opacity(0.4))
                                                                        }

                                                                        VStack(spacing: 12){
                                                                            Text("50m")
                                                                                .font(.title)
                                                                                .fontWeight(.bold)
                                                                                .foregroundColor(Color.black.opacity(0.8))
                                                                            
                                                                            Text("Water resist")
                                                                                .foregroundColor(Color.black.opacity(0.4))
                                                                        }

                                                                    }
                                                                    .padding(.top)
                                } else{
                                Text("The Apple Watch Series 5 features a new always-on display, build-in compass for advanced navigration features and a titnaium case option.")
                                    .foregroundColor(.black)
                                    .padding(.top)
                                }
                            }.padding(.horizontal,25)
                        }.padding(.top,50)
                        HStack{
                            Button(action: {
                                
                            }){
                                Text("Add to Cart")
                                    .foregroundColor(.white)
                                    .padding(.vertical)
                                    .frame(width: UIScreen.main.bounds.width / 1.5 )
                                    .background(Color("orangeColor"))
                                    .cornerRadius(10)
                            }.shadow(radius: 5)
                            Spacer(minLength: 0)
                            Button(action: {
                                //closing the detail view when close button is clicked
                                self.detail.toggle()
                            }){
                                Image(systemName: "xmark")
                                    .font(.title)
                                    .foregroundColor(Color.black.opacity(0.8))
                                    .padding(.horizontal)
                            }
                            
                            
                        }.padding(.top , 10).padding(.horizontal, 25)
                            .padding(.bottom,self.bottom ?? 0 == 0 ? 15 : self.bottom ?? 0 )
                    }                .background(Color.white)
                        .clipShape(CShape())

                    Button(action: {
                        
                    }){
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 30, height: 30).foregroundColor(Color.white)
                            .padding()
                            .background(Color("orangeColor"))
                            .clipShape(Circle())
                    }.padding(.leading,50
                    ).offset( y: -35)
                    
                }
            }.padding(.horizontal)
        }
        .edgesIgnoringSafeArea(.bottom)
    }


    struct CShape : Shape {
          func path(in rect:CGRect) -> Path {
              let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 45, height: 45))
              return Path(path.cgPath)
          }
      }

}
//menu buttons....

var menu = ["All","CLASSIC","GRAND","FORMAL","ORIGINAL","TREND"]

struct Watch :Identifiable,Hashable {
    var id = Int()
    var color = String()
    var price = String()
    var image = String()
    var title = String()
    
}

var data = [
    Watch(id: 0, color: "Dark Black", price: "$500", image: "blackWatch", title: "Clasic Black"),
    Watch(id: 2, color: "Light Yellow", price: "$600", image: "yellowWatch", title: "Clasic Yellow"),
    Watch(id: 3, color: "Rose Gold", price: "$700", image: "goldWatch", title: "Clasic Gold"),
    Watch(id: 4, color: "Red", price: "$400", image: "redWatch", title: "Clasic Red"),
    Watch(id: 5, color: "White", price: "$300", image: "whiteWatch", title: "Clasic White"),
]
