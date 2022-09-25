import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/l10n/repository/language_repository_impl.dart';

// Create a provider no notify listeners about changes
// For example if a language was choosen
final languageProvider = StateNotifierProvider((ref) => LanguageNotifier());