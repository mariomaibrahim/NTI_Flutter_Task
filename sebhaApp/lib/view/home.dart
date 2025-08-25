import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/home_cubit.dart';
import '../core/home_state.dart';
class TasbihCounter extends StatelessWidget {
  const TasbihCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = context.read<HomeCubit>();

          return Scaffold(
              body: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/backgroundApp.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                      child: Container(
                          width: 300,
                          height: 400,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2D4A6B).withOpacity(0.85),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: const Color(0xFF7BC4D4),
                              width: 8,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            // شاشة العرض
                            Container(
                            width: 200,
                            height: 60,
                            margin: const EdgeInsets.only(top: 30),
                            decoration: BoxDecoration(
                              color: const Color(0xFF8FBC8F),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                state.count.toString().padLeft(3, '0'),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2D4A6B),
                                ),
                              ),
                            ),
                          ),

                          // الأزرار
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: cubit.reset,
                                child: buildButton(Icons.refresh),
                              ),
                              GestureDetector(
                                onTap: cubit.stepBack,
                                child: buildButton(Icons.undo),
                              ),
                            ],
                          ),

                          // زر التسبيح
                          GestureDetector(
                              onTap: cubit.increment,
                              child: Container(
                                  width: 120,
                                  height: 120,
                                  margin: const EdgeInsets.only(bottom: 30),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF7BC4D4),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 15,
                                        offset: const Offset(0, 8),
                                      ),
                                    ],
                                  ),
                                  child: const Center(
                                      child: Text(
                                        'سبح',style: TextStyle(
                                        fontFamily: 'Cairo',color: Color(0xFF2D4A6B),
                                        fontSize: 18,fontWeight: FontWeight.w700,
                                        fontVariations: [
                                          FontVariation('ital', 0),
                                          FontVariation('slnt', 0),
                                        ],
                                      ),
                                      ),
                                  ),
                              ),
                          ),
                            ],
                          ),
                      ),
                  ),
              ),

            // شريط تحت
            bottomNavigationBar: Container(
              height: 60,
              color: Colors.black,
              child: Center(
                child: Text(
                  'إجمالي التسبيح : ${state.totalCount}',
                  style: const TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          );
        },
    );
  }

  Widget buildButton(IconData icon) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFF7BC4D4),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(
        icon,
        color: const Color(0xFF2D4A6B),
        size: 28,
      ),
    );
  }
}