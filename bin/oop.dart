void main(List<String> arguments) {
  // Object Oriented Programming (OOP)
  // Membuat object Car
  var car1 = Car();
  car1.color = 'Red';
  car1.brand = 'Toyota';
  car1.year = 2020;
  car1.drive();
  car1.honk();
  print('Car 1: ${car1.color}, ${car1.brand}');

  // Membuat object Cat
  Cat cat1 = Cat();
  cat1.eat();
  cat1.meow();

  // Membuat object Dog
  Dog dog1 = Dog();
  dog1.eat();
  dog1.bark();
}

class Car {
  // Property
  String color = '';
  String brand = '';
  int year = 0;

  // Method
  void drive() {
    print('The $color $brand is driving.');
  }

  void honk() {
    print('The $color $brand is honking.');
  }
}

class Animal {
  void eat() {
    print('The animal is eating.');
  }
}

class Cat extends Animal {
  void meow() {
    print('The cat is meowing.');
  }
}

class Dog extends Animal {
  void bark() {
    print('The dog is barking.');
  }
}