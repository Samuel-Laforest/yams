import 'combinaison.dart';
import 'des.dart';

class Resultat {
  // attributs
  List<Combinaison> _lesCombinaisons =
      new List.empty(growable: true); //regroupe les combinaisons
  List<int> _tabRecap = new List.generate(
      6,
      (index) =>
          0); // fait un récap d'un lancé, avec pour une case du tableau égale à une valeur d'un dé (ex: tab[0] = le nombr de dé qui ont fait 1)
  //constructeur
  Resultat();
  // getter & setter
  List<Combinaison> getLesCombinaison() {
    return this._lesCombinaisons;
  }

  List<int> getTabRecap() {
    return this._tabRecap;
  }

  // autres méthodes
  // vide la liste des combinaisons
  void clear() {
    _lesCombinaisons = List.empty(growable: true);
  }

  // ajoute une combinaison à la liste de combinaison
  void ajouterCombinaison(Combinaison c) {}

  // vide le tableau de recap
  void cleartab() {
    _tabRecap = List.generate(6, (index) => 0);
  }

  // calcul et remplit le récap des dés a partir d'une liste de dé
  void calculRecap(List<Des> desACalculer) {
    // on vide au préalable le tableau avec cleartab
  }

  // retourne le niveau de combinaison
  // en prenant en compte le full et la double paire
  // (car non prit en compte dans les instances de combinaison)
  int getNiveauCombinaisons() {}

// compare deux objets résultats
// retour positif si l'objet courant est supérieur à l'objet en parametre
// retour negatif si l'objet courant est inférieur à l'objet en parametre
// retour eégale à 0 si l'objet courant est égal à l'objet en parametre
  int compareTo(Resultat r) {}

  @override
  String toString() {
    String r = "";
    for (Combinaison c in this._lesCombinaisons) {
      if (this._lesCombinaisons.last == c) {
        r = r + c.toString();
      } else {
        r = r + c.toString() + " et ";
      }
    }
    return r;
  }
}
