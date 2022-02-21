class Combinaison {
  // ne prend pas en compte la double pair et le full, car il s'agit de 2 combinaisons
  // d'ou l'utilisation d'une liste de combinaison dans résultat

  //attributs
  int _niveauCombinaison; // permet de connaitre le type de combinaison (yams=6, carré =4 , ...)
  int _valeurD; // valeur des dés pour la catégorie  (carré de 6, yams de 2, ....)

  // constructeur
  Combinaison(this._niveauCombinaison, this._valeurD);

  // getter & setter
  int getValeur() {
    return this._valeurD;
  }

  int getNiveauCombinaison() {
    return this._niveauCombinaison;
  }

  // autres méthodes
  @override
  String toString() {
    String cat = "";
    if (this._niveauCombinaison == 7) {
      cat = "Yams de " + this._valeurD.toString();
    } else if (this._niveauCombinaison == 6) {
      cat = "Carré de " + this._valeurD.toString();
    } else if (this._niveauCombinaison == 4) {
      cat = "Suite au " + this._valeurD.toString();
    } else if (this._niveauCombinaison == 3) {
      cat = "Brelan de " + this._valeurD.toString();
    } else if (this._niveauCombinaison == 1) {
      cat = "Paire de " + this._valeurD.toString();
    } else if (this._niveauCombinaison == 0) {
      cat = "Simple " + this._valeurD.toString();
    }
    return cat;
  }
}
