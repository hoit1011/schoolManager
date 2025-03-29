import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = DateViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            Text(viewModel.currentPeriodInfo)
                .font(.title2)
                .multilineTextAlignment(.center)
            
            Text(viewModel.countdownInfo)
                .font(.headline)
            
            ProgressView(value: Double(viewModel.progressValue), total: 1.0)
                .progressViewStyle(.linear)
                .tint(Color.greenToRed(viewModel.progressValue))
                .frame(height: 20)
                .animation(.linear(duration: 1.0), value: viewModel.progressValue)
        }
        .frame(width: 300, height: 200)
        .padding()
    }
}

#Preview {
    ContentView()
}
