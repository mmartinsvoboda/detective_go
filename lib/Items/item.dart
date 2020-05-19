class Item {
  String _id,
      _isKnown,
      _name,
      _pic,
      _description,
      _text,
      _defanswer,
      _isNote,
      _noteText;

  Item(this._id, this._isKnown, this._name, this._pic, this._description,
      this._text, this._defanswer, this._isNote, this._noteText);

  get id => this._id;
  get isKnown => this._isKnown;
  get name => this._name;
  get pic => this._pic;
  get description => this._description;
  get text => this._text;
  get defanswer => this._defanswer;
  get isNote => this._isNote;
  get noteText => this._noteText;
}
