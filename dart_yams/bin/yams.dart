import 'joueur.dart';

class Yams {
  // attributs
  List<Joueur> _lesJoueurs = new List.empty(growable: true);
  List<Joueur> _lesGagnantsManches = new List.empty(growable: true);
  //constructeurs
  Yams.vide();
  Yams(int nbJoueur) {
    init(nbJoueur);
  }
  // getter & setter
  List<Joueur> getLesJoueurs() {
    return this._lesJoueurs;
  }

  List<Joueur> getLesGagnantsManches() {
    return this._lesGagnantsManches;
  }

  // autres méthodes
  // retourne le joueur qui à gagné (cad, qui possède 2 manches gagnées)
  Joueur getGagnantPartie() {}

  // retourne un bouléen pour savoir si la partie est terminé
  bool partieFinie() {
    bool fin_partie = false;
    for (Joueur x in this._lesGagnantsManches) {
      if (x.getMancheGagnee() == 2) {
        fin_partie = true;
      }
    }
    return fin_partie;
  }

  // initialise les variables du jeu
  void init(int nbJoueur) {
    // on oublie pas de vider les listes,
    //pour pourvoir faier recommencer le jeu sans créer de nouvelle instance
  }

  // ajoute un joueur ayant gagné une manche à la liste des manches gagné
  // et incrémente la valeur de manche gagné du joueur
  void ajouterGagnant(Joueur j) {}

  // retourne le meilleur joueur de la manche
  // en cas d'égalité, un joueur nobody est retourné
  Joueur meilleurJoueur() {}
}
