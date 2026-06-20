import 'package:zen_health/screens/result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zen_health/constants/color_constants.dart';
import '../provider/provider_height.dart';
import '../provider/provider_weight.dart';
import '../provider/provider_age.dart';
import '../provider/provider_male_female.dart';
import '../widget/age.dart';
import '../widget/height.dart';
import '../widget/male_female.dart';
import '../widget/weight.dart';



class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>{
  int height=0,weight=0,age=0;
  Color iconText=Colors.green;
  Color buttonBackColor=Colors.lightGreen;

  double bmiCalculate(){

    int height=context.read<ProviderHeight>().height;
    int weight=context.read<ProviderWeight>().weight;

    double hM=height.toDouble()/100; // height in meter
    return weight.toDouble()/(hM*hM);
  }




  @override
  Widget build(BuildContext context) {
    const Color primaryColor = AppColors.lightGreen;
    const Color darkTeal = AppColors.greenAccent;
    const Color textSlate = AppColors.textSlate;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.bgLightGreen, AppColors.bgGreenAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // Header Card
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white.withOpacity(0.6),
                  border: Border.all(
                    color: primaryColor.withOpacity(0.15),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.05),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome to Zen Health",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              color: AppColors.textDarkGreen,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Calculate Your BMI",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: textSlate,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.favorite_rounded,
                        color: primaryColor,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),

              // Gender Selector
              const MaleFemale(
                iconText: darkTeal,
                buttonBackColor: primaryColor,
              ),

              // Measurement controls
              Container(
                width: double.infinity,
                height: 450,
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white.withOpacity(0.3),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.4),
                    width: 1.5,
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Height(min: 0, max: 300),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Weight(min: 0, max: 200),
                        Age(min: 0, max: 100),
                      ],
                    )
                  ],
                ),
              ),

              // Reset and Check BMI Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    // Reset Button
                    Expanded(
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: const LinearGradient(
                            colors: [AppColors.textGrey, AppColors.textSlate],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.textSlate.withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            context.read<ProviderHeight>().changeHeight(180);
                            context.read<ProviderWeight>().changeWeight(65);
                            context.read<ProviderAge>().changeAge(50);
                            context.read<ProviderMaleFemale>().changeMaleFemale("man");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          icon: const Icon(Icons.refresh, color: Colors.white, size: 24),
                          label: const Text(
                            "Reset",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Check BMI Button
                    Expanded(
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: const LinearGradient(
                            colors: [primaryColor, darkTeal],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BMIResult(bmi: bmiCalculate()),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          icon: const Icon(Icons.analytics_outlined, color: Colors.white, size: 24),
                          label: const Text(
                            "Check BMI",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
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
    );
  }
}


