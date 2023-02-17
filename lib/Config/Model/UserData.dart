class User {
  final String ImagePath;
  final String Name;
  final String Email;
  final String About;
  final bool isDark;

  const User({
    required this.ImagePath,
    required this.Name,
    required this.Email,
    required this.About,
    required this.isDark,
  });

  User copy({
    String? ImagePath,
    String? Name,
    String? Email,
    String? Password,
    String? About,
    bool? isDark,
  }) =>
      User(
        ImagePath: ImagePath ?? this.ImagePath,
        Name: Name ?? this.Name,
        Email: Email ?? this.Email,
        About: About ?? this.About,
        isDark: isDark ?? this.isDark,
      );

  static User fromJson(Map<String, dynamic> json) => User(
    ImagePath: json['ImagePath'],
    Name: json['Name'],
    Email: json['Email'],
    About: json['About'],
    isDark: json['IsDarkMood'],
  );

  Map<String, dynamic> toJson() => {
    'ImagePath': ImagePath,
    'Name': Name,
    'Email': Email,
    'About': About,
    'IsDarkMood': isDark,
  };
}