part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final Brightness brightness;
  final Color color;
  final bool useMaterial3;

  const ThemeState({
    required this.brightness,
    required this.color,
    required this.useMaterial3,
  });

  ThemeState copyWith({
    Brightness? brightness,
    Color? color,
    bool? useMaterial3,
  }) {
    return ThemeState(
      brightness: brightness ?? this.brightness,
      color: color ?? this.color,
      useMaterial3: useMaterial3 ?? this.useMaterial3,
    );
  }

  @override
  List<Object> get props => [brightness, color, useMaterial3];
}




/* part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final Color color;
  final Brightness brightness;
  final bool useMaterial3;
  const ThemeState({
    required this.color,
    required this.brightness,
    required this.useMaterial3,
  });
part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final Color color;
  final Brightness brightness;
  final bool useMaterial3;
  const ThemeState({
    required this.color,
    required this.brightness,
    required this.useMaterial3,
  });

  @override
  List<Object> get props => [color, brightness, useMaterial3];

  ThemeState copyWith({
    Color? color,
    Brightness? brightness,
    bool? useMaterial3,
    double? fontSize,
  }) {
    return ThemeState(
      color: color ?? this.color,
      brightness: brightness ?? this.brightness,
      useMaterial3: useMaterial3 ?? this.useMaterial3,
    );
  }
}

  @override
  List<Object> get props => [color, brightness, useMaterial3];

  ThemeState copyWith({
    Color? color,
    Brightness? brightness,
    bool? useMaterial3,
    double? fontSize,
  }) {
    return ThemeState(
      color: color ?? this.color,
      brightness: brightness ?? this.brightness,
      useMaterial3: useMaterial3 ?? this.useMaterial3,
    );
  }
}
 */