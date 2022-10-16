class Chats {
  final String name, image, message, time;
  final bool unread;

  Chats({
    required this.name,
    required this.image,
    required this.message,
    required this.time,
    required this.unread,
  });
}

List<Chats> chats = [
  Chats(
    name: 'Sophia',
    image: 'assets/owners/woman-with-cat1.png',
    message: "hello",
    time: '09:58',
    unread: true,
  ),
  Chats(
    name: 'Annie',
    image: 'assets/owners/woman-with-cat2.png',
    message: "hello",
    time: '09:58',
    unread: false,
  ),
  Chats(
    name: 'Jessica',
    image: 'assets/owners/woman-with-cat3.png',
    message: "hello",
    time: '09:58',
    unread: true,
  ),
];
