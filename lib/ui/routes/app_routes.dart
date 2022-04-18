enum AppRoutes { home, addNote, addFolder }

extension AppRoutesExtension on AppRoutes {
  String get route {
    switch (this) {
      case AppRoutes.home:
        return '/';
      case AppRoutes.addNote:
        return '/ADD_NOTE';
      case AppRoutes.addFolder:
        return '/ADD_FOLDER';
      default:
        return '/';
    }
  }
}
