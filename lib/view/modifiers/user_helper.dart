class User {
  final String urlAvatar;
  final String name;
  final int age;

  final String gender;

  const User({
    required this.urlAvatar,
    required this.name,
    required this.age,
    required this.gender,
  });
}

final users = [
  const User(
    urlAvatar:
        "https://images.unsplash.com/photo-1578616070222-50c4de9d5ade?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=656&q=80",
    name: "Shiji",
    age: 28,
    gender: 'F',
  ),
  const User(
    urlAvatar:
        "https://images.unsplash.com/photo-1552663651-2e4250e6c7c8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
    name: "Greeshma",
    age: 24,
    gender: 'F',
  ),
  const User(
    urlAvatar:
        "https://images.unsplash.com/photo-1546961329-78bef0414d7c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
    name: "Kiran",
    age: 24,
    gender: 'M',
  ),
  const User(
    urlAvatar:
        "https://images.unsplash.com/photo-1563351672-62b74891a28a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
    name: "Priyaranjan",
    age: 24,
    gender: 'M',
  ),
  const User(
    urlAvatar:
        "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
    name: "Arjun",
    age: 28,
    gender: 'M',
  ),
  const User(
    urlAvatar:
        'https://images.unsplash.com/photo-1561677843-39dee7a319ca?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
    name: 'Solomon',
    age: 32,
    gender: 'M',
  ),
];
