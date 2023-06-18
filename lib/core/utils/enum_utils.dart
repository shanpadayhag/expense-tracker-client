class EnumUtil {
  T getEnumValueFromString<T>(List<T> enumValues, String? value) {
    for (final enumValue in enumValues) {
      if (enumValue.toString() == 'FinancialTypeEnum.$value') {
        return enumValue;
      }
    }

    throw ArgumentError('Invalid $T value: $value');
  }
}
