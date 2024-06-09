import 'package:flutter/material.dart';

// CustomColors class definition
class CustomColors extends ThemeExtension<CustomColors> {
  final Color sourceSuccess;
  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;
  final Color sourceInfo;
  final Color info;
  final Color onInfo;
  final Color infoContainer;
  final Color onInfoContainer;

  const CustomColors({
    required this.sourceSuccess,
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.sourceInfo,
    required this.info,
    required this.onInfo,
    required this.infoContainer,
    required this.onInfoContainer,
  });

  @override
  CustomColors copyWith({
    Color? sourceSuccess,
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? sourceInfo,
    Color? info,
    Color? onInfo,
    Color? infoContainer,
    Color? onInfoContainer,
  }) {
    return CustomColors(
      sourceSuccess: sourceSuccess ?? this.sourceSuccess,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      sourceInfo: sourceInfo ?? this.sourceInfo,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      infoContainer: infoContainer ?? this.infoContainer,
      onInfoContainer: onInfoContainer ?? this.onInfoContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;

    return CustomColors(
      sourceSuccess: Color.lerp(sourceSuccess, other.sourceSuccess, t)!,
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      successContainer:
          Color.lerp(successContainer, other.successContainer, t)!,
      onSuccessContainer:
          Color.lerp(onSuccessContainer, other.onSuccessContainer, t)!,
      sourceInfo: Color.lerp(sourceInfo, other.sourceInfo, t)!,
      info: Color.lerp(info, other.info, t)!,
      onInfo: Color.lerp(onInfo, other.onInfo, t)!,
      infoContainer: Color.lerp(infoContainer, other.infoContainer, t)!,
      onInfoContainer: Color.lerp(onInfoContainer, other.onInfoContainer, t)!,
    );
  }
}
/*
// Function to add CustomColors to the ThemeData
ThemeData getCustomTheme(BuildContext context) {
  final ThemeData base = Theme.of(context);

  return base.copyWith(
    extensions: [
      CustomColors(
        sourceSuccess: Colors.green.shade700,
        success: Colors.green,
        onSuccess: Colors.white,
        successContainer: Colors.green.shade100,
        onSuccessContainer: Colors.green.shade900,
        sourceInfo: Colors.blue.shade700,
        info: Colors.blue,
        onInfo: Colors.white,
        infoContainer: Colors.blue.shade100,
        onInfoContainer: Colors.blue.shade900,
      ),
    ],
  );
}
*/
