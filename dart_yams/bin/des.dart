import 'dart:math';

class Des {
  //attributs
  final int _nbFace = 6;
  int _resultat = 0;
  //construteur
  Des();
  //getter & setter
  int getNbFace() {
    return this._nbFace;
  }

  int getResultat() {
    return this._resultat;
  }

  //autres methodes
  // permet de lancer le dé
  void jetter() {}

  @override
  String toString() {
    return getResultat().toString();
  }
}
