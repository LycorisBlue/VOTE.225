import '/app/candidates/controllers/candidates_controller.dart';
import '../../../data/models/candidate.dart';
import '/constants/app_export.dart';

class ProgramPointsSection extends StatelessWidget {
  ProgramPointsSection({super.key});

  final  controller = Get.find<CandidatesController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titre de la section
          Text(
            'Points Clés du Programme',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
          ),

          SizedBox(height: 16),

          // Liste des points du programme
          // ...controller.programPoints.map((point) => _buildProgramPoint(point)).toList(),
        ],
      ),
    );
  }

  // Widget _buildProgramPoint(ProgramPoint point) {
  //   return Container(
  //     margin: EdgeInsets.only(bottom: 12),
  //     padding: EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       color: AppColors.lightGreyColor,
  //       borderRadius: BorderRadiusStyle.roundedBorder12,
  //       border: Border.all(
  //         color: AppColors.greyColor.withOpacity(0.2),
  //         width: 1,
  //       ),
  //     ),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         // Numéro du point
  //         Container(
  //           width: 32,
  //           height: 32,
  //           decoration: BoxDecoration(
  //             color: AppColors.primaryColor,
  //             shape: BoxShape.circle,
  //           ),
  //           child: Center(
  //             child: Text(
  //               '${point.number}',
  //               style: TextStyle(
  //                 fontSize: 16.sp,
  //                 fontWeight: FontWeight.bold,
  //                 color: AppColors.whiteColor,
  //               ),
  //             ),
  //           ),
  //         ),

  //         SizedBox(width: 12),

  //         // Titre du point
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 point.title,
  //                 style: TextStyle(
  //                   fontSize: 16.sp,
  //                   fontWeight: FontWeight.w600,
  //                   color: AppColors.blackColor,
  //                   height: 1.4,
  //                 ),
  //               ),

  //               // Description si disponible
  //               if (point.description != null && point.description!.isNotEmpty) ...[
  //                 SizedBox(height: 8),
  //                 Text(
  //                   point.description!,
  //                   style: TextStyle(
  //                     fontSize: 14.sp,
  //                     color: AppColors.greyColor,
  //                     height: 1.4,
  //                   ),
  //                 ),
  //               ],
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
