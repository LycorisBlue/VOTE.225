import '/constants/app_export.dart';

class CGUScreen extends StatelessWidget {
  const CGUScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'CONDITIONS GÉNÉRALES D’UTILISATION (CGU) DU SITE WEB ET DE L’APPLICATION MOBILE « 225 VOTES »',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                '1. Objet\n\nLes présentes Conditions Générales d’Utilisation régissent l\'accès et l\'utilisation de l’application et du site web « 225 VOTES », propriété de la Plateforme PAOJ-CI.',
              ),
              SizedBox(height: 16),
              Text(
                '2. Description des services\n\n« 225 VOTES » fournit des informations citoyennes sur le processus électoral en Côte d’Ivoire, telles que : Fiches des candidats, Calendrier électoral, Analyse et comparaison de projets de société, Cartographie interactive des bureaux de vote, Détection de fausses informations, Assistance vocale en langues locales.',
              ),
              SizedBox(height: 16),
              Text(
                '3. Accès aux services\n\nL’utilisation de l’application est gratuite. Certains contenus peuvent nécessiter une connexion internet.',
              ),
              SizedBox(height: 16),
              Text(
                '4. Obligations des utilisateurs\n\nL’utilisateur s’engage à :\n• Ne pas porter atteinte à la sécurité ou à l’intégrité de la plateforme ;\n• Ne pas publier ou transmettre des contenus illicites ou diffamatoires ;\n• Ne pas détourner les services de « 225 VOTES » à des fins politiques ou commerciales.',
              ),
              SizedBox(height: 16),
              Text(
                '5. Propriété intellectuelle\n\nTous les contenus (textes, images, vidéos, codes) sont protégés par les lois en vigueur sur la propriété intellectuelle. Toute reproduction, totale ou partielle, est interdite sans autorisation écrite.',
              ),
              SizedBox(height: 16),
              Text(
                '6. Responsabilité\n\n« 225 Votes » s’efforce d’assurer l’exactitude des informations publiées, mais ne saurait être tenue responsable des éventuelles erreurs, omissions ou retards de mise à jour.',
              ),
              SizedBox(height: 16),
              Text(
                '7. Modification des CGU\n\n« 225 VOTES » se réserve le droit de modifier les présentes CGU à tout moment. Les utilisateurs seront informés par notification ou mise à jour sur le site.',
              ),
              SizedBox(height: 32),
            ],
          ),
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
        'CGU',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.accentColor,
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
      centerTitle: true,
    );
  }
}
