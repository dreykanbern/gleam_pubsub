import gleam/list
import types.{type PubSub, type Subscriber}

/// Creates a new PubSub system.
/// Создает новую систему PubSub.
pub fn new() -> PubSub(event) {
  PubSub(subscribers: [])
}

/// Subscribes a new subscriber to the PubSub system.
/// Подписывает нового подписчика на систему PubSub.
pub fn subscribe(
  pub_sub: PubSub(event),
  subscriber: Subscriber(event),
) -> PubSub(event) {
  let PubSub(subscribers) = pub_sub
  PubSub(subscribers: [subscriber, ..subscribers])
}

/// Unsubscribes a subscriber from the PubSub system by their ID.
/// Отписывает подписчика от системы PubSub по его ID.
pub fn unsubscribe(pub_sub: PubSub(event), id: Int) -> PubSub(event) {
  let PubSub(subscribers) = pub_sub
  let new_subscribers =
    list.filter(subscribers, fn(sub) {
      case sub {
        Subscriber(sub_id, _) -> sub_id != id
      }
    })
  PubSub(subscribers: new_subscribers)
}

/// Publishes an event to all subscribers.
/// Публикует событие всем подписчикам.
pub fn publish(pub_sub: PubSub(event), event: event) -> Nil {
  let PubSub(subscribers) = pub_sub
  list.each(subscribers, fn(subscriber) {
    let Subscriber(_, notify) = subscriber
    notify(event)
  })
}
