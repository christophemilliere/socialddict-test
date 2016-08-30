### Liens

admin : http://localhost:3000/admins


### Configuration
La commande pour créer les utilisateurs par défaut `rake users:create`

Ensuite un système d'email est prévu pour le parrainage, donc ne pas oublier

d'ajouter le fichier `application.yml` pour les identifiants de la messagerie, dans le dossier `/config`,

ajouter ceci :

```
development:
  username: key
  pwd: key
```

Ne pas oublier de changer le serveur smtp dans `/config/environments/development` si vous n'utilisez pas google.


### Amélioration.

Pour une meilleure évolution, je pense qu'il faut partir sur une table de liaisons qui serait : `Sponsorships` et dans laquelle il y aurait les champs : user_id, godchild_id.

Ce qui permettrait d'avoir un service avec des méthodes plus allégées.

modifier les urls pour les rendre plus sexy.
