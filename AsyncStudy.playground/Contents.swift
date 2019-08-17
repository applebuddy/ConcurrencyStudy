import UIKit

var str = "Hello, playground"

// MARK: -

// Concurrency를 공부 하기 전? 5가지 FAQ
// 1) What is concurrency? 무엇이 동시성인가?
// DispatchQueue, OperationQueue

// 2) Why use concurrency? 왜 동시성을 사용해야 하는가?
// 테이블에 이미지 로딩 등을 할 때 메인스레드로만 돌리면 지연이 생긴다.(한개의 코어에서도 작은 단위로 나눠서 실행함으로서 지연을 해결할 수 있다. Parallels 방식이면 실제로도 다수의 코어에서 Concurrency하게 실행할 수 있다.

// 3) How do you use concurrency? 어떻게 동시성을 사용할래??
// * 공유되는 자원이 동시에 Thread Safe하게 변경되지 않도록 사용해야한다.
// ➢ A, B, C 쓰레드 등이 자원을 공유한다면? 데드락 등의 문제가 생길 수 있다.

// 4) GCD or OperationQueue?
// GCD 비교적 사용하기 좀 더 쉽다. OperationQueue는 객체지향, 캡슐성, 의존성작업, 작업중간처리, KVO 등의 특징으로 좀더 복잡하다.

// 5) Where do tasks run?
// 어디서 동작이 실행되는가??

// MARK: -

// * Concurrency 프로그래밍은 위험성을 담고 있다. 실제론 동시적 순서로 실행되는 것이 아니기 때문이다.
// 1) Race condition 상의 문제가 생길 수 있다. => 의도치 않은 스레드에서 연산이 끝나버릴 수 있음.
// serialQueue의 사용,
// 2) priority Inversion
// low -> medium -> high Priority Task -> medium이 종료, low가 재개하지만 high task는 실행되는 상태...
// Deadrock, 교착상태에 빠지며 메모리 누수가 발생할 수 있다.

// Concurrency 와 Synchronous는 같은가?? "NO"
// Serial vs Concurrent? => 한개의 스레드냐 다수의 스레드냐??
// DispatchQueue.globlal() // .default qos(Quality Of Service Level, 서비스 레벨의 지정 가능)

// DispatchQueue의 사용 방법들 및 스레드 동작 방식
let userQueue = DispatchQueue.global(qos: .userInitiated)
// Quality Of Service 우선순위를 지정한 Global Concurrent Queue -> 서브 스레드에서 동작

let defaultQueue = DispatchQueue.global()
// Global 스레드를 사용한 Concurrent Queue -> 서브 스레드에서 동작

let mainQueue = DispatchQueue.main // FIFO
// ✭ 메인스레드에서 동작하는 Serial Queue -> 메인 스레드에서 동작

let workerQueue = DispatchQueue(label: "com.raywenderlich.worker")
// 시리얼 큐, Sync -> Main Thread 에서 동작 Async -> Sub Thread 에서 동작
