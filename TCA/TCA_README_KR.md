# The Composable Architecture

The Composable Architecture(TCA)는 일관되고 이해할 수 있는 방식으로 어플리케이션을 만들기 위해 탄생한 라이브러리입니다. 합성(Composition), 테스팅(Testing) 그리고 인체 공학(Ergonomics)을 염두에 둔 TCA는 SwiftUI, UIKit을 지원하며 모든 애플 플랫폼(iOS, macOS, tvOS, watchOS)에서 사용 가능합니다.

- [The Composable Architecture](#The-Composable-Architecture)
  - [The Composable Architecture란](#The-Composable-Architecture%EB%9E%80)
  - [강의 영상](#%EA%B0%95%EC%9D%98-%EC%98%81%EC%83%81)
  - [예제 코드](#%EC%98%88%EC%A0%9C-%EC%BD%94%EB%93%9C)
  - [기본적인 사용법](#%EA%B8%B0%EB%B3%B8%EC%A0%81%EC%9D%B8-%EC%82%AC%EC%9A%A9%EB%B2%95)
    - [테스팅](#%ED%85%8C%EC%8A%A4%ED%8C%85)
    - [디버깅](#%EB%94%94%EB%B2%84%EA%B9%85)
  - [추가적인 라이브러리](#%EC%B6%94%EA%B0%80%EC%A0%81%EC%9D%B8-%EB%9D%BC%EC%9D%B4%EB%B8%8C%EB%9F%AC%EB%A6%AC)
  - [자주 묻는 질문](#%EC%9E%90%EC%A3%BC-%EB%AC%BB%EB%8A%94-%EC%A7%88%EB%AC%B8)
  - [최소 개발 타겟](#%EC%B5%9C%EC%86%8C-%EA%B0%9C%EB%B0%9C-%ED%83%80%EA%B2%9F)
  - [설치 방법](#%EC%84%A4%EC%B9%98-%EB%B0%A9%EB%B2%95)
  - [최신 개발 문서](#%EC%B5%9C%EC%8B%A0-%EA%B0%9C%EB%B0%9C-%EB%AC%B8%EC%84%9C)
  - [도움받기](#%EB%8F%84%EC%9B%80%EB%B0%9B%EA%B8%B0)
  - [감사 인사](#%EA%B0%90%EC%82%AC-%EC%9D%B8%EC%82%AC)
  - [다른 대안](#%EB%8B%A4%EB%A5%B8-%EB%8C%80%EC%95%88)
  - [라이센스](#%EB%9D%BC%EC%9D%B4%EC%84%BC%EC%8A%A4)

## The Composable Architecture란

이 라이브러리는 다양한 목적과 복잡도를 가진 어플리케이션을 만들기 위해 필요한 핵심 도구를 제공합니다.
각 도구가 제공하는 흥미로운 스토리는 우리가 매일 만나는 수많은 문제를 해결할 방법을 알려줄 겁니다.

* **상태(State) 관리**
  <br> 간단한 값 타입들로 어플리케이션의 상태를 관리하는 방법, 상태를 공유를 통해 화면에서 일어나는 변화(Mutation)를 다른 화면에서 즉시 관측(Observe)하는 방법을 제공합니다.

* **합성(Composition)**
  <br> 기능을 여러 개의 독립된 모듈로 추출하는 방법, 이 모듈을 다시 합쳐서 거대한 기능을 작은 컴포넌트의 집합으로 구성하는 방법을 제공합니다.
  
* **사이드 이펙트(Side Effects)**
  <br> 어플리케이션 바깥세상과 접촉하는 작업을 테스트할 수 있고 이해하기 쉽게 작성하는 방법을 제공합니다.

* **테스팅(Testing)**
  <br> 아키텍처 내부의 기능을 테스트하는 방법뿐만 아니라 여러 파트로 구성된 기능의 통합 테스트를 작성하는 방법, 사이드 이펙트가 어플리케이션에 끼치는 영향에 대해 전체 테스트를 작성하는 방법을 제공합니다. 이 테스트 방식은 여러분의 비즈니스 로직이 예상대로 잘 작동하는지에 대한 강한 보증도 제공합니다.

* **인체 공학(Ergonomics)**
  <br> 위의 내용을 가능한 한 적은 개념의 간단한 API로 이루는 방법을 제공합니다.

## 강의 영상

The Composable Architecture는 [Point-Free](https://www.pointfree.co)의 [Brandon Williams](https://twitter.com/mbrandonw)와 [Stephen Celis](https://twitter.com/stephencelis)가 만든 Swift의 함수형 프로그래밍에 대해 알아보는 에피소드를 통해 탄생했습니다.

전체 에피소드는 [여기](https://www.pointfree.co/collections/composable-architecture)에서 확인하실 수 있습니다. 이외에도, 총 네 파트로 구성된 영상도 있습니다. ([part 1](https://www.pointfree.co/collections/composable-architecture/a-tour-of-the-composable-architecture/ep100-a-tour-of-the-composable-architecture-part-1), [part 2](https://www.pointfree.co/collections/composable-architecture/a-tour-of-the-composable-architecture/ep101-a-tour-of-the-composable-architecture-part-2), [part 3](https://www.pointfree.co/collections/composable-architecture/a-tour-of-the-composable-architecture/ep102-a-tour-of-the-composable-architecture-part-3) 그리고 [part 4](https://www.pointfree.co/collections/composable-architecture/a-tour-of-the-composable-architecture/ep103-a-tour-of-the-composable-architecture-part-4))

<a href="https://www.pointfree.co/collections/composable-architecture">
  <img alt="video poster image" src="https://i.vimeocdn.com/video/850265054.jpg" width="600">
</a>

## 예제 코드

[![Screen shots of example applications](https://d3rccdn33rt8ze.cloudfront.net/composable-architecture/demos.png)](./Examples)

이 저장소엔 기본적인 문제부터 복잡한 문제까지 TCA를 통해 해결할 수 있다는 것을 증명하기 위한 _많은_ 예제가 있습니다.
[여기서](https://github.com/pointfreeco/swift-composable-architecture/tree/main/Examples) 확인하실 수 있으며, 내용은 아래와 같습니다.

* [Case Studies](https://github.com/pointfreeco/swift-composable-architecture/tree/main/Examples/CaseStudies)
  * Getting started
  * Effects
  * Navigation
  * Higher-order reducers
  * Reusable components
* [Location manager](https://github.com/pointfreeco/composable-core-location/tree/main/Examples/LocationManager)
* [Motion manager](https://github.com/pointfreeco/composable-core-motion/tree/main/Examples/MotionManager)
* [Search](https://github.com/pointfreeco/swift-composable-architecture/tree/main/Examples/Search)
* [Speech Recognition](https://github.com/pointfreeco/swift-composable-architecture/tree/main/Examples/SpeechRecognition)
* [Tic-Tac-Toe](https://github.com/pointfreeco/swift-composable-architecture/tree/main/Examples/TicTacToe)
* [Todos](https://github.com/pointfreeco/swift-composable-architecture/tree/main/Examples/Todos)
* [Voice memos](https://github.com/pointfreeco/swift-composable-architecture/tree/main/Examples/VoiceMemos)

## 기본적인 사용법

TCA를 통해 기능을 만들기 위해선 여러분의 도메인을 구성하는 몇 가지 타입을 정의해야 합니다.

* **상태(State)**: 비즈니스 로직을 수행하거나 UI를 그릴 때 필요한 데이터에 대한 설명을 나타내는 타입입니다.
* **행동(Action)**: 사용자가 하는 행동이나 노티피케이션 등 어플리케이션에서 생길 수 있는 모든 행동을 나타내는 타입입니다.
* **환경(Environment)**: API 클라이언트나 애널리틱스 클라이언트와 같이 어플리케이션이 필요로 하는 의존성(Dependency)을 가지고 있는 타입입니다.
* **리듀서(Reducer)**: 어떤 행동(Action)이 주어졌을 때 지금 상태(State)를 다음 상태로 변화시키는 방법을 가지고 있는 함수입니다. 또한 리듀서는 실행할 수 있는 이펙트(Effect, 예시: API 리퀘스트)를 반환해야 하며, 보통은 `Effect` 값을 반환합니다.
* **스토어(Store)**: 실제로 기능이 작동하는 공간입니다. 우리는 사용자 행동(Action)을 보내서 스토어(Store)는 리듀서(Reducer)와 이펙트(Effect)를 실행할 수 있고, 스토어(Store)에서 일어나는 상태(State) 변화를 관측(observe)해서 UI를 업데이트할 수도 있습니다.

위의 타입을 정의하는 것의 이점은 즉시 여러분의 기능에 테스트 가능성을 부여할 수 있다는 것이고, 게다가 크고 복잡한 기능을 서로 결합 가능한 작고 독립된 모듈로 쪼갤 수도 있습니다.

간단한 예시로 설명드리겠습니다.
화면에 숫자와 이 숫자를 증가할 수 있는 + 버튼, 감소할 수 있는 - 버튼이 있다고 해보겠습니다.
더 다양한 행동을 위해 탭 하면 API 호출을 해서 숫자에 관한 무작위 사실을 알림창으로 보여주는 버튼도 추가합니다.

그러면 화면의 상태(State)는 무엇이 있을까요?
먼저 화면의 숫자를 정수로 가지고 있을 것이고, 알림창을 보여줄 때 필요한 숫자에 관한 사실도 있을 것입니다. (알림창이 뜰 필요가 없는 상황에선 `nil` 값을 넣어야 하니 옵셔널로 가겠습니다.)

```swift
struct AppState: Equatable {
  var count = 0
  var numberFactAlert: String?
}
```

행동(Action)에는 무엇이 있을까요? 증가 버튼이나 감소 버튼을 누르는 행동은 누구나 생각할 수 있을 만큼 명확한 행동도 있고, 반대로 알림창을 닫거나 무작위 사실 API 리퀘스트 결과를 받았을 때 발생하는 행동같이 약간은 생각하기 어려운 행동도 있을 것입니다.

```swift
enum AppAction: Equatable {
  case factAlertDismissed
  case decrementButtonTapped
  case incrementButtonTapped
  case numberFactButtonTapped
  case numberFactResponse(Result<String, ApiError>)
}

struct ApiError: Error, Equatable {}
```

다음은 화면이 제대로 작동하기 위해 필요한 의존성(Dependency)을 관리하는 환경(Environment) 차례입니다.
숫자에 관한 사실을 가져오는 경우 네트워크 리퀘스트를 요약해서 `Effect` 값으로 만드는 작업이 있겠네요. 이 작업의 의존성은 `Int`를 받아서 `Effect<String, ApiError>`를 반환하는 함수가 되겠습니다. 여기서 String은 리퀘스트의 리스폰스를 요약한 값입니다.
이펙트는 통상적으로 백그라운드 스레드에서 작업을 처리하게 될 것입니다(`URLSession`이 하는 것처럼요). 저희는 이펙트의 값을 메인 큐에서 받을 방법이 필요합니다. 메인 큐 스케줄러를 사용해야 테스트를 작성할 수 있습니다. `AnyScheduler`를 사용해서 프로덕션에선 `DispatchQueue`를 사용하고 테스트 시엔 테스트 스케줄러를 사용해봅시다.

```swift
struct AppEnvironment {
  var mainQueue: AnySchedulerOf<DispatchQueue>
  var numberFact: (Int) -> Effect<String, ApiError>
}
```

이제 리듀서(Reducer)를 구현해봅시다. 그러려면 현재 상태(State)를 변화시켜서 다음 상태로 만드는 방법에 대한 설명과 어떤 이펙트(Effect)가 실행돼야하는지에 대한 설명이 필요합니다. 만약 어떠한 이펙트도 실행이 필요하지 않은 경우엔 `.none`을 반환하면 됩니다.

```swift
let appReducer = Reducer<AppState, AppAction, AppEnvironment> { state, action, environment in
  switch action {
  case .factAlertDismissed:
    state.numberFactAlert = nil
    return .none

  case .decrementButtonTapped:
    state.count -= 1
    return .none

  case .incrementButtonTapped:
    state.count += 1
    return .none

  case .numberFactButtonTapped:
    return environment.numberFact(state.count)
      .receive(on: environment.mainQueue)
      .catchToEffect()
      .map(AppAction.numberFactResponse)

  case let .numberFactResponse(.success(fact)):
    state.numberFactAlert = fact
    return .none

  case .numberFactResponse(.failure):
    state.numberFactAlert = "Could not load a number fact :("
    return .none
  }
}
```

마지막으로 이 기능이 작동될 뷰를 정의합니다. `Store<AppState, AppAction>`가 있으면 모든 상태 변화를 관측하고 UI를 다시 그릴 수 있으며, 사용자 행동을 보내서 상태를 변화할 수도 있습니다. `.alert` View Modifier가 요구하는 대로 숫자에 관한 사실을 구조체로 한 번 감싸서 `Identifiable`을 따르게 만들겠습니다.

```swift
struct AppView: View {
  let store: Store<AppState, AppAction>

  var body: some View {
    WithViewStore(self.store) { viewStore in
      VStack {
        HStack {
          Button("−") { viewStore.send(.decrementButtonTapped) }
          Text("\(viewStore.count)")
          Button("+") { viewStore.send(.incrementButtonTapped) }
        }

        Button("Number fact") { viewStore.send(.numberFactButtonTapped) }
      }
      .alert(
        item: viewStore.binding(
          get: { $0.numberFactAlert.map(FactAlert.init(title:)) },
          send: .factAlertDismissed
        ),
        content: { Alert(title: Text($0.title)) }
      )
    }
  }
}

struct FactAlert: Identifiable {
  var title: String
  var id: String { self.title }
}
```

한 가지 중요한 사실은 이 모든 기능을 실제 이펙트 없이 구현할 수 있다는 것입니다. 이는 기능 자체를 독립된 환경에서 디펜던시 없이 만들 수 있다는 것을 증명하는 것이며 컴파일 시간 단축으로 직결되기도 합니다.

이 말인즉슨, 동일한 스토어에 UIKit을 붙이는 것도 가능하다는 의미입니다. UI 업데이트나 알림창을 보여주는 작업을 위해 `viewDidLoad`에서 스토어로 구독(Subscribe)하면 됩니다. 코드 자체는 SwiftUI 버전보다 조금 더 깁니다.

<details>
  <summary>펼쳐보기</summary>

  ```swift
  class AppViewController: UIViewController {
    let viewStore: ViewStore<AppState, AppAction>
    var cancellables: Set<AnyCancellable> = []

    init(store: Store<AppState, AppAction>) {
      self.viewStore = ViewStore(store)
      super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
      super.viewDidLoad()

      let countLabel = UILabel()
      let incrementButton = UIButton()
      let decrementButton = UIButton()
      let factButton = UIButton()

      // addSubview나 constraint 설정하는 코드는 생략했습니다

      self.viewStore.publisher
        .map { "\($0.count)" }
        .assign(to: \.text, on: countLabel)
        .store(in: &self.cancellables)

      self.viewStore.publisher.numberFactAlert
        .sink { [weak self] numberFactAlert in
          let alertController = UIAlertController(
            title: numberFactAlert, message: nil, preferredStyle: .alert
          )
          alertController.addAction(
            UIAlertAction(
              title: "Ok",
              style: .default,
              handler: { _ in self?.viewStore.send(.factAlertDismissed) }
            )
          )
          self?.present(alertController, animated: true, completion: nil)
        }
        .store(in: &self.cancellables)
    }

    @objc private func incrementButtonTapped() {
      self.viewStore.send(.incrementButtonTapped)
    }
    @objc private func decrementButtonTapped() {
      self.viewStore.send(.decrementButtonTapped)
    }
    @objc private func factButtonTapped() {
      self.viewStore.send(.numberFactButtonTapped)
    }
  }
  ```
</details>

이제 뷰는 준비되었으니 작동을 위한 스토어를 만들어봅시다. 여기서 디펜던시를 제공하면 됩니다. 그리고 API 리퀘스트를 생략하기 위해 문자열을 mock 해서 바로 반환하는 이펙트를 주입합니다.

```swift
let appView = AppView(
  store: Store(
    initialState: AppState(),
    reducer: appReducer,
    environment: AppEnvironment(
      mainQueue: DispatchQueue.main.eraseToAnyScheduler(),
      numberFact: { number in Effect(value: "\(number) is a good number Brent") }
    )
  )
)
```

드디어 화면을 보여주기 위한 작업이 모두 끝났습니다. 이렇게 여러 단계를 통해 기능을 만드는 것은 순수하게 SwiftUI로 만드는 것보단 확실히 몇 단계 더 있긴 합니다. 하지만 그만큼 더 이점이 있습니다. 이러한 단계는 단순히 로직을 관측 가능한 객체나 다양한 UI 컴포넌트의 클로저에 흩뿌리는 것보다, 상태 변경을 적용하는 것에 일관된 태도를 가지도록 해줍니다. 또한 사이드 이펙트를 간결하게 표현하는 방법도 제공합니다. 그리고 추가적인 작업 없이 이펙트가 포함된 로직을 바로 테스트할 수도 있습니다.

### 테스팅

테스트를 하기 위해선 `TestStore`를 생성해야 합니다. `TestStore`는 앞에서 만든 스토어와 같은 내용의 디펜던시로 만들어도 되지만, 이번엔 조금 더 테스트하기 좋은 디펜던시를 주입하겠습니다. 특히, 라이브 `DispatchQueue.main` 대신 테스트 스케줄러를 사용해서 어떤 작업이 진행되는 것을 제어할 수 있어서 큐를 굳이 기다릴 필요가 없게 만들겠습니다.

```swift
let scheduler = DispatchQueue.testScheduler

let store = TestStore(
  initialState: AppState(),
  reducer: appReducer,
  environment: AppEnvironment(
    mainQueue: scheduler.eraseToAnyScheduler(),
    numberFact: { number in Effect(value: "\(number) is a good number Brent") }
  )
)
```

생성된 `TestStore`는 전체 단계별 사용자 플로우를 넣을 수 있는데요, 여기서 전체 단계는 상태의 변경이 우리가 예상한대로 잘 작동하는지 증명을 하기 위한 모든 단계라고 생각하시면 됩니다. 게다가 스토어의 데이터를 바꾸는 이펙트가 실행되는 단계엔 그 작업까지 자세히 넣어줘야 합니다.

아래의 테스트는 사용자가 증가 버튼을 누르고 감소 버튼을 누른 후 숫자에 관한 사실을 요청한 뒤 이펙트의 리스폰스가 알림창을 띄우게 만들고 마지막으로 알림창을 닫는 것까지의 내용을 담고 있습니다.

```swift
store.assert(
  // 증가/감소 버튼을 눌렀을 경우 카운트를 바꾸는 것에 대한 테스트
  .send(.incrementButtonTapped) {
    $0.count = 1
  },
  .send(.decrementButtonTapped) {
    $0.count = 0
  },

  // 숫자에 관한 재밌는 사실 버튼을 누르고 이펙트에서 리스폰스를 받는 것에 대한 테스트
  // reducer에서 `.receive(on:)`을 사용했으니 스케줄러를 `advance()`해줘야 합니다.
  .send(.numberFactButtonTapped),
  .do { scheduler.advance() },
  .receive(.numberFactResponse(.success("0 is a good number Brent"))) {
    $0.numberFactAlert = "0 is a good number Brent"
  },

  // 알림창 닫기
  .send(.factAlertDismissed) {
    $0.numberFactAlert = nil
  }
)
```

여기까지 The Composable Architecture에서 기능을 만들고 테스트하는 것에 대한 기본이었습니다. 앞으로 합성(Composition), 모듈화(Modularity), 적응성(Adaptability), 복잡한 이펙트를 다루는 법과 같이 여러분을 기다리는 개념들이 _정말 많습니다_. [예제](https://github.com/pointfreeco/swift-composable-architecture/tree/main/Examples) 디렉토리에서 더 자세한 사용법이 소개돼 있으니 살펴보시기 바랍니다.

### 디버깅

The Composable Architecture는 여러 디버깅 도구를 기본적으로 제공합니다.

* `reducer.debug()`는 리듀서가 받는 모든 행동과 상태 변경에 대한 설명을 디버그 창에 출력합니다.

    ``` diff
    received action:
      AppAction.todoCheckboxTapped(
        index: 0
      )
      AppState(
        todos: [
          Todo(
    -       isComplete: false,
    +       isComplete: true,
            description: "Milk",
            id: 5834811A-83B4-4E5E-BCD3-8A38F6BDCA90
          ),
          Todo(
            isComplete: false,
            description: "Eggs",
            id: AB3C7921-8262-4412-AA93-9DC5575C1107
          ),
          Todo(
            isComplete: true,
            description: "Hand Soap",
            id: 06E94D88-D726-42EF-BA8B-7B4478179D19
          ),
        ]
      )
    ```

* `reducer.signpost()`는 행동이 실행되는 데에 걸린 시간과 언제 실행되는지 등에 대한 정보를 얻을 수 있도록 Instrument에 표시를 생성해줍니다.

    <img src="https://s3.amazonaws.com/pointfreeco-production/point-free-pointers/0044-signposts-cover.jpg" width="600">

## 추가적인 라이브러리

Composable Architecture의 가장 중요한 원칙 중 하나는 사이드 이펙트는 절대 직접적으로 실행되지 않고, 대신 `Effect` 타입에 감싼 후에 리듀서에서 반환되고 나중에 스토어에서 실행된다는 것입니다. 이는 어플리케이션의 데이터 플로우를 간결화하는 데 있어서 가장 중요한 내용으로 이 원칙을 따라야 사용자의 행동과 이펙트 실행 사이의 사이클에 대한 테스트 가능성을 보장받을 수 있습니다.

하지만 이 말은 우리가 매일 만나는 라이브러리나 SDK가 Composable Architecture 스타일로 바뀌어야 한다는 것을 의미하기도 합니다. 저희는 이 고통을 조금이나마 덜어드리기 위해 애플의 유명한 프레임워크를 Composable Architecture에서 사용했을 때 잘 작동하도록 래퍼(wrapper) 라이브러리를 제공하고 있습니다. 지원하는 라이브러리 목록은 다음과 같습니다.

* [`ComposableCoreLocation`](https://github.com/pointfreeco/composable-core-location): `CLLocationManager`의 래퍼로, 리듀서에서 사용하기 쉽고 `CLLocationManager`의 기능을 로직에서 사용하는 경우를 테스트하기에도 용이하게 만들었습니다.
* [`ComposableCoreMotion`](https://github.com/pointfreeco/composable-core-motion): `CMMotionManager`의 래퍼로, 리듀서에서 사용하기 쉽고 `CMMotionManager`의 기능을 로직에서 사용하는 경우를 테스트하기에도 용이하게 만들었습니다.

저희가 아직 작업하지 못한 프레임워크를 위한 래퍼를 만들고 싶으시면 언제든 이슈를 만들어주세요! 나아갈 방향에 대해 함께 토론하고 싶습니다.

## 자주 묻는 질문

* Composable Architecture가 Elm이나 Redux같은 라이브러리와 다른 점은 무엇인가요?
  <details>
    <summary>펼쳐서 답변보기</summary>
    the Composable Architecture(TCA)는 the Elm Architecture(TEA)와 Redux가 대중화한 아이디어에 기반하고 있지만 애플의 플랫폼에서 Swift 언어에 맞게 만들어졌습니다.
    
    TCA의 몇몇 부분은 다른 라이브러리들에 비해 좀 더 고집이 있는 편입니다. 예를 들어, Redux는 사이드 이펙트를 발생하는 것에 대한 규칙이 없는 반면, TCA는 모든 사이드 이펙트를 `Effect` 타입으로 모델링하고 리듀서가 반환해야하는 것이 필수입니다.
    
    어떤 부분에선 TCA는 다른 라이브러리들에 비해 느슨한 편이기도 합니다. 예를 들어, Elm에서 `Cmd` 타입으로 만들 수 있는 effect의 종류를 컨트롤하는 반면에 TCA는 `Effect`가 Combine의 `Publisher` 프로토콜을 따르기 때문에 어떤 종류의 이펙트도 만들 수 있습니다.
    
    또, TCA는 Redux나 Elm 등 다른 라이브러리가 신경쓰지 않는 부분에 높은 우선 순위를 주기도 합니다. 예를 들어, 거대한 기능을 작은 단위의 쪼개고 다시 결합할 수 있게 만들어주는 합성(Composition)은 TCA에서 아주 중요한 측면 중 하나입니다. 합성은 리듀서의 `pullback`과 `combine` 연산자 덕분에 완성할 수 있었고, 결과적으로 복잡한 기능을 모듈화해서 더 독립된 코드로 만들고 더 나은 컴파일 시간을 제공할 수 있게 되었습니다.
  </details>

* `Store`가 thread-safe 한 이유는 무엇인가요? <br> 왜 `send`는 큐에 쌓이지 않나요? <br> 왜 `send`는 메인 스레드에서 실행되지 않나요?
  <details>
    <summary>펼쳐서 답변보기</summary>
    action이 `Store`로 보내지면 리듀서는 지금 상태에서 실행되고, 이 작업 자체는 여러 스레드에서 실행될 수 없습니다. `send`의 구현부에서 큐를 사용하는 방법도 있겠지만, 이는 새로운 문제를 만듭니다.

    1. 간편하게 `DispatchQueue.main.async`를 사용한다면 메인 스레드에서 스레드를 뛰어넘으려는 일이 일어날 것입니다. 때로는 애니메이션 블락처럼 동기적으로 일어나야 하는 작업이 있을텐데, 이럴 경우 UIKit과 SwiftUI의 예상치 못한 문제가 발생할 것입니다.

    2. `DispatchQueue.main.async`를 사용하고 쌓인 작업을 바로 실행하는 스케줄러를 만들 수도 있을 것입니다. (예시: ReactiveSwift의 [`UIScheduler`](https://github.com/ReactiveCocoa/ReactiveSwift/blob/f97db218c0236b0c6ef74d32adb3d578792969c0/Sources/Scheduler.swift)) 이는 오히려 상황을 더 복잡하게 만들기 때문에 엄청 괜찮은 이유가 없다면 아마 채택되지 않을 것입니다.

    결국 저희는 `Store`가 애플의 API처럼 상호작용하도록 만들었습니다. `URLSession`이 백그라운드 스레드로 결과를 전달하고 메인 스레드로 넘기는 작업은 우리에게 맡기는 것처럼 TCA는 메인 스레드에서 행동을 보내는 것은 사용자에게 맡깁니다. 만약 여러분이 출력을 메인 스레드가 아닌 곳으로 전달하는 이펙트를 사용하신다면 `.receive(on:)`을 이용해서 메인 스레드로 넘기도록 만드셔야 합니다.
    
    이 접근법은 이펙트가 생성되고 변환되는 방법에 대한 가설의 수를 최소화해줬으며, 불필요한 스레드 뛰어넘기 같은 문제를 막아주었습니다. 이펙트에 스케쥴링에 대한 책임이 없다면 이펙트에 대한 테스트가 즉시 동기적으로 진행될 것입니다. 그렇게 되면 실행되고 있는 이펙트가 어떻게 다음으로 넘어가는지 혹은 어플리케이션의 상태에 어떻게 영향을 끼치는지에 대한 상황을 전혀 알 수 없을 것입니다. 하지만 원한다면 `Store`에서 이펙트의 이러한 측면을 테스트하거나 무시할 수 있는 유연성은 남겨두었습니다.
    
    저희가 선택한 방식이 마음에 들지 않으시나요? 걱정마세요! The Composable Architecture는 이 부분을 여러분이 원하는대로 바꿀 수 있도록 유연하게 만들어졌습니다. 아래와 같이 모든 이펙트에 대해서 결과를 메인 스레드에 전달하게 만드는 고계 리듀서를 만들어서 주입하면 스레드에 대한 책임을 걱정하지 않으셔도 됩니다.

    ```swift
    extension Reducer {
      func receive<S: Scheduler>(on scheduler: S) -> Self {
        Self { state, action, environment in
          self(&state, action, environment)
            .receive(on: scheduler)
            .eraseToEffect()
        }
      }
    }
    ```

    그래도 여전히 불필요한 스레드 건너뛰기가 생기지 않도록 해주는 `UIScheduler`는 니즈가 있겠네요.
  </details>

## 최소 개발 타겟

The Composable Architecture는 Combine 프레임워크를 디펜던시로 갖고 있기 때문에 최소 개발 타겟이 iOS 13, macOS 10.15, Mac Catalyst 13, tvOS 13 그리고 watchOS 6 이상이어야 합니다. 만약 더 이전 OS를 지원해야 하는 경우는 [ReactiveSwift](https://github.com/trading-point/reactiveswift-composable-architecture) 버전이나 [RxSwift](https://github.com/dannyhertz/rxswift-composable-architecture)버전을 사용하시면 됩니다!

## 설치 방법

Composable Architecture는 Xcode 프로젝트에 패키지 디펜던시로 추가할 수 있습니다.

  1. **File** 메뉴에서 **Swift Packages › Add Package Dependency**를 선택하세요.
  2. 저장소 URL 텍스트 필드에 "https://github.com/pointfreeco/swift-composable-architecture"를 입력하세요.
  3. 여러분의 프로젝트가 어떻게 구성돼있는가에 따라 다음과 같이 작업하시면 됩니다.
      - 라이브러리에 접근해야 하는 어플리케이션 타겟이 하나일 경우, **ComposableArchitecture**를 어플리케이션에 바로 추가하시면 됩니다.
      - 어플리케이션 타겟이 여러 개일 경우, 공유 프레임워크를 만들어서 **ComposableArchitecture**를 디펜던시로 가지게 만든 후 그 공유 프레임워크를 각 타겟에서 디펜던시로 가지면 됩니다. 데모 어플리케이션인 [Tic-Tac-Toe](https://github.com/pointfreeco/swift-composable-architecture/tree/main/Examples/TicTacToe)에서 기능을 여러 모듈로 쪼갠 후 정적 라이브러리인 **TicTacToeCommon** 프레임워크를 사용하고 있으니 이 프로젝트에서 사용 방법을 자세히 확인하실 수 있을 겁니다.

## 최신 개발 문서

Composable Architecture의 가장 최신 버전 개발 문서는 [여기서](https://pointfreeco.github.io/swift-composable-architecture/) 확인하실 수 있습니다.

## 도움받기

Composable Architecture에 대해 궁금한 점이 있거나 저희와 토론을 하고 싶으신 경우엔 [discussions](https://github.com/pointfreeco/swift-composable-architecture/discussions) 탭에서 토픽을 만드시면 됩니다. 혹은 [Swift 포럼](https://forums.swift.org/c/related-projects/swift-composable-architecture)에서도 가능합니다.

## 감사 인사

아래는 라이브러리 초기 개발 단계부터 피드백을 주시고 지금의 Composable Architecture가 있을 수 있게 도와주신 고마운 분들의 목록입니다.

Paul Colton, Kaan Dedeoglu, Matt Diephouse, Josef Doležal, Eimantas, Matthew Johnson, George Kaimakas, Nikita Leonov, Christopher Liscio, Jeffrey Macko, Alejandro Martinez, Shai Mishali, Willis Plummer, Simon-Pierre Roy, Justin Price, Sven A. Schmidt, Kyle Sherman, Petr Šíma, Jasdev Singh, Maxim Smirnov, Ryan Stone, Daniel Hollis Tavares, 그리고 모든 [Point-Free](https://www.pointfree.co) 구독자분들까지 모두 감사드립니다. 😁

특히, SwiftUI의 기이한 문제들을 해결하고 최종 API를 개선하는 데 도움을 준 [Chris Liscio](https://twitter.com/liscio)께는 특별한 감사를 드리고 싶습니다.

그리고 [Shai Mishali](https://github.com/freak4pc)와 [CombineCommunity](https://github.com/CombineCommunity/CombineExt/) 프로젝트의 `Publishers.Create`가 있었기 때문에 `Effect`에서 델리게이트와 콜백 기반 API를 연결하여 타사 프레임워크와 통신할 때 더 나은 인터페이스를 만들 수 있었습니다. 감사드립니다.

## 다른 대안

Composable Architecture는 [Elm](https://elm-lang.org)이나 [Redux](https://redux.js.org/)같은 다른 라이브러리들의 아이디어에 기반해서 만들어졌습니다.

iOS 커뮤니티에는 Composable Architecture 이외에도 다른 아키텍처 라이브러리가 있습니다. 각자 다른 특징을 가지고 있으니 살펴보시는 것도 추천합니다.

* [RIBs](https://github.com/uber/RIBs)
* [Loop](https://github.com/ReactiveCocoa/Loop)
* [ReSwift](https://github.com/ReSwift/ReSwift)
* [Workflow](https://github.com/square/workflow)
* [ReactorKit](https://github.com/ReactorKit/ReactorKit)
* [RxFeedback](https://github.com/NoTests/RxFeedback.swift)
* [Mobius.swift](https://github.com/spotify/mobius.swift)
* <details>
  <summary>펼쳐보기</summary>

  * [Fluxor](https://github.com/FluxorOrg/Fluxor)
  * [PromisedArchitectureKit](https://github.com/RPallas92/PromisedArchitectureKit)
  </details>

## 라이센스

이 라이브러리는 MIT 라이센스를 따릅니다. 자세한 사항은 [LICENSE](https://github.com/pointfreeco/swift-composable-architecture/blob/main/LICENSE)를 참고해주세요.
