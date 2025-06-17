import '/constants/app_export.dart';

class TipDetailScreen extends StatelessWidget {
  const TipDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Récupérer l'ID du conseil passé en argument
    final String tipId = Get.arguments as String;

    return MyAppScaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 20),

            // Titre du conseil
            Text(
              _getTipTitle(tipId),
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
                height: 1.3,
              ),
            ),

            SizedBox(height: 12),

            // Date et catégorie
            Row(
              children: [
                Text(
                  '12 Jan 2024',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.greyColor,
                  ),
                ),
                SizedBox(width: 12),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.lightGreyColor,
                    borderRadius: BorderRadiusStyle.roundedBorder12,
                  ),
                  child: Text(
                    'Médias sociaux',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Contenu du conseil
            Text(
              _getTipContent(tipId),
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.blackColor,
                height: 1.5,
              ),
            ),

            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text(
        'Détaillées Conseil',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.accentColor, // Orange
        ),
      ),
      leading: Container(
        margin: EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.blackColor,
            width: 1,
          ),
        ),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.blackColor,
            size: 18,
          ),
          onPressed: () => Get.back(),
          padding: EdgeInsets.zero,
        ),
      ),
      centerTitle: false,
    );
  }

  String _getTipTitle(String tipId) {
    switch (tipId) {
      case 'fake-news':
        return 'Comment identifier une fake news';
      case 'sources-fiables':
        return 'Les sources fiables d\'information';
      case 'verifier-partager':
        return 'Vérifier avant de partager';
      case 'manipulations-images':
        return 'Reconnaître les manipulations d\'images';
      default:
        return 'Conseil';
    }
  }

  String _getTipContent(String tipId) {
    switch (tipId) {
      case 'fake-news':
        return '''Les images manipulées sont fréquemment utilisées pendant les périodes électorales pour influencer l'opinion publique. Voici comment vérifier leur authenticité :

1. Utilisez la recherche d'image inversée

Les images manipulées sont fréquemment utilisées pendant les périodes électorales pour influencer l'opinion publique. Voici comment vérifier leur authenticité :

- Google Images
- TinEye

2. Consultez les fact-checkers locaux

- Côte d'Ivoire Check
- Autres médias vérifiés

3. Vérifiez la source

- Examinez l'URL du site
- Identifiez l'auteur original

En Côte d'Ivoire, certains médias fiables''';

      case 'sources-fiables':
        return '''Sources officielles recommandées en Côte d'Ivoire :

Médias publics vérifiés :
- RTI (Radiodiffusion Télévision Ivoirienne)
- Fraternité Matin
- AIP (Agence Ivoirienne de Presse)

Institutions gouvernementales :
- Site officiel du Gouvernement
- Commission Électorale Indépendante (CEI)
- Ministère de l'Information et de la Communication

Médias internationaux fiables :
- RFI Afrique
- BBC Afrique
- France 24

Sites de fact-checking reconnus :
- Africa Check
- Les Observateurs France 24
- Vérifications spécialisées locales

Toujours privilégier les sources officielles et croiser les informations provenant de plusieurs médias reconnus.''';

      case 'verifier-partager':
        return '''Étapes essentielles avant de partager une information :

1. Pause et réflexion
- Ne jamais partager immédiatement
- Prendre le temps d'analyser
- Se questionner sur la crédibilité

2. Vérification des sources
- Consulter le site original
- Rechercher l'auteur
- Vérifier la date de publication

3. Recoupement d'informations
- Chercher la même info ailleurs
- Consulter plusieurs sources
- Utiliser des sites de fact-checking

4. Analyse du contenu
- Attention aux titres sensationnels
- Vérifier les images et vidéos
- Examiner le style d'écriture

En cas de doute, mieux vaut s'abstenir de partager.''';

      case 'manipulations-images':
        return '''Techniques pour détecter les images manipulées :

1. Indices visuels à rechercher
- Ombres incohérentes avec l'éclairage
- Contours flous ou anormalement nets
- Proportions étranges des objets/personnes
- Qualité d'image variable dans la même photo

2. Outils de vérification gratuits
- Recherche d'image inversée Google
- TinEye pour traquer l'origine
- FotoForensics pour l'analyse technique

3. Techniques de manipulation courantes
- Photomontage simple
- Images recyclées d'autres événements
- Photos sorties de leur contexte original
- Deepfakes et manipulations avancées

4. Réflexes de vérification
- Toujours vérifier la source de l'image
- Rechercher la date de prise originale
- Consulter plusieurs angles du même événement

La technologie évoluant rapidement, restez vigilant et formez-vous régulièrement.''';

      default:
        return 'Contenu détaillé à venir...';
    }
  }
}
