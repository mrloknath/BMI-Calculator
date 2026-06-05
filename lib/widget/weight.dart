import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider_weight.dart';
import 'package:zen_health/constants/color_constants.dart';

class Weight extends StatelessWidget {
  const Weight({super.key, required this.min, required this.max});
  final int min, max;

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = AppColors.lightGreen;
    const Color textSlate = Color(0xFF1F2937);
    const Color textGrey = Color(0xFF6B7280);

    final weightVal = context.watch<ProviderWeight>().weight;

    return Container(
      height: 205,
      width: 175,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white.withOpacity(0.85),
        border: Border.all(
          color: Colors.white.withOpacity(0.8),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text(
            "WEIGHT",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              letterSpacing: 1.5,
              color: textGrey,
            ),
          ),
          
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$weightVal",
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: textSlate,
                  ),
                ),
                const TextSpan(
                  text: " kg",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),

          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: primaryColor,
              inactiveTrackColor: primaryColor.withOpacity(0.12),
              thumbColor: Colors.white,
              overlayColor: primaryColor.withOpacity(0.12),
              trackHeight: 6,
              thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 10,
                elevation: 4,
              ),
              overlayShape: const RoundSliderOverlayShape(
                overlayRadius: 20,
              ),
            ),
            child: Slider(
              value: weightVal.toDouble(),
              min: min.toDouble(),
              max: max.toDouble(),
              onChanged: (newValue) =>
                  context.read<ProviderWeight>().changeWeight(newValue.toInt()),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildRoundButton(
                icon: Icons.remove,
                onPressed: () => context.read<ProviderWeight>().decrementWeight(),
                primaryColor: primaryColor,
              ),
              _buildRoundButton(
                icon: Icons.add,
                onPressed: () => context.read<ProviderWeight>().incrementWeight(),
                primaryColor: primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoundButton({
    required IconData icon,
    required VoidCallback onPressed,
    required Color primaryColor,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: primaryColor,
          size: 20,
        ),
      ),
    );
  }
}
