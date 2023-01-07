import 'dart:convert';

import 'package:consult_in/components/constants.dart';
import 'package:consult_in/components/theme.dart';
import 'package:consult_in/data/models/expertmodel.dart';
import 'package:consult_in/logic/bloc/appcubit.dart';
import 'package:consult_in/logic/bloc/appstates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class ExpertItemBuilder extends StatelessWidget {
  ExpertModel model;
  ExpertItemBuilder({super.key, required this.model});

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
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xff057c82),
                    blurRadius: 3,
                    spreadRadius: 0.5,
                  ),
                ],
                border: Border.all(color: mycolor),
                color: mysecondcolor,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                  child: Row(
                children: [
                  CircleAvatar(
                      radius: 30,
                      backgroundImage: MemoryImage(base64Decode(model.photo!))),
                  getwidthspace(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${model.name}",
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
                  IconButton(
                    icon: BlocProvider.of<ConsultAppCubit>(context).isfavourite
                        ? const Icon(
                            Icons.favorite,
                            size: 37,
                          )
                        : const Icon(
                            Icons.favorite_border,
                            size: 35,
                          ),
                    color: mycolor,
                    onPressed: (() {
                      BlocProvider.of<ConsultAppCubit>(context)
                          .changefavourie();
                    }),
                  )
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
                      "${model.cost}",
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
