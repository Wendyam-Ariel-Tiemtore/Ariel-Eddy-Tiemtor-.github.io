# Portfolio Wendyam Ariel TIEMTORE

Portfolio personnel de Data Scientist / Data Analyst spécialisé en IA de confiance et Machine Learning.

## 🎯 Caractéristiques

- ✨ Design moderne et responsive
- 🎨 Animations fluides (AOS, Particles.js)
- 📱 Mobile-first approach
- 🚀 Performance optimisée
- 🎨 Palette de couleurs professionnelle

## 📂 Structure du Projet

```
portfolio/
├── index.html          # Page principale
├── css/
│   └── main.css       # Styles personnalisés
├── js/
│   └── app.js         # Interactivité
├── img/               # Images et photos
│   ├── avatar.jpg
│   ├── federated-learning.png
│   ├── nlp-llm.png
│   ├── survival.png
│   ├── trading.png
│   └── drone.png
├── cv/                # CV en PDF
│   └── CV_Wendyam_Ariel_TIEMTORE.pdf
└── particles.json     # Configuration particules
```

## 🚀 Installation

### 1. Cloner ou télécharger le projet

```bash
git clone https://github.com/YOUR_USERNAME/portfolio.git
cd portfolio
```

### 2. Ajouter vos images

Placez les images suivantes dans le dossier `img/` :

- `avatar.jpg` : Votre photo de profil (recommandé : 400x400px)
- `federated-learning.png` : Screenshot projet FL
- `nlp-llm.png` : Screenshot projet NLP
- `survival.png` : Screenshot projet Survie
- `trading.png` : Screenshot projet Trading
- `drone.png` : Screenshot projet Drone

### 3. Ajouter votre CV

Placez votre CV PDF dans le dossier `cv/` avec le nom `CV_Wendyam_Ariel_TIEMTORE.pdf`

### 4. Personnaliser les liens

Dans `index.html`, remplacez :

- `YOUR_GITHUB` par votre nom d'utilisateur GitHub
- `YOUR_REPO` par les URL de vos dépôts GitHub
- `YOUR_ID` (Formspree) par votre ID de formulaire Formspree

### 5. Ouvrir le portfolio

Double-cliquez sur `index.html` ou utilisez un serveur local :

```bash
# Avec Python
python -m http.server 8000

# Avec Node.js
npx http-server
```

Puis ouvrez : `http://localhost:8000`

## 📝 Personnalisation

### Couleurs

Dans `css/main.css`, modifiez les variables CSS :

```css
:root {
  --primary-blue: #2563eb;
  --secondary-blue: #3b82f6;
  --dark-blue: #1e40af;
  /* ... */
}
```

### Contenu

- **Projets** : Modifiez les sections `.project-row` dans `index.html`
- **Expérience** : Éditez la section `#experience`
- **Compétences** : Ajoutez/supprimez des icônes dans `#skills`
- **Formation** : Mettez à jour `#education`

### Formspree (Formulaire de contact)

1. Créez un compte sur [Formspree.io](https://formspree.io)
2. Créez un nouveau formulaire
3. Copiez l'ID du formulaire
4. Remplacez `YOUR_ID` dans l'attribut `action` du formulaire

## 🌐 Déploiement

### GitHub Pages

1. Créez un dépôt GitHub nommé `YOUR_USERNAME.github.io`
2. Poussez votre code :

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/YOUR_USERNAME.github.io.git
git push -u origin main
```

3. Activez GitHub Pages dans Settings > Pages
4. Votre site sera disponible à : `https://YOUR_USERNAME.github.io`

### Netlify (Recommandé)

1. Connectez-vous à [Netlify](https://netlify.com)
2. Cliquez sur "Add new site" > "Import an existing project"
3. Sélectionnez votre dépôt GitHub
4. Déployez !

Votre site sera disponible à : `https://YOUR_SITE_NAME.netlify.app`

### Vercel

```bash
npm i -g vercel
vercel
```

## 📧 Contact

Pour toute question sur le portfolio :

- **Email** : wendyam-ariel.tiemtore@univ-lyon2.fr
- **LinkedIn** : [Wendyam Ariel TIEMTORE](https://linkedin.com/in/wendyam-ariel-tiemtore)
- **GitHub** : [YOUR_GITHUB](https://github.com/YOUR_GITHUB)

## 📜 Licence

Ce portfolio est libre d'utilisation pour votre usage personnel.

---

**Créé avec ❤️ par Wendyam Ariel TIEMTORE**  
*Data Scientist | M2 MIASHS | Université Lyon 2*
