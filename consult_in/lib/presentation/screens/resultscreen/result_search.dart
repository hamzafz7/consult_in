import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:consult_in/logic/bloc/appcubit.dart';
import 'package:consult_in/logic/bloc/appstates.dart';
import 'package:consult_in/presentation/widgets/ExpertsItemBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResaultScreen extends StatelessWidget {
  const ResaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConsultAppCubit, ConsultAppStates>(
      builder: ((context, state) => Scaffold(
            appBar: AppBar(),
            body: ConditionalBuilder(
                condition: state is SearchExpertsSuccessState,
                fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                builder: (context) => BlocProvider.of<ConsultAppCubit>(context)
                        .searchModel!
                        .users
                        .isNotEmpty
                    ? ListView.builder(
                        itemBuilder: ((context, index) => ExpertItemBuilder(
                            model: BlocProvider.of<ConsultAppCubit>(context)
                                .searchModel!
                                .users[index])),
                        itemCount: BlocProvider.of<ConsultAppCubit>(context)
                            .searchModel!
                            .users
                            .length,
                      )
                    : const Center(
                        child: Text("No Resualts Found"),
                      )),
          )),
      listener: ((context, state) => {}),
    );
  }
}
