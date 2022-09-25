import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/l10n/repository/language_repository_impl.dart';

final languageProvider = StateNotifierProvider((ref) => LanguageNotifier());