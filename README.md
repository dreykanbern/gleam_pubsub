
# Gleam pub/sub

[![English](https://img.shields.io/badge/language-English-blue)](#english-description) [![Русский](https://img.shields.io/badge/language-Русский-blue)](#описание-на-русском)

## English Description

### Description

Simple pub/sub pattern for the Gleam language.

Gleam_pubsub is a library that provides a simple publish-subscribe mechanism in the Gleam programming language.
It allows you to create pub/sub systems where subscribers can listen to events published by publishers.

### Build and Run

To build the project, run:

```sh
gleam build
```

To run the project, use:

```sh
gleam run
```

### Quick Example

```gleam
import gleam/io
import gleam_pubsub.{new, subscribe, publish, Subscriber}

pub fn main() {
  let pubsub = new()
  
  let subscriber1 = Subscriber(
    id: 1,
    notify: fn(event) {
      io.println("Subscriber 1 received: " <> event)
    }
  )
  
  let pubsub = subscribe(pubsub, subscriber1)
  
  publish(pubsub, "Hello, World!")
}
```

### Tests

To run the tests, use:

```sh
gleam test
```

## Описание на русском

### Описание

Простой шаблон pub/sub для языка Gleam.

Gleam_pubsub - это библиотека, которая предоставляет простой паттерн публикации-подписки на языке программирования Gleam.
Она позволяет создавать системы pub/sub, где подписчики могут слушать события, публикуемые издателями.

### Сборка и запуск

Для сборки проекта выполните:

```sh
gleam build
```

Для запуска проекта используйте:

```sh
gleam run
```

### Простой пример

```gleam
import gleam/io
import gleam_pubsub.{new, subscribe, publish, Subscriber}

pub fn main() {
  let pubsub = new()
  
  let subscriber1 = Subscriber(
    id: 1,
    notify: fn(event) {
      io.println("Subscriber 1 получил: " <> event)
    }
  )
  
  let pubsub = subscribe(pubsub, subscriber1)
  
  publish(pubsub, "Привет, Мир!")
}
```

### Тесты

Для запуска тестов используйте:

```sh
gleam test
```

## Contact / Контакт

For any questions or suggestions, please contact me via [Telegram](https://t.me/dreykanbern).

Для любых вопросов или предложений, пожалуйста, свяжитесь со мной через [Telegram](https://t.me/dreykanbern).
