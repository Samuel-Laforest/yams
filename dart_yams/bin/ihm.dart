import 'dart:io';

import 'des.dart';
import 'joueur.dart';
import 'yams.dart';

class IHM {
  // affiche le titre
  static void titre() {
    print("");
    print("Bienvenue dans :");
    print("__   __                  \n" +
        "\\ \\ / /_ _ _ __ ___  ___ \n" +
        " \\ V / _` | '_ ` _ \\/ __|\n" +
        "  | | (_| | | | | | \\__ \\\n" +
        "  |_|\\__,_|_| |_| |_|___/\n");
  }

// methode pour commencer une partie
  static bool menu() {
    bool saisieValide = false;
    bool veutJouer = false;
    while (!saisieValide) {
      print("Souhaitez vous commencer une partie ? (o/n)");
      String reponse = stdin.readLineSync().toString();
      if (reponse.toLowerCase() == "o") {
        saisieValide = true;
        veutJouer = true;
      } else if (reponse.toLowerCase() == "n") {
        saisieValide = true;
        print("Au revoir.");
      } else {
        print("Erreur dans la saisie.");
      }
    }
    return veutJouer;
  }

// methode private pour initialiser une partie de yams à X joueurs
  static Yams nbJoueur() {
    bool saisieValide = false;
    Yams y = Yams.vide();
    int i = 0;
    while (!saisieValide) {
      print("Pour combien de joueur ? (entre 2 et 5)");
      try {
        i = int.parse(stdin.readLineSync().toString());
        if (i >= 2 && i <= 5) {
          saisieValide = true;
          y = new Yams(i);
        } else {
          print("Erreur dans la saisie.");
        }
      } catch (e) {
        print("Erreur dans la saisie.");
      }
    }
    return y;
  }

// methode pour restart une partie
  static bool restart() {
    bool saisieValide = false;
    bool veutJouer = false;
    while (!saisieValide) {
      print("Souhaitez vous recommencer une partie ? (o/n)");
      String reponse = stdin.readLineSync().toString();
      if (reponse.toLowerCase() == "o") {
        saisieValide = true;
        veutJouer = true;
      } else if (reponse.toLowerCase() == "n") {
        saisieValide = true;
        print("Au revoir.");
      } else {
        print("Erreur dans la saisie.");
      }
    }
    return veutJouer;
  }

// methode pour afficher en ligne une liste de dés de manière tx
  static void _afficheListDes(List<Des> lesDes) {
    String ligne = "";
    for (int i = 0; i < lesDes.length; i++) {
      ligne = ligne + "+---+ ";
    }
    print(ligne);
    ligne = "";
    for (Des d in lesDes) {
      ligne = ligne + "| " + d.getResultat().toString() + " | ";
    }
    print(ligne);
    ligne = "";
    for (int i = 0; i < lesDes.length; i++) {
      ligne = ligne + "+---+ ";
    }
    print(ligne);
  }

// methode pour afficher en ligne une liste de dés de manière tx
  static void _afficheDes(Des d) {
    print("+---+\n| " + d.getResultat().toString() + " |\n+---+ ");
  }

// methode qui demande si le joueur veut relancer des dés
  static bool _relanceDesDes() {
    bool saisieValide = false;
    bool relancer = false;
    while (!saisieValide) {
      print("Souhaitez vous relancer certains dés ? (o/n)");
      String reponse = stdin.readLineSync().toString();
      if (reponse.toLowerCase() == "o") {
        saisieValide = true;
        relancer = true;
      } else if (reponse.toLowerCase() == "n") {
        saisieValide = true;
      } else {
        print("Erreur dans la saisie.");
      }
    }
    return relancer;
  }

  // methode qui demande si le joueur veut relancer un dé
  static List<Des> _relanceChaqueDes(List<Des> lesDes) {
    List<Des> desARelancer = new List.empty(growable: true);

    for (Des d in lesDes) {
      _afficheDes(d);

      bool saisieValide = false;
      while (!saisieValide) {
        print("Souhaitez vous relancer ce dé ? (o/n)");
        String reponse = stdin.readLineSync().toString();
        if (reponse.toLowerCase() == "o") {
          saisieValide = true;
          desARelancer.add(d);
        } else if (reponse.toLowerCase() == "n") {
          saisieValide = true;
        } else {
          print("Erreur dans la saisie.");
        }
      }
    }
    return desARelancer;
  }

// methode pour le tour d'un joueur
  static void tourDeJoueur(Joueur j) {
    print("Le " + j.getNom() + " obtient le jet suivant :");
    j.lancerDes();
    j.determineResultat();
    _afficheListDes(j.getSesDes());
    print(j.getResultat().toString());
    int nbrelance = 0;
    do {
      bool relancer = _relanceDesDes();
      if (relancer) {
        j.lancerDesDes(_relanceChaqueDes(j.getSesDes()));
        j.determineResultat();
        _afficheListDes(j.getSesDes());
        print(j.getResultat().toString());
        nbrelance++;
      } else {
        nbrelance = 2;
      }
    } while (nbrelance < 2);
  }

// affiche le resultat de la manche en cours
  static void recapResultatsManche(List<Joueur> lesJoueurs) {
    print("+---------------------------------------------------+");
    print("| Recapitulatif des résultats pour le tour en cours |");
    print("+---------------------------------------------------+");
    for (Joueur j in lesJoueurs) {
      String ligne = "";
      if (j.getSesDes()[0].getResultat() == 0) {
        ligne = j.getNom() + ": En attente de lancé.";
      } else {
        ligne = j.getNom() + ": " + j.getResultat().toString();
        int unique = j.meilleurDesUnique().getResultat();
        if (unique != 0) {
          ligne =
              ligne + ". Son meilleur dé unique est à : " + unique.toString();
        }
        //ligne = j.toString();
      }
      print(ligne);
    }
  }

// affiche le resultat de la partie
  static void recapResultatsPartie(Yams yams) {
    print("+------------------------------------------+");
    print("| Recapitulatif des résultats de la partie |");
    print("+------------------------------------------+");
    int manche = 1;
    for (Joueur j in yams.getLesGagnantsManches()) {
      String ligne =
          "Manche n°" + manche.toString() + " gagnée par: " + j.getNom();
      manche++;
      print(ligne);
    }
  }

//affiche Numéro de manche
  static void afficheJoueur(Joueur j) {
    print("+---------+");
    print("| " + j.getNom() + " |");
    print("+---------+");
  }

//affiche le Joueur
  static void afficheManche(int n) {
    print("+-------------+");
    print("| Manche n°" + n.toString() + ": |");
    print("+-------------+");
  }

// affiche le gagnant de la manche en cours
  static void afficheGagnantDeLaManche(Yams yams) {
    int numM = yams.getLesGagnantsManches().length;
    Joueur gagnant = yams.meilleurJoueur();
    if (gagnant.getNom() == "nobody") {
      //egalité
      afficheManche(numM);
      print("==> Égalité");
    } else {
      // afficher le gagant
      afficheManche(numM);
      print("==> Victoire de: " + gagnant.getNom());
    }
  }

// affiche le gagnant de la partie
  static void afficheGagnantDeLaPartie(Yams yams) {
    Joueur gagnant = yams.getGagnantPartie();
    // afficher le gagant
    print("+------------------+");
    print("| Fin de la partie |");
    print("+------------------+");
    print("==> Victoire de: " + gagnant.getNom());
  }
}
