import SwiftUI

struct ContentView: View {
    @State private var taskInput = ""
    @State private var generatedCategory = "Waiting for data stream..."
    @State private var isAnalyzing = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 25) {
                // Section 1: User Text Entry Field
                VStack(alignment: .leading, spacing: 8) {
                    Text("Enter a rough task description:")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    TextField("e.g., Email Client about iOS mockup by 5 PM", text: $taskInput)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.horizontal)
                
                // Section 2: Simulated Backend Server Box
                VStack(spacing: 12) {
                    Text("n8n AI Automation Router")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.blue)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(20)
                    
                    if isAnalyzing {
                        ProgressView("Running AI Logic...")
                            .padding()
                    } else {
                        Text(generatedCategory)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                    }
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                .padding(.horizontal)
                
                // Section 3: Action Trigger Button
                Button(action: {
                    sendToN8NWorkflow()
                }) {
                    HStack {
                        Image(systemName: "bolt.shield.fill")
                        Text(isAnalyzing ? "Processing..." : "Trigger AI Automation")
                    }
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(taskInput.isEmpty ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }
                .disabled(taskInput.isEmpty || isAnalyzing)
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationTitle("AI Task Sorter")
        }
    }
    
    // 3. Simulated Network Interaction Layer
    func sendToN8NWorkflow() {
        isAnalyzing = true
        
        // Simulates network delay of sending payload to n8n Webhook
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            isAnalyzing = false
            generatedCategory = "🎯 Categorized: Client Communication\n🚨 Priority: High Status"
        }
    }
} 
