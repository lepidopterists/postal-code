class PostalAddress {
  String _code;
  String _place;
  String _complement;
  String _district;
  String _city;
  String _state;
  String _country;

  PostalAddress(this._code, this._place, this._complement, this._district,
      this._city, this._state, this._country);

  PostalAddress.inBrazil(String _code, String _place, String _complement,
      String _district, String _city, String _state)
      : this(_code, _place, _complement, _district, _city, _state, 'Brasil');

  PostalAddress.fromJson(Map<String, dynamic> parsedJson)
      : this(
            parsedJson['cep'],
            parsedJson['logradouro'],
            parsedJson['complemento'],
            parsedJson['bairro'],
            parsedJson['localidade'],
            parsedJson['uf'],
            'Brasil');

  String get country => _country;

  String get state => _state;

  String get city => _city;

  String get district => _district;

  String get complement => _complement;

  String get place => _place;

  String get code => _code;
}
