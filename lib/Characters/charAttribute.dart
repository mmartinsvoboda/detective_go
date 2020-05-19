class CharAttribute {
  String _value;
  bool _isKnown;

  //TODO change to conversation class
  String _conversation;

  CharAttribute(this._value, this._isKnown, this._conversation);

  get value => this._value;

  get isKnown => this._isKnown;

  get conversation => this._conversation;

  void setValue(String value) {
    this._value = value;
  }
}
