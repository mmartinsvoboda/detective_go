class Dialogue {
  String _id, _description, _type, _asker, _subject;
  bool _beenTold, _revealed;
  List<String> _assign, _text, _toReveal;

  Dialogue(
      this._id,
      this._description,
      this._beenTold,
      this._assign,
      this._type,
      this._asker,
      this._subject,
      this._text,
      this._revealed,
      this._toReveal);

  get id => this._id;
  get desctiption => this._description;
  get beenTold => this._beenTold;
  get assign => this._assign;
  get type => this._type;
  get asker => this._asker;
  get subject => this._subject;
  get text => this._text;
  get revealed => this._revealed;
  get toReveal => this._toReveal;
}
