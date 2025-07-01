import '/constants/app_export.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
                'POLITIQUE DE CONFIDENTIALITÉ DU SITE WEB ET DE L’APPLICATION MOBILE « 225 VOTES »',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                '1. Collecte des données\n\n« 225 VOTES » collecte uniquement les données strictement nécessaires à :\n• L’analyse de l’usage de la plateforme (cookies anonymes, statistiques) ;\n• La géolocalisation des utilisateurs (avec leur accord) pour afficher les bureaux de vote.',
              ),
              SizedBox(height: 16),
              Text(
                '2. Base légale\n\nLa collecte de données repose sur le consentement explicite de l’utilisateur, conformément à la loi ivoirienne n°2013-450 sur la protection des données. Les utilisateurs disposent d’un droit d’accès, de rectification et de suppression de leurs données.',
              ),
              SizedBox(height: 16),
              Text(
                '3. Stockage et durée de conservation\n\nLes données sont stockées de manière sécurisée sur des serveurs fournis par l’hébergeur IWS.CI. Elles sont conservées pour une durée maximale de 12 mois, sauf obligation légale contraire.',
              ),
              SizedBox(height: 16),
              Text(
                '4. Partage des données\n\nAucune donnée personnelle n’est vendue ou partagée avec des tiers, sauf dans le cadre d’une obligation légale ou à des fins strictement techniques (hébergement, maintenance).',
              ),
              SizedBox(height: 16),
              Text(
                '5. Droits de l’utilisateur\n\nConformément à la réglementation en vigueur, chaque utilisateur dispose des droits suivants :\n• Accès, rectification ou suppression de ses données ;\n• Limitation ou opposition au traitement ;\n• Retrait de consentement à tout moment.\n\nPour exercer vos droits, contactez-nous à : info@225votes.ci',
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
        'Politique de Confidentialité',
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
