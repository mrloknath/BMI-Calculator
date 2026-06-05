import 'package:zen_health/provider/provider_male_female.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zen_health/constants/color_constants.dart';

class MaleFemale extends StatelessWidget {
  const MaleFemale({super.key, required this.iconText, required this.buttonBackColor});
  final Color iconText;
  final Color buttonBackColor;

  @override
  Widget build(BuildContext context) {
    final selectedGender = context.watch<ProviderMaleFemale>().maleFemale;
    final isMale = selectedGender == "man";
    final isFemale = selectedGender == "women";

    const Color primaryColor = AppColors.lightGreen;
    const Color inactiveColor = Color(0xFF6B7280);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white.withOpacity(0.4),
        border: Border.all(color: Colors.white.withOpacity(0.5), width: 1.5),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildGenderCard(
              label: "MALE",
              icon: Icons.male_rounded,
              isSelected: isMale,
              onTap: () => context.read<ProviderMaleFemale>().changeMaleFemale("man"),
              primaryColor: primaryColor,
              inactiveColor: inactiveColor,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildGenderCard(
              label: "FEMALE",
              icon: Icons.female_rounded,
              isSelected: isFemale,
              onTap: () => context.read<ProviderMaleFemale>().changeMaleFemale("women"),
              primaryColor: primaryColor,
              inactiveColor: inactiveColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderCard({
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
    required Color primaryColor,
    required Color inactiveColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: isSelected
              ? const LinearGradient(
                  colors: [AppColors.lightGreen, AppColors.greenAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isSelected ? null : Colors.white.withOpacity(0.85),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.grey.shade300,
            width: 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : inactiveColor,
              size: 24,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : inactiveColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
