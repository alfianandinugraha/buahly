import 'package:buahly/core/store/detail_fruit/bloc.dart';
import 'package:buahly/core/store/detail_fruit/state.dart';
import 'package:buahly/views/widgets/property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FruitInfo extends StatelessWidget {
  const FruitInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailFruitBloc, DetailFruitState>(
      builder: (_, state) {
        if (state is DetailFruitLoaded) {
          final fruit = state.fruit;
          return Column(
            children: [
              Row(
                children: [
                  Property(
                    label: "id",
                    child: Text(fruit.id.toString())
                  ),
                  Property(
                    label: "genus",
                    child: Text(fruit.genus)
                  )
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  Property(
                    label: "family",
                    child: Text(fruit.family)
                  ),
                  Property(
                    label: "order",
                    child: Text(fruit.order)
                  )
                ],
              )
            ],
          );
        }
        return Container();
      }
    );
  }
}
