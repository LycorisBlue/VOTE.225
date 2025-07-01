import '/constants/app_export.dart';

class MentionLegalScreen extends StatelessWidget {
  const MentionLegalScreen({super.key});

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
                'MENTIONS LÉGALES DU SITE WEB ET DE L’APPLICATION MOBILE « 225 VOTES »',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Éditeur de l\'application et du site web',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Nom du projet : 225 VOTES'),
              Text('Éditeur : Plateforme PAOJ-CI'),
              Text('Responsable de la publication : Amani Alexandre Didier'),
              Text('Email : info@225votes.ci'),
              Text('Téléphone : ...............................................'),
              SizedBox(height: 20),
              Text(
                'Hébergeur',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Nom de l’hébergeur : IWS.CI'),
              Text('Adresse : Yamoussoukro, Côte d’Ivoire'),
              Text('E-mail : contact@iws.ci'),
              Text('Téléphone :'),
              SizedBox(height: 20),
              Text(
                'Développement',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Conception et développement : BIWALOGO, l’Agence Qui Casse Les Codes.'),
              Text('Email : CasseurDeCodes@biwalogo.com'),
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
        'MENTIONS LÉGALES',
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
