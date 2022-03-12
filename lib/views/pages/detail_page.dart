import 'package:buahly/core/store/detail_fruit/bloc.dart';
import 'package:buahly/core/store/detail_fruit/event.dart';
import 'package:buahly/core/store/detail_fruit/state.dart';
import 'package:buahly/themes/colors/primary_colors.dart';
import 'package:buahly/themes/icons/asset_icon.dart';
import 'package:buahly/views/layouts/base_layout.dart';
import 'package:buahly/views/templates/detail/fruit_info.dart';
import 'package:buahly/views/templates/detail/nutrition_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPageArguments {
  final int id;

  const DetailPageArguments({required this.id});
}

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  static void go(BuildContext context, DetailPageArguments arguments) {
    Navigator.pushNamed(context, '/detail', arguments: arguments);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailPageArguments;
    final id = args.id;

    return BaseLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 46),
          GestureDetector(
            onTap: () {
              // print(Navigator.of(context).canPop());
              Navigator.of(context).pop();
            },
            child: const Icon(
              AssetIcon.arrowLeft,
              size: 24,
            ),
          ),
          const SizedBox(height: 18),
          
          BlocBuilder<DetailFruitBloc, DetailFruitState>(
            builder: (_, state) {
              if (state is DetailFruitEmpty) {
                BlocProvider
                  .of<DetailFruitBloc>(context)
                  .add(FetchDetailFruit(id: id));
              }

              if (state is DetailFruitFetched) {
                return Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 14,
                      ),
                      Text("Getting fruit...")
                    ],
                  ),
                );
              }

              if (state is DetailFruitLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.fruit.name,
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.headline1?.fontSize,
                        fontWeight: Theme.of(context).textTheme.headline1?.fontWeight,
                        color: PrimaryColors.pallete[500]
                      )
                    ),
                    const SizedBox(height: 20),
                    const FruitInfo(),
                    const SizedBox(height: 20),
                    const NutritionInfo()
                  ],
                );
              }

              return Container();
            }
          ),
        ],
      )
    );
  }
}
