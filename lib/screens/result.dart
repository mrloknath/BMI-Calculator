import 'package:zen_health/constants/image_constants.dart';
import 'package:zen_health/provider/provider_age.dart';
import 'package:zen_health/provider/provider_height.dart';
import 'package:flutter/material.dart';
import 'package:zen_health/constants/color_constants.dart';
import 'package:provider/provider.dart';
import '../provider/provider_male_female.dart';
import '../provider/provider_weight.dart';
import '../widget/floating_button_fab.dart';

class BmiInfo {
  final String category;
  final String label;
  final Color color;
  final String description;

  const BmiInfo({
    required this.category,
    required this.label,
    required this.color,
    required this.description,
  });
}

BmiInfo getBmiInfo(double bmi) {
  if (bmi < 18.5) {
    return const BmiInfo(
      category: 'underweight',
      label: 'Underweight',
      color: Color(0xFF3B82F6), // Modern slate blue
      description: 'You have a lower body weight. Try to eat a balanced, nutrient-rich diet.',
    );
  } else if (bmi < 24.9) {
    return const BmiInfo(
      category: 'normal',
      label: 'Normal Weight',
      color: Color(0xFF10B981), // Modern emerald green
      description: 'Great! You have a healthy body weight. Maintain your active lifestyle.',
    );
  } else if (bmi < 29.9) {
    return const BmiInfo(
      category: 'overweight',
      label: 'Overweight',
      color: Color(0xFFF59E0B), // Modern amber yellow
      description: 'You are slightly above healthy range. Consider regular exercise and diet tracking.',
    );
  } else {
    return const BmiInfo(
      category: 'obesity',
      label: 'Obese',
      color: Color(0xFFEF4444), // Modern red/coral
      description: 'Your BMI indicates obesity. We recommend consulting a health specialist.',
    );
  }
}

class BMIResult extends StatelessWidget {
  const BMIResult({super.key, required this.bmi});
  final double bmi;

  @override
  Widget build(BuildContext context) {
    final info = getBmiInfo(bmi);
    final gender = context.read<ProviderMaleFemale>().maleFemale;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Result",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
            fontSize: 22,
          ),
        ),
        leading: const BackButton(color: Color(0xFF1F2937)),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              info.color.withOpacity(0.08),
              info.color.withOpacity(0.18),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Circular Gauge Display
              Flexible(
                flex: 4,
                child: Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: info.color.withOpacity(0.25),
                          blurRadius: 25,
                          offset: const Offset(0, 10),
                        ),
                      ],
                      border: Border.all(
                        color: info.color.withOpacity(0.2),
                        width: 8,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "YOUR BMI",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            bmi.toStringAsFixed(1),
                            style: TextStyle(
                              fontSize: 52,
                              fontWeight: FontWeight.w900,
                              color: info.color,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            info.label.toUpperCase(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1,
                              color: info.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Visual character illustration
              Flexible(
                flex: 4,
                child: Consumer<ProviderMaleFemale>(
                  builder: (context, value, child) {
                    return Image.network(
                      "${ImageConstants.imageBaseURL}assets/$gender/${gender}_${info.category}.png",
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.lightGreen,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.accessibility_new_rounded,
                          size: 100,
                          color: info.color,
                        );
                      },
                    );
                  },
                ),
              ),

              // Detailed metrics card
              Flexible(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.white.withOpacity(0.8), width: 1.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: _buildStatItem(
                              icon: Icons.height_rounded,
                              label: "Height",
                              value: "${context.read<ProviderHeight>().height} cm",
                              color: AppColors.lightGreen,
                            ),
                          ),
                          Expanded(
                            child: _buildStatItem(
                              icon: Icons.monitor_weight_outlined,
                              label: "Weight",
                              value: "${context.read<ProviderWeight>().weight} kg",
                              color: AppColors.lightGreen,
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Divider(height: 1, color: Color(0xFFE5E7EB)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: _buildStatItem(
                              icon: Icons.calendar_today_rounded,
                              label: "Age",
                              value: "${context.read<ProviderAge>().age} yr",
                              color: AppColors.lightGreen,
                            ),
                          ),
                          Expanded(
                            child: _buildStatItem(
                              icon: Icons.person_outline_rounded,
                              label: "Gender",
                              value: gender == "man" ? "Male" : "Female",
                              color: AppColors.lightGreen,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: info.color.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.info_outline_rounded, color: info.color, size: 18),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                info.description,
                                style: TextStyle(
                                  color: info.color.withOpacity(0.9),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingButtonFab(
        color: info.color,
        bmi: bmi,
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.08),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 18),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF1F2937),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}