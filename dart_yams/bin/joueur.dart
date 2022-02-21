import 'combinaison.dart';
import 'des.dart';
import 'resultat.dart';

class Joueur {
  // attributs
  String _nom = "";
  List<Des> _sesDes = List.generate(5, (index) => new Des());
  Resultat _resultat = new Resultat();
  int _mancheGagnee = 0;

  // constructeur
  Joueur(this._nom);
  Joueur.nobody() {
    this._nom = "nobody";
  }

  // getter & setter
  String getNom() {
    return this._nom;
  }

  List<Des> getSesDes() {
    return this._sesDes;
  }

  Resultat getResultat() {
    return this._resultat;
  }

  int getMancheGagnee() {
    return this._mancheGagnee;
  }

// autres méthodes
// incrémente le nombre de manche gagnée de +1
  void setMancheGagnee() {
    _mancheGagnee++;
  }

  // lance tout les dés
  void lancerDes() {
    for (Des unDes in this._sesDes) {}
  }

  // permet de lancer une liste de dés précis parmis les dés du joueurs
  void lancerDesDes(List<Des> lesDes) {}

  // vérifie si la liste de dés sont des dés de la liste du joueur
  bool _verifieAppartenance(List<Des> desDes) {}

  //retoune le plus grand resultat parmis les dés
  Des lePlusGrand() {}

  // trie les dés le plus grand au plus petit
  void trierDes() {}

// donne le nb de paire parmis les dés
  int nbPaire() {}

  // determine si il y a des paires parmi les dés
  bool possedePaire() {}

  // determine les combinaisons et donc le resultat
  void determineResultat() {
    // trie les dés dans l'ordre décroissant

    // vide la liste de resultat

    // test les dès pour connaitre les combinaisons
    // et les ajoutes dans les résultats

    // si pas de combinaison, un fait une combinaison de valeur 0,
    // poour un simple dés, on prend la plus haute valeur
  }

  // retourne ne le niveau de combinaison des resultats du joueur
  int getNiveauCombinaisons() {}

  // retourne le dés unique le plus haut; sinon un dés avec un resultat de 0;
  Des meilleurDesUnique() {}

  @override
  String toString() {
    String affichage = "Nom : " + this._nom + "\nResultat des dés: ";
    for (Des unDes in this._sesDes) {
      affichage = affichage + unDes.getResultat().toString() + "";
    }
    affichage =
        affichage + "\nMeilleur unique: " + meilleurDesUnique().toString();
    return affichage;
  }
}
