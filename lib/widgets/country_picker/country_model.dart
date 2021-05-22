class CountryModel {
  final String phoneCode;
  final String countryCode;
  final int e164Sc;
  final bool geographic;
  final int level;
  final String name;
  final String example;
  final String displayName;
  final String fullExampleWithPlusSign;
  final String displayNameNoCountryCode;
  final String e164Key;

  CountryModel({
    this.phoneCode,
    this.countryCode,
    this.e164Sc,
    this.geographic,
    this.level,
    this.name,
    this.example,
    this.displayName,
    this.fullExampleWithPlusSign,
    this.displayNameNoCountryCode,
    this.e164Key,
  });

  CountryModel.from({Map<String, dynamic> json})
      : phoneCode = json['e164_cc'] as String,
        countryCode = json['iso2_cc'] as String,
        e164Sc = json['e164_sc'] as int,
        geographic = json['geographic'] as bool,
        level = json['level'] as int,
        name = json['name'] as String,
        example = json['example'] as String,
        displayName = json['display_name'] as String,
        fullExampleWithPlusSign = json['full_example_with_plus_sign'] as String,
        displayNameNoCountryCode = json['display_name_no_e164_cc'] as String,
        e164Key = json['e164_key'] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['e164_cc'] = phoneCode;
    data['iso2_cc'] = countryCode;
    data['e164_sc'] = e164Sc;
    data['geographic'] = geographic;
    data['level'] = level;
    data['name'] = name;
    data['example'] = example;
    data['display_name'] = displayName;
    data['full_example_with_plus_sign'] = fullExampleWithPlusSign;
    data['display_name_no_e164_cc'] = displayNameNoCountryCode;
    data['e164_key'] = e164Key;
    return data;
  }

  @override
  String toString() => 'Country(countryCode: $countryCode, name: $name)';
}
