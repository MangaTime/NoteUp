enum AppRoutes { home, addNote }

extension AppRoutesExtension on AppRoutes {
  String get route {
    switch (this) {
      case AppRoutes.home:
        return '/';
      case AppRoutes.addNote:
        return '/ADD_NOTE';
      default:
        return '/';
    }
  }
}
