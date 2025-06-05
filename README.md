# GitHub User Explorer

A simple iOS app demonstrating GitHub user profile fetching, followers/following lists, and navigation using SwiftUI, async/await, and a clean architecture with caching.

## Features

- Search GitHub users by username
- Display user details: avatar, username, name, bio, followers, and following counts
- View lists of followers and following users
- Navigate between profiles and lists
- Cache user data to reduce API calls and improve performance
- Handle API errors and show placeholder UI
- Custom image loading with caching using CachedAsyncImage

## Architecture

- MVVM pattern for separation of concerns
- Protocol-based API service to allow easy mocking and testing
- Async/await networking with error handling
- SwiftUI for declarative UI and navigation

## Demonstration

Watch a short demo video showing the app in action: [Demo Video](https://youtube.com/shorts/8UNIBcDh164)

## 🕒 Journal du temps passé – Projet GitHub API Viewer

**Date :** 5 juin 2025  

| Heure approximative  | Durée    | Tâche effectuée                                                                                     | Détails                                                                                      |
|----------------------|----------|------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------|
| 09:00 – 09:30         | 30 min   | Initial Commit & Setup                                                                               | Commit initial, ajout de la structure MVVM.                                                  |
| 09:30 – 10:30         | 1 h      | Implémentation de `GitHubAPIService`                                                                 | Création du service pour récupérer les données via l’API GitHub.                            |
| 10:30 – 11:00         | 30 min   | Tests unitaires                                                                                      | Ajout de tests unitaires pour `GitHubAPIService`.                                           |
| 11:00 – 12:00         | 1 h      | Vue de recherche utilisateur (`user-search`)                                                         | Développement de l’interface de recherche avec intégration API.                             |
| 12:00 – 13:00         | 1 h      | Gestion des followers / following                                                                    | Vue pour afficher les utilisateurs suivis et followers.                                     |
| 13:00 – 13:45         | 45 min   | Vue profil utilisateur                                                                               | Création de la vue profil avec intégration des données API.                                |
| 13:45 – 14:15         | 30 min   | Mise en place du système de cache                                                                    | Ajout d’un service de cache pour améliorer les performances.                                |
| 14:15 – 14:30         | 15 min   | Configuration UI (`ProfileImageView`)                                                                | Rendre la taille de l’image de profil configurable.                                         |
| 14:30 – 15:00         | 30 min   | Refactorisation (`GitHubUserDetailView`)                                                             | Amélioration de la lisibilité du code.                                                      |
| 15:00 – 15:15         | 15 min   | Vérification & merge des pull requests                                                               | Intégration finale des branches : `user-search`, `profile`, `caching`, `refactor`.          |

---

### ✅ Résumé

- **Temps total estimé :** **6 h 45 min**
- Tous les commits sont **signés et vérifiés**.
- Le développement est structuré par **fonctionnalités**, avec une architecture **MVVM** propre.

