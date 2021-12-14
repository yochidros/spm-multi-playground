import SwiftUI
import Package1Library

struct ContentView: View {
    @StateObject var viewModel: ViewModel = .init()

    init() {
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, Sample 3!")
                .onAppear(perform: {
                    Task.init(priority: nil) {
                        async let t2 = viewModel.send(action: .onAppear(2))
                        async let t1 = viewModel.send(action: .onAppear(1))
                        await (t2, t1)
                    }
                })
        }
    }
}

actor SubRepository {
    func hello(_ num: Int) async -> String {
//        print("\(num) Sub Repository ==> ", Thread.isMainThread)
        return "sub"
    }
}
actor Repository {
    private var text: String = ""
    private let subRepository = SubRepository()
    func hello(_ num: Int) async -> String {
//        print("\(num) Repository ==> ", text, Thread.isMainThread)
        let result = await subRepository.hello(num)
//        print("\(num) Repository ==> ", text, Thread.isMainThread)
        text += result + "repo "
//        print("\(num) Repository ==> ", text, Thread.isMainThread)
        return text
    }
}

@MainActor
class ViewModel: ObservableObject {
    enum Action {
        case onAppear(Int)
    }

    struct Depenency {
        let repository: Repository
    }
    struct State {
        fileprivate(set) var text: String
        fileprivate(set) var isReady: Bool = false
    }
    @Published private(set) var state: State
    private let dependency: Depenency

    init() {
        self.state = .init(text: "")
        self.dependency = .init(repository: .init())
    }

    func send(action: Action) async {
        switch action {
        case let .onAppear(num):
            print("\(num) VM ==> state before", state.text, Thread.isMainThread)

            state.text += "aaaaa"
            let result = await dependency.repository.hello(num)
            let action = await send(action: .onAppear(num+1))

            print("\(num) VM ==> state", state.text, Thread.isMainThread)
            state.text = result
        }
    }
}
