/// Represents a subscriber with a unique ID and a notify function.
/// Представляет подписчика с уникальным ID и функцией уведомления.
pub type Subscriber(event) {
  Subscriber(id: Int, notify: fn(event) -> Nil)
}

/// Represents a PubSub system that holds a list of subscribers.
/// Представляет систему PubSub, содержащую список подписчиков.
pub type PubSub(event) {
  PubSub(subscribers: List(Subscriber(event)))
}

/// Represents the state of a subscriber.
/// Представляет состояние подписчика.
pub type SubscriberState {
  SubscriberState(called: Bool)
}
