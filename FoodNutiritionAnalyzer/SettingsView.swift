import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled = true
    @State private var rememberLogin = true

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Preferences")) {
                    Toggle(isOn: $notificationsEnabled) {
                        Text("Enable Notifications")
                    }

                    Toggle(isOn: $rememberLogin) {
                        Text("Remember Login")
                    }
                }
                
                Section {
                    Button(action: {
                        // Handle logout action here
                    }) {
                        Text("Log Out")
                            .foregroundColor(.red)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Settings")
        }
    }
}
