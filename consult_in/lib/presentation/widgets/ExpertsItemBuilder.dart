import 'package:consult_in/components/constants.dart';
import 'package:consult_in/components/theme.dart';
import 'package:consult_in/logic/bloc/appcubit.dart';
import 'package:consult_in/logic/bloc/appstates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class ExpertItemBuilder extends StatelessWidget {
  const ExpertItemBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return BlocConsumer<ConsultAppCubit, ConsultAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            width: w,
            height: h * 0.2,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(blurRadius: 2, spreadRadius: 2, color: Colors.grey)
                ],
                border: Border.all(color: mycolor),
                color: mysecondcolor,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                  child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      child: Image.asset(
                        "assets/images/doctor.jpg",
                        width: w * 0.19,
                        height: h * 0.09,
                        fit: BoxFit.cover,
                      )),
                  getwidthspace(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ahmed Jamil",
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: HexColor("#00575D")),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: mystarcolor,
                          ),
                          getwidthspace(10),
                          Text(
                            "4.6",
                            style: TextStyle(color: Colors.grey[400]),
                          )
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: mycolor),
                          borderRadius: BorderRadius.circular(30)),
                      child: CircleAvatar(
                        backgroundColor:
                            BlocProvider.of<ConsultAppCubit>(context)
                                    .isfavourite
                                ? mycolor
                                : mysecondcolor,
                        child: IconButton(
                          icon: Icon(Icons.favorite,
                              color: BlocProvider.of<ConsultAppCubit>(context)
                                      .isfavourite
                                  ? mysecondcolor
                                  : mycolor),
                          onPressed: (() {
                            BlocProvider.of<ConsultAppCubit>(context)
                                .changefavourie();
                          }),
                        ),
                      ))
                ],
              )),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    getwidthspace(10),
                    Text(
                      "cost per hour :",
                      style: TextStyle(color: mycolor),
                    ),
                    Text(
                      "192",
                      style: TextStyle(color: Colors.grey[400]),
                    )
                  ],
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}
