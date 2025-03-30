import SwiftUI

struct MainView: View {
    @StateObject var viewModel = DateViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            Text(viewModel.currentPeriodInfo)
                .font(.system(size: 24, weight: .bold))
                .multilineTextAlignment(.center)
            
            Text(viewModel.countdownInfo)
                .font(.headline)
            
            if viewModel.showProgressBar {
                ProgressView(value: Double(viewModel.progressValue), total: 1.0)
                    .progressViewStyle(.linear)
                    .tint(Color.greenToRed(viewModel.progressValue))
                    .frame(height: 20)
                    .animation(.linear(duration: 1.0), value: viewModel.progressValue)
            }
        }
        .frame(width: 210, height: 200)
        .padding()
    }
}

#Preview {
    MainView()
}
