class Language {
  final String code;
  final String name;
  final String subtitle;

  const Language({
    required this.code,
    required this.name,
    required this.subtitle,
  });

  static const List<Language> all = [
    Language(code: "en", name: "English", subtitle: "Hi"),
    Language(code: "hi", name: "Hindi", subtitle: "नमस्ते"),
    Language(code: "bn", name: "Bengali", subtitle: "হ্যালো"),
    Language(code: "kn", name: "Kannada", subtitle: "ನಮಸ್ಕಾರ"),
    Language(code: "pa", name: "Punjabi", subtitle: "ਸਤ ਸ੍ਰੀ ਅਕਾਲ"),
    Language(code: "ta", name: "Tamil", subtitle: "வணக்கம்"),
    Language(code: "te", name: "Telugu", subtitle: "హలో"),
    Language(code: "fr", name: "French", subtitle: "Bonjour"),
    Language(code: "es", name: "Spanish", subtitle: "Hola"),
  ];
}
