import 'en_US_translation.dart';
import 'zh_CN_translation.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en_US': enUS,
    'zh_CN': zhCN
  };
}