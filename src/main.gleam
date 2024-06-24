import gleam/io
import gleam_pubsub.{Subscriber, new, publish, subscribe}

/// The main function demonstrating how to use the PubSub library.
/// Основная функция, демонстрирующая, как использовать библиотеку PubSub.
pub fn main() {
  // Create a new PubSub system / Создаем новую систему PubSub
  let pubsub = new()

  // Define a subscriber / Определяем подписчика
  let subscriber1 =
    Subscriber(id: 1, notify: fn(event) {
      io.println("Subscriber 1 received: " <> event)
    })

  // Subscribe the subscriber to the PubSub system / Подписываем подписчика на систему PubSub
  let pubsub = subscribe(pubsub, subscriber1)

  // Publish an event to all subscribers / Публикуем событие всем подписчикам
  publish(pubsub, "Hello, World!")
}
