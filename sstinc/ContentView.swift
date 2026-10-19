import SwiftUI

struct ContentView: View {
    @State private var totalClicks = 0
    @State private var showResetConfirmation = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Text("Ready to accomplish nothing?")
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.center)

                Text("Press the button. That's it.")
                    .foregroundStyle(.secondary)

                Button {
                    totalClicks += 1
                } label: {
                    VStack(spacing: 8) {
                        Image(systemName: "circle.dashed")
                            .font(.largeTitle)

                        Text("Do Nothing")
                            .font(.headline)
                    }
                    .foregroundStyle(.white)
                    .frame(width: 176, height: 176)
                    .background(Color.accentColor)
                    .clipShape(Circle())
                }
                .buttonStyle(.plain)

                VStack(spacing: 8) {
                    Text("Total nothing")
                        .foregroundStyle(.secondary)

                    Text("\(totalClicks)")
                        .font(.largeTitle)
                        .bold()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.gray.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 16))

                Spacer()
            }
            .padding(24)
            .navigationTitle("Void")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        Form {
                            Section("About") {
                                LabeledContent("Version", value: "1.0.0")
                                LabeledContent(
                                    "Total clicks",
                                    value: "\(totalClicks)"
                                )
                            }

                            Section {
                                Button("Reset counter", role: .destructive) {
                                    showResetConfirmation = true
                                }
                            } footer: {
                                Text("The count is not saved when the app closes.")
                            }
                        }
                        .navigationTitle("Settings")
                        .confirmationDialog(
                            "Reset the counter?",
                            isPresented: $showResetConfirmation,
                            titleVisibility: .visible
                        ) {
                            Button("Reset", role: .destructive) {
                                totalClicks = 0
                            }
                            Button("Cancel", role: .cancel) { }
                        }
                    } label: {
                        Image(systemName: "gearshape")
                    }
                    .accessibilityLabel("Settings")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
