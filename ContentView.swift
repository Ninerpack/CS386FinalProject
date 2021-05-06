import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = tenTenViewModel()
    
    private var colors: [Color] = [.gray, .blue, .red, .yellow, .green, .purple]
    
    struct MyDropDelegate: DropDelegate{
            var vm: tenTenViewModel
            var idx1: Int
            var idx2: Int
            var swapped = false
            func performDrop(info: DropInfo) -> Bool {
                let items = info.itemProviders(for: ["public.plain-text"])
                for item in items {
                    item.loadObject(ofClass: String.self) {data, _ in
                        let index = String(data!)
                        if(index == "FourSquareCube" && vm.Model.gameBoard[idx1][idx2].colorM == 0 && vm.Model.gameBoard[idx1][idx2 + 1].colorM == 0 &&
                            vm.Model.gameBoard[idx1 + 1][idx2].colorM == 0 &&
                            vm.Model.gameBoard[idx1 + 1][idx2 + 1].colorM == 0){
                            
                            DispatchQueue.main.async {
                                print("popped")
                                vm.Model.gameBoard[idx1][idx2].colorM = 2
                                vm.Model.gameBoard[idx1][idx2 + 1].colorM = 2
                                vm.Model.gameBoard[idx1 + 1][idx2].colorM = 2
                                vm.Model.gameBoard[idx1 + 1][idx2 + 1].colorM = 2
                            }


                        }
                        else if(index == "Square" && vm.Model.gameBoard[idx1][idx2].colorM == 0){
                            DispatchQueue.main.async {
                                print("popped")
                                vm.Model.gameBoard[idx1][idx2].colorM = 2
                            }
                            

                        }
                        else{
                            print("Object not implemented yet. Sorry")
                        }

                        }
                    }
                    print(!info.hasItemsConforming(to: ["public.plain-text"]))
                    return !info.hasItemsConforming(to: ["public.plain-text"])
                    }
        func dropUpdated(info: DropInfo) -> DropProposal? {
            return DropProposal(operation: .move)
        }
                
    }
    
    
    // this function creates the grid of squares
    struct SquareGrid: View{
        var color: Color
        var body: some View{
            RoundedRectangle(cornerRadius: 8)
                .fill(color)
                .frame(width:35, height: 35)

        }
    }
    
    // This function creates each puzzle square
    struct Square: View{
        var color: Color
        var body: some View{
            RoundedRectangle(cornerRadius: 8)
                .fill(color)
                .frame(width:30, height: 30)
        }
    }
    // Horizontal
    struct TwoSquare: View {
        var color: Color
        var body: some View {
            HStack(spacing: 2) {
                Square(color: color)
                Square(color: color)
            }
        }
    }
    // Horizontal
    struct ThreeSquare: View {
        var color: Color
        var body: some View {
            HStack(spacing: 2) {
                Square(color: color)
                Square(color: color)
                Square(color: color)
            }
        }
    }
    // Horizontal
    struct FourSquare: View {
        var color: Color
        var body: some View {
            HStack(spacing: 2) {
                Square(color: color)
                Square(color: color)
                Square(color: color)
                Square(color: color)
            }
        }
    }
    // Cube
    struct FourSquareCube: View {
        var color: Color
        var body: some View {
            VStack(spacing: 2) {
                HStack(spacing: 2) {
                    Square(color: color)
                    Square(color: color)
                }
                HStack(spacing: 2) {
                    Square(color: color)
                    Square(color: color)
                }
            }
        }
    }
    // Vertical
    struct TwoSquareVertical: View {
        var color: Color
        var body: some View {
            VStack(spacing: 2) {
                Square(color: color)
                Square(color: color)
            }
        }
    }
    // Vertical
    struct ThreeSquareVertical: View {
        var color: Color
        var body: some View {
            VStack(spacing: 2) {
                Square(color: color)
                Square(color: color)
                Square(color: color)
            }
        }
    }
    // Vertical
    struct FourSquareVertical: View {
        var color: Color
        var body: some View {
            VStack(spacing: 2) {
                Square(color: color)
                Square(color: color)
                Square(color: color)
                Square(color: color)
            }
        }
    }
    
    // L shape
    struct Lshape: View {
        var color: Color
        var body: some View {
            VStack(alignment: .leading,spacing: 2) {
                Square(color: color)
                Square(color: color)
                HStack(spacing: 2) {
                    Square(color: color)
                    Square(color: color)
                }
            }
        }
    }
    // Backward L shape
    struct BackwardLshape: View {
        var color: Color
        var body: some View {
            VStack(alignment: .trailing,spacing: 2) {
                Square(color: color)
                Square(color: color)
                HStack(spacing: 2) {
                    Square(color: color)
                    Square(color: color)
                }
            }
        }
    }
    // UpsideDown(UD) L shape
    struct UDLshape: View {
        var color: Color
        var body: some View {
            VStack(alignment: .leading,spacing: 2) {
                HStack(spacing: 2) {
                    Square(color: color)
                    Square(color: color)
                }
                Square(color: color)
                Square(color: color)

            }
        }
    }
    // UpsideDown(UD) Backward L shape
    struct UDBackwardLshape: View {
        var color: Color
        var body: some View {
            VStack(alignment: .trailing,spacing: 2) {
                HStack(spacing: 2) {
                    Square(color: color)
                    Square(color: color)
                }
                Square(color: color)
                Square(color: color)

            }
        }
    }
    // Small Top left corner
    struct STLcorner: View {
        var color: Color
        var body: some View {
            VStack(alignment: .leading,spacing: 2) {
                HStack(spacing: 2) {
                    Square(color: color)
                    Square(color: color)
                }
                Square(color: color)
            }
        }
    }
    // Small Top right corner
    struct STRcorner: View {
        var color: Color
        var body: some View {
            VStack(alignment: .trailing,spacing: 2) {
                HStack(spacing: 2) {
                    Square(color: color)
                    Square(color: color)
                }
                Square(color: color)

            }
        }
    }
    // Small Bottom left corner
    struct SBLcorner: View {
        var color: Color
        var body: some View {
            VStack(alignment: .leading,spacing: 2) {
                Square(color: color)
                HStack(spacing: 2) {
                    Square(color: color)
                    Square(color: color)
                }
            }
        }
    }
    // Small Bottom right corner
    struct SBRcorner: View {
        var color: Color
        var body: some View {
            VStack(alignment: .trailing,spacing: 2) {
                Square(color: color)
                HStack(spacing: 2) {
                    Square(color: color)
                    Square(color: color)
                }
            }
        }
    }
    
    // Big Top left corner
    struct BTLcorner: View {
        var color: Color
        var body: some View {
            VStack(alignment: .leading,spacing: 2) {
                HStack(spacing: 2) {
                    Square(color: color)
                    Square(color: color)
                    Square(color: color)
                }
                Square(color: color)
                Square(color: color)
            }
        }
    }
    // Big Top right corner
    struct BTRcorner: View {
        var color: Color
        var body: some View {
            VStack(alignment: .trailing,spacing: 2) {
                HStack(spacing: 2) {
                    Square(color: color)
                    Square(color: color)
                    Square(color: color)
                }
                Square(color: color)
                Square(color: color)

            }
        }
    }
    // Big Bottom left corner
    struct BBLcorner: View {
        var color: Color
        var body: some View {
            VStack(alignment: .leading,spacing: 2) {
                Square(color: color)
                Square(color: color)
                HStack(spacing: 2) {
                    Square(color: color)
                    Square(color: color)
                    Square(color: color)
                }
            }
        }
    }
    // Big Bottom right corner
    struct BBRcorner: View {
        var color: Color
        var body: some View {
            VStack(alignment: .trailing,spacing: 2) {
                Square(color: color)
                Square(color: color)
                HStack(spacing: 2) {
                    Square(color: color)
                    Square(color: color)
                    Square(color: color)
                }
            }
        }
    }
    
    // Side right T shape
    struct sideRightT: View {
        var color: Color
        var body: some View {
            VStack(alignment: .trailing,spacing: 2) {
                Square(color: color)
                HStack(spacing: 2){
                    HStack(spacing: 2) {
                        Square(color: color)
                    }
                    Square(color: color)
                    HStack(spacing: 2) {
                        Square(color: color)
                    }
                }
                Square(color: color)
            }
        }
    }
    // Side left T shape
    struct sideleftT: View {
        var color: Color
        var body: some View {
            VStack(alignment: .leading,spacing: 2) {
                Square(color: color)
                HStack(spacing: 2){
                    HStack(spacing: 2) {
                        Square(color: color)
                    }
                    Square(color: color)
                    HStack(spacing: 2) {
                        Square(color: color)
                    }
                }
                Square(color: color)
            }
        }
    }
    // T shape
    struct T: View {
        var color: Color
        var body: some View {
            VStack(alignment: .center,spacing: 2) {
                HStack(spacing: 2){
                    HStack(spacing: 2) {
                        Square(color: color)
                    }
                    HStack(spacing: 2) {
                        Square(color: color)
                    }
                    HStack(spacing: 2) {
                        Square(color: color)
                    }
                }
                Square(color: color)
                Square(color: color)
            }
        }
    }
    // Upside down T shape
    struct UDT: View {
        var color: Color
        var body: some View {
            VStack(alignment: .center,spacing: 2) {
                Square(color: color)
                Square(color: color)
                HStack(spacing: 2){
                    HStack(spacing: 2) {
                        Square(color: color)
                    }
                    HStack(spacing: 2) {
                        Square(color: color)
                    }
                    HStack(spacing: 2) {
                        Square(color: color)
                    }
                }
            }
        }
    }
    // U shape
    struct U: View {
        var color: Color
        var body: some View {
            HStack(alignment: .bottom,spacing: 2) {
                VStack(spacing: 2) {
                    Square(color: color)
                    Square(color: color)
                }
                HStack(alignment: .top,spacing: 2) {
                    Square(color: color)
                }
                VStack(spacing: 2) {
                    Square(color: color)
                    Square(color: color)
                }
            }
        }
    }
    // Upside down U shape
    struct UDU: View {
        var color: Color
        var body: some View {
            HStack(alignment: .top,spacing: 2) {
                VStack(spacing: 2) {
                    Square(color: color)
                    Square(color: color)
                }
                HStack(alignment: .bottom,spacing: 2) {
                    Square(color: color)
                }
                VStack(spacing: 2) {
                    Square(color: color)
                    Square(color: color)
                }
            }
        }
    }
    // left U shape
    struct LU: View {
        var color: Color
        var body: some View {
            VStack(alignment: .trailing,spacing: 2) {
                HStack(spacing: 2){
                    Square(color: color)
                    Square(color: color)
                }
                VStack(spacing: 2){
                    Square(color: color)
                }
                HStack(spacing: 2){
                    Square(color: color)
                    Square(color: color)
                }
            }
        }
    }
    // right U shape
    struct RU: View {
        var color: Color
        var body: some View {
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 2){
                    Square(color: color)
                    Square(color: color)
                }
                VStack(spacing: 2){
                    Square(color: color)
                }
                HStack(spacing: 2){
                    Square(color: color)
                    Square(color: color)
                }
            }
        }
    }
    // z shape
    struct Z: View {
        var color: Color
        var body: some View {
            HStack(alignment: .top, spacing: 2){
                Square(color: color)
                VStack(alignment: .leading, spacing: 2){
                    Square(color: color)
                    //Square(color: color)
                    HStack(spacing: 2){
                        Square(color: color)
                        Square(color: color)
                    }
                }
            }
        }
    }
    // left z shape
    struct LZ: View {
        var color: Color
        var body: some View {
            VStack(alignment: .leading, spacing: 2){
                Square(color: color)
                HStack(alignment: .top, spacing: 2){
                    Square(color: color)
                    //Square(color: color)
                    VStack(spacing: 2){
                        Square(color: color)
                        Square(color: color)
                    }
                }
            }
        }
    }
    // + shape
    struct Plus: View {
        var color: Color
        var body: some View {
            VStack(spacing: 2){
                Square(color: color)
                HStack(spacing: 2){
                    Square(color: color)
                    Square(color: color)
                    Square(color: color)
                }
                Square(color: color)
            }
        }
    }
    
    
    
    
    var body: some View {
        VStack{
            HStack{
                Text("1010!")
                    .font(.title)
                    .foregroundColor(Color.black)
            }
            .padding()
            HStack{
                Text("Score:")
                    .font(.title)
                    .foregroundColor(Color.black)
            }
        }
        .padding()
        VStack(spacing: 3) {
            ForEach((0...viewModel.Model.gameBoard.count-1), id: \.self){idx1 in
                HStack(spacing: 1){
                    ForEach((0...viewModel.Model.gameBoard[idx1].count-1), id: \.self) {idx2 in
                        SquareGrid(color: colors[viewModel.Model.gameBoard[idx1][idx2].colorM])
                            .onDrop(of: ["Square"], delegate: MyDropDelegate(vm: viewModel, idx1: idx1, idx2: idx2))
                            .onDrop(of: ["TwoSquare"], delegate: MyDropDelegate(vm: viewModel, idx1: idx1, idx2: idx2))
                            .padding(0)
                    }
                }
            }
            .padding(-1)
        }
            LazyHStack(alignment: .center) {
                /*
                HStack(alignment: .center){
                    Square(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "Square" as NSString) })
                }
                .padding(25)
                HStack(alignment: .center){
                    TwoSquare(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "TwoSquare" as NSString) })
                }
                .padding(25)
                HStack(alignment: .center){
                    ThreeSquare(color: Color.red)
                        .onDrag({ return NSItemProvider(object: "ThreeSquare" as NSString) })
                }
                .padding(25)
                 */
                
                HStack(alignment: .center){
                    FourSquareCube(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "FourSquareCube" as NSString) })
                }
                .padding(25)
                 
                /*
                HStack(alignment: .center){
                    Lshape(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "Lshape" as NSString) })
                }
                .padding(25)
                HStack(alignment: .center){
                    BackwardLshape(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "BackwardLshape" as NSString) })
                }
                .padding(25)
                HStack(alignment: .center){
                    UDBackwardLshape(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "UDBackwardLshape" as NSString) })
                }
                .padding(25)
                HStack(alignment: .center){
                    UDLshape(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "UDLshape" as NSString) })
                }
                .padding(25)
                HStack(alignment: .center){
                    STLcorner(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "STLcorner" as NSString) })
                }
                .padding(25)
                HStack(alignment: .center){
                    STRcorner(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "STRcorner" as NSString) })
                }
                .padding(25)
                HStack(alignment: .center){
                    SBLcorner(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "SBLcorner" as NSString) })
                }
                .padding(25)
                HStack(alignment: .center){
                    SBRcorner(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "SBRcorner" as NSString) })
                }
                .padding(25)
                HStack(alignment: .center){
                    BTLcorner(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "BTLcorner" as NSString) })
                }
                .padding(25)
                HStack(alignment: .center){
                    BTRcorner(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "BTRcorner" as NSString) })
                }
                .padding(25)
                HStack(alignment: .center){
                    BBLcorner(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "BBLcorner" as NSString) })
                }
                .padding(25)
                
                HStack(alignment: .center){
                    BBRcorner(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "BBRcorner" as NSString) })
                }
                .padding(25)
                HStack(alignment: .center){
                    sideRightT(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "sideRightT" as NSString) })
                }
                .padding(25)
                HStack(alignment: .center){
                    sideleftT(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "sideleftT" as NSString) })
                }
                .padding(25)
                 */
                HStack(alignment: .center){
                    T(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "T" as NSString) })
                }
                .padding(25)
                HStack(alignment: .center){
                    UDT(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "UDT" as NSString) })
                }
                .padding(25)
                /*
                HStack(alignment: .center){
                    U(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "U" as NSString) })
                }
                .padding(25)
                HStack(alignment: .center){
                    UDU(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "UDU" as NSString) })
                }
                .padding(25)
                HStack(alignment: .center){
                    LU(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "LU" as NSString) })
                }
                .padding(25)
                HStack(alignment: .center){
                    RU(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "RU" as NSString) })
                }
                .padding(25)
                HStack(alignment: .center){
                    Z(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "Z" as NSString) })
                }
                .padding(25)
                HStack(alignment: .center){
                    LZ(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "LZ" as NSString) })
                }
                .padding(25)
                HStack(alignment: .center){
                    Plus(color: Color.blue)
                        .onDrag({ return NSItemProvider(object: "Plus" as NSString) })
                }
                .padding(25)
                 */
            }
        .padding(.top)
    }
}


