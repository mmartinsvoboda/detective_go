class GameLocation {
  String _id, _name, _description, _lat, _long;
  bool _isKnown;
  List<String> _keyword, _character;

  GameLocation(this._id, this._isKnown, this._name, this._description,
      this._lat, this._long, this._keyword, this._character);

  get id => this._id;
  get isKnown => this._isKnown;
  get name => this._name;
  get description => this._description;
  get lat => this._lat;
  get long => this._long;
  get keyword => this._keyword;
  get character => this._character;
}
