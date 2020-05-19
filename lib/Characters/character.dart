import 'charAttribute.dart';

class Character {
  //zakladni udaje
  CharAttribute _fotka,
      _jmeno,
      _prijmeni,
      _prezdivka,
      _pohlavi,
      _datumnarozeni,
      _jeNazivu,
      _datumumrti,
      _narodnost,
      _vyska,
      _vaha,
      _mobil,
      _povolani,
      _vztahKuObeti;

  //udaje k pripadu
  CharAttribute _otiskprstu, _dna, _alibi, _jeSvedek;

  //stav
  CharAttribute _jeZnamy, _jeHlavniPodezrely, _jePodezrely, _jeNevinny;

  //data
  CharAttribute _color, _jeObet, _jeHledanaOsoba;

  //status
  CharAttribute _trpelivost;

  //lokace
  List<CharAttribute> _lokace;

  //popis od ostatnich
  List<CharAttribute> _popis;

  Character(
      this._fotka,
      this._jmeno,
      this._prijmeni,
      this._prezdivka,
      this._pohlavi,
      this._datumnarozeni,
      this._jeNazivu,
      this._datumumrti,
      this._narodnost,
      this._vyska,
      this._vaha,
      this._mobil,
      this._povolani,
      this._vztahKuObeti,
      this._otiskprstu,
      this._dna,
      this._alibi,
      this._jeSvedek,
      this._jeZnamy,
      this._jeHlavniPodezrely,
      this._jePodezrely,
      this._jeNevinny,
      this._color,
      this._jeObet,
      this._jeHledanaOsoba,
      this._trpelivost,
      this._lokace,
      this._popis);

  get fotka => this._fotka;

  get jmeno => this._jmeno;

  get prijmeni => this._prijmeni;

  get prezdivka => this._prezdivka;

  get pohlavi => this._pohlavi;

  get datumnarozeni => this._datumnarozeni;

  get jeNazivu => this._jeNazivu;

  get datumumrti => this._datumumrti;

  get narodnost => this._narodnost;

  get vyska => this._vyska;

  get vaha => this._vaha;

  get mobil => this._mobil;

  get povolani => this._povolani;

  get vztahKuObeti => this._vztahKuObeti;

  get otiskprstu => this._otiskprstu;

  get dna => this._dna;

  get alibi => this._alibi;

  get jeSvedek => this._jeSvedek;

  get jeZnamy => this._jeZnamy;

  get jeHlavniPodezrely => this._jeHlavniPodezrely;

  get jePodezrely => this._jePodezrely;

  get jeNevinny => this._jeNevinny;

  get color => this._color;

  get jeObet => this._jeObet;

  get jeHledanaOsoba => this._jeHledanaOsoba;

  get trpelivost => this._trpelivost;

  get lokace => this._lokace;

  get popis => this._popis;
}
