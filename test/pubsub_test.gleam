import gleam/io
import gleeunit/should
import pubsub.{new, publish, subscribe, unsubscribe}
import types.{type Subscriber, type SubscriberState}

// Функция для обновления состояния подписчика
fn update_state(state: SubscriberState) -> fn(event) -> Nil {
  fn(_event) {
    let SubscriberState(_) = state
    let new_state = SubscriberState(True)
    new_state
  }
}

// Тестируем функциональность подписки
pub fn subscribe_test() {
  let pub_sub = new()
  let subscriber_called = SubscriberState(False)
  let notify_fn = update_state(subscriber_called)

  let subscriber = Subscriber(id: 1, notify: notify_fn)

  let pub_sub = subscribe(pub_sub, subscriber)

  // Логирование события публикации
  io.println("Publishing 'Test Event' in subscribe_test")

  publish(pub_sub, "Test Event")

  // Проверка, что подписчик был уведомлен
  should.equal(True, subscriber_called.called, "Subscriber should be notified")
}

// Тестируем функциональность отписки
pub fn unsubscribe_test() {
  let pub_sub = new()
  let subscriber_called = SubscriberState(False)
  let notify_fn = update_state(subscriber_called)

  let subscriber = Subscriber(id: 1, notify: notify_fn)

  let pub_sub = subscribe(pub_sub, subscriber)
  let pub_sub = unsubscribe(pub_sub, 1)

  // Логирование события публикации
  io.println("Publishing 'Test Event' in unsubscribe_test")

  publish(pub_sub, "Test Event")

  // Проверка, что подписчик не был уведомлен
  should.equal(
    False,
    subscriber_called.called,
    "Subscriber should not be notified after unsubscribing",
  )
}

// Тестируем работу с несколькими подписчиками
pub fn multiple_subscribers_test() {
  let pub_sub = new()
  let subscriber1_called = SubscriberState(False)
  let subscriber2_called = SubscriberState(False)

  let notify_fn1 = update_state(subscriber1_called)
  let notify_fn2 = update_state(subscriber2_called)

  let subscriber1 = Subscriber(id: 1, notify: notify_fn1)
  let subscriber2 = Subscriber(id: 2, notify: notify_fn2)

  let pub_sub = subscribe(pub_sub, subscriber1)
  let pub_sub = subscribe(pub_sub, subscriber2)

  // Логирование события публикации
  io.println("Publishing 'Test Event' in multiple_subscribers_test")

  publish(pub_sub, "Test Event")

  // Проверка, что оба подписчика были уведомлены
  should.equal(
    True,
    subscriber1_called.called,
    "Subscriber 1 should be notified",
  )
  should.equal(
    True,
    subscriber2_called.called,
    "Subscriber 2 should be notified",
  )
}

// Тестируем публикацию без подписчиков
pub fn publish_no_subscribers_test() {
  let pub_sub = new()

  // Логирование события публикации
  io.println("Publishing 'Test Event' in publish_no_subscribers_test")

  publish(pub_sub, "Test Event")

  // Проверка, что нет ошибок при публикации без подписчиков
  should.be_true(True)
}

pub fn main() {
  gleeunit.main([
    subscribe_test,
    unsubscribe_test,
    multiple_subscribers_test,
    publish_no_subscribers_test,
  ])
}
