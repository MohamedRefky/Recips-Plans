import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../models/plan_model.dart';

part 'plans_state.dart';

class PlansCubit extends Cubit<PlansState> {
  PlansCubit() : super(PlansInitial());

  static PlansCubit get(context) => BlocProvider.of(context);
  // List<String> image = [
  //   "assets/images/high.jpg",
  //   "assets/images/low.jpg",
  //   "assets/images/eleven.jpg",
  //   "assets/images/six.jpg",
  // ];

  // List<String> name = [
  //   " ",
  //   "Low Carb",
  //   "11,000 steps a day",
  //   "6,000 steps a day",
  // ];
  // List<String> details = [
  //   "",
  //   """what is low-carb foods?
  //     Low carb diet tips
  //     Low carb foods
  //     lean meats, such as sirloin, chicken breast, or pork.
  //     fish.
  //     eggs.
  //     leafy green vegetables.
  //     nuts and seeds, including nut butter.
  //     low carb fruits, such as apples, blueberries, and strawberries.
  //     unsweetened dairy products, including plain whole milk and plain Greek yogurt""",
  //   "Just 30 minutes every day can increase cardiovascular fitness, strengthen bones, reduce excess body fat, and boost muscle power and endurance. It can also reduce your risk of developing conditions such as heart disease, type 2 diabetes, osteoporosis and some cancers.",
  //   "Just 30 minutes every day can increase cardiovascular fitness, strengthen bones, reduce excess body fat, and boost muscle power and endurance. It can also reduce your risk of developing conditions such as heart disease, type 2 diabetes, osteoporosis and some cancers.",
  // ];
  bool isSelect = false;

  List<PlanModel> plans = [];
  void getPlans() async {
    emit(GetPlansLoading());
    await FirebaseFirestore.instance.collection('free').get().then((value) {
      value.docs.forEach((element) {
        plans.add(PlanModel.fromJson(element.data()));
      });
      emit(GetPlansSuccessfully());
    });
  }
}
