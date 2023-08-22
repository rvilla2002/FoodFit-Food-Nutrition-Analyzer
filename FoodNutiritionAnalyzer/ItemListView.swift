import SwiftUI
import Firebase

struct ItemsListView: View {
    @State private var items: [String] = []
    let funFacts = ["Did you know? Bananas are berries, but strawberries aren't!",
                    "There's an enzyme in pineapple that can eat your tongue.",
                    "Eating carrots can give your skin a slight orange tint.",
                    "Honey never spoils. Edible honey was found in ancient Egyptian tombs!",
                    "Almonds are seeds, not nuts!"]
    @State private var currentFact: String

    init() {
        _currentFact = State(initialValue: funFacts.randomElement() ?? "")
    }

    var body: some View {
        NavigationView {
            VStack {
                if items.isEmpty {
                    Text("No scanned items yet!")
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(items, id: \.self) { item in
                            Text(item)
                                .font(.headline)
                        } 
                        .onDelete(perform: deleteItem)
                    }
                }
                
                Spacer()
                
                Text("Fun Fact: \(currentFact)")
                    .font(.caption)
                    .padding()
                    .background(Color.yellow.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .onAppear(perform: loadData)
            .navigationBarTitle("Scanned Items", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: loadData) {
                Image(systemName: "arrow.clockwise")
                    .resizable()
                    .frame(width: 20, height: 20)
            })
        }
    }
    
    func loadData() {
        let userID = Auth.auth().currentUser?.uid ?? ""
        let ref = Database.database().reference().child("scannedItems/\(userID)")
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            if let value = snapshot.value as? [String] {
                self.items = value
            }
        })
    }

    func deleteItem(at offsets: IndexSet) {
        for index in offsets {
            let itemToRemove = items[index]
            // Remove item from Firebase
            let userID = Auth.auth().currentUser?.uid ?? ""
            let ref = Database.database().reference().child("scannedItems/\(userID)")
            ref.child(itemToRemove).removeValue()
        }
        items.remove(atOffsets: offsets)
    }
}
