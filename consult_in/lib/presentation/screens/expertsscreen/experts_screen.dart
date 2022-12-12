import 'package:consult_in/components/theme.dart';
import 'package:consult_in/presentation/widgets/ExpertsItemBuilder.dart';
import 'package:flutter/material.dart';

class ExpertsScreen extends StatelessWidget {
  const ExpertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mysecondcolor,
        appBar: AppBar(
          title: Text("Medical Consultants",
              style: Theme.of(context).textTheme.headline4),
          backgroundColor: mysecondcolor,
          elevation: 0.0,
        ),
        body: ListView.builder(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          itemBuilder: ((context, index) => ExpertItemBuilder()),
          itemCount: 6,
        )
        //],
        //),
        // ),
        //   ),
        );
  }
}
