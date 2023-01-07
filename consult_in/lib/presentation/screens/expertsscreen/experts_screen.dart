import 'dart:math';

import 'package:consult_in/components/theme.dart';
import 'package:consult_in/logic/bloc/appcubit.dart';
import 'package:consult_in/logic/bloc/appstates.dart';
import 'package:consult_in/presentation/widgets/ExpertsItemBuilder.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpertsScreen extends StatelessWidget {
  String exp_type;
  ExpertsScreen({super.key, required this.exp_type});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConsultAppCubit, ConsultAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              backgroundColor: mysecondcolor,
              appBar: AppBar(
                title: Text("$exp_type Consultants",
                    style: Theme.of(context).textTheme.headline4),
                backgroundColor: mysecondcolor,
                elevation: 0.0,
              ),
              body: ConditionalBuilder(
                condition: state is GetExpertsSuccessState,
                fallback: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
                builder: ((context) => ListView.builder(
                      itemBuilder: ((context, index) => ExpertItemBuilder(
                          model: BlocProvider.of<ConsultAppCubit>(context)
                              .exp_experts[index])),
                      itemCount: BlocProvider.of<ConsultAppCubit>(context)
                          .exp_experts
                          .length,
                    )),
              ));
        });
  }
}
