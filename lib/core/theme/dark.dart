import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme() {
  const ColorScheme defaultColors = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xffffb300),
    onPrimary: Color(0xff1e1b06),
    primaryContainer: Color(0xffc87200),
    onPrimaryContainer: Color(0xffffebd0),
    secondary: Color(0xff82b1ff),
    onSecondary: Color(0xff151a1e),
    secondaryContainer: Color(0xff3770cf),
    onSecondaryContainer: Color(0xffddeaff),
    tertiary: Color(0xff448aff),
    onTertiary: Color(0xffeff7ff),
    tertiaryContainer: Color(0xff0b429c),
    onTertiaryContainer: Color(0xffd2dff4),
    error: Color(0xffcf6679),
    onError: Color(0xff1e1214),
    errorContainer: Color(0xffb1384e),
    onErrorContainer: Color(0xfff9dde2),
    outline: Color(0xff9a9a93),
    background: Color(0xff1f1a10),
    onBackground: Color(0xffe4e4e2),
    surface: Color(0xff171510),
    onSurface: Color(0xfff1f1f0),
    surfaceVariant: Color(0xff1e1910),
    onSurfaceVariant: Color(0xffe4e3e2),
    inverseSurface: Color(0xfffffcf8),
    onInverseSurface: Color(0xff0f0e0e),
    inversePrimary: Color(0xff73590e),
    shadow: Color(0xff000000),
  );

  TextTheme basicTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: base.headline1?.copyWith(
        fontSize: 72.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'DDin',
        color: defaultColors.onSurface,
      ),
      headline5: base.headline4?.copyWith(
        fontSize: 18.0,
        fontFamily: 'DDin',
        color: defaultColors.onSurface,
      ),
      caption: base.headline5?.copyWith(
        fontSize: 12.0,
        fontFamily: 'DDin',
      ),
      headline6: base.headline6?.copyWith(
        fontSize: 23.0,
        fontFamily: 'DDin',
      ),
      bodyText1: base.bodyText1?.copyWith(
        color: defaultColors.onSurface,
        fontFamily: 'DDin',
        fontSize: 14,
      ),
    );
  }

  InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    helperMaxLines: 1,
    focusColor: defaultColors.onSurface,
    errorMaxLines: 1,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    floatingLabelAlignment: FloatingLabelAlignment.start,
    isDense: false,
    contentPadding: const EdgeInsets.all(0),
    isCollapsed: false,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: defaultColors.onSurface, width: 0.5),
    ),
    filled: false,
    alignLabelWithHint: false,
  );

  TextButtonThemeData textButtonTheme = TextButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.fromLTRB(0, 0, 0, 0))));

  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: defaultColors.primary,
    primaryColorLight: const Color(0xFFfffd50),
    primaryColorDark: const Color(0xFFc79a00),
    scaffoldBackgroundColor: defaultColors.background,
    dialogBackgroundColor: defaultColors.background,
    toggleableActiveColor: defaultColors.primary,
    highlightColor: defaultColors.secondary,
    indicatorColor: defaultColors.secondary,
    fontFamily: 'DDin',
    textTheme: basicTextTheme(const TextTheme()),
    inputDecorationTheme: inputDecorationTheme,
    textButtonTheme: textButtonTheme,
    colorScheme: defaultColors,
    applyElevationOverlayColor: true,
    backgroundColor: defaultColors.background,
    bottomAppBarColor: defaultColors.surface,
    canvasColor: defaultColors.background,
    cardColor: defaultColors.surface,
    disabledColor: defaultColors.onSurfaceVariant,
    dividerColor: defaultColors.shadow,
    errorColor: defaultColors.error,
    focusColor: const Color(0x1fffffff),
    hintColor: const Color(0x99ffffff),
    hoverColor: const Color(0x0affffff),
    // appBarTheme: appBarTheme(const TextTheme()),
  );
}
