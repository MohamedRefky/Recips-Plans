import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/Colors.dart';
import '../manager/plans_cubit.dart';
import 'PlaneDetails.dart';

class Plane extends StatelessWidget {
  const Plane({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlansCubit()..getPlans(),
      child: BlocConsumer<PlansCubit, PlansState>(
        listener: (context, state) {},
        builder: (context, state) {
          PlansCubit cubit = PlansCubit.get(context);
          return Scaffold(
            backgroundColor: const Color.fromRGBO(3, 11, 24, 1.0),
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(39, 47, 60, 1.0),
              title: const Text(
                "Plans",
                style: TextStyle(color: Colors.white),
              ),
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
              actions: [
                OutlinedButton(
                    style: const ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            side: BorderSide(color: Colors.blue, width: 2, strokeAlign: 2)))),
                    onPressed: () {},
                    child: const Text(
                      "Go Premium",
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Filter By:",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        FilterChip(
                          showCheckmark: false,
                          backgroundColor: const Color.fromRGBO(3, 11, 24, 1.0),
                          padding: const EdgeInsets.all(8),
                          selectedColor: Colors.blue,
                          selectedShadowColor: AppColors.primaryColor,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: cubit.isSelect == true ? AppColors.primaryColor : Colors.grey),
                              borderRadius: const BorderRadius.all(Radius.circular(60))),
                          disabledColor: Colors.transparent,
                          label: Text(
                            "Free",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: cubit.isSelect == true ? Colors.black : Colors.grey),
                          ),
                          selected: cubit.isSelect,
                          onSelected: (selected) {
                            cubit.isSelect = selected;
                          },
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        FilterChip(
                          showCheckmark: false,
                          backgroundColor: const Color.fromRGBO(3, 11, 24, 1.0),
                          padding: const EdgeInsets.all(8),
                          selectedColor: Colors.blue,
                          selectedShadowColor: AppColors.primaryColor,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: cubit.isSelect == true ? AppColors.primaryColor : Colors.grey),
                              borderRadius: const BorderRadius.all(Radius.circular(60))),
                          disabledColor: Colors.transparent,
                          label: Text(
                            "Meal Plan",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: cubit.isSelect == true ? Colors.black : Colors.grey),
                          ),
                          selected: cubit.isSelect,
                          onSelected: (selected) {
                            cubit.isSelect = selected;
                          },
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        FilterChip(
                          showCheckmark: false,
                          backgroundColor: const Color.fromRGBO(3, 11, 24, 1.0),
                          padding: const EdgeInsets.all(8),
                          selectedColor: Colors.blue,
                          selectedShadowColor: AppColors.primaryColor,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: cubit.isSelect == true ? AppColors.primaryColor : Colors.grey),
                              borderRadius: const BorderRadius.all(Radius.circular(60))),
                          disabledColor: Colors.transparent,
                          label: Text(
                            "Nutrition",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: cubit.isSelect == true ? Colors.black : Colors.grey),
                          ),
                          selected: cubit.isSelect,
                          onSelected: (selected) {
                            cubit.isSelect = selected;
                          },
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        FilterChip(
                          showCheckmark: false,
                          backgroundColor: const Color.fromRGBO(3, 11, 24, 1.0),
                          padding: const EdgeInsets.all(8),
                          selectedColor: Colors.blue,
                          selectedShadowColor: AppColors.primaryColor,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: cubit.isSelect == true ? AppColors.primaryColor : Colors.grey),
                              borderRadius: const BorderRadius.all(Radius.circular(60))),
                          disabledColor: Colors.transparent,
                          label: Text(
                            "Walking",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: cubit.isSelect == true ? Colors.black : Colors.grey),
                          ),
                          selected: cubit.isSelect,
                          onSelected: (selected) {
                            cubit.isSelect = selected;
                          },
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Divider(),
                  ),
                  const Text(
                    "Available Plans",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: state is GetPlansLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.separated(
                            separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PlaneDetails(
                                      name: cubit.plans[index].name ?? '',
                                      image: cubit.plans[index].image ?? '',
                                      details: cubit.plans[index].details ?? '',
                                      schedule: cubit.plans[index].schedule ?? [],
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                color: const Color.fromRGBO(27, 30, 41, 1.0),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      cubit.plans[index].image ?? '',
                                      height: 150,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      errorBuilder: (context, error, stackTrace) => const Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cubit.plans[index].name ?? '',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "${cubit.plans[index].days ?? 0} days . Daily",
                                            style:
                                                TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            itemCount: cubit.plans.length,
                          ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
