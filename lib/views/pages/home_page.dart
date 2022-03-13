import 'package:buahly/core/store/list_fruit/bloc.dart';
import 'package:buahly/core/store/list_fruit/event.dart';
import 'package:buahly/core/store/list_fruit/state.dart';
import 'package:buahly/views/layouts/base_layout.dart';
import 'package:buahly/views/templates/home/fruit_item.dart';
import 'package:buahly/views/templates/home/home_heading.dart';
import 'package:buahly/views/templates/home/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: CustomScrollView(
        scrollBehavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: const [
                SizedBox(height: 46),
                HomeHeading(),
                SizedBox(height: 16),
              ],
            ),
          ),
          BlocBuilder<ListFruitBloc, FruitState>(
            builder: (_, FruitState state) {
              if (state is ListFruitFetched) {
                return SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 14,
                      ),
                      Text("Getting all fruits...")
                    ],
                  ),
                );
              }

              if (state is ListFruitLoaded) {
                return SliverToBoxAdapter(
                  child: Column(
                    children: const [
                      SearchField(),
                      SizedBox(height: 16),
                    ],
                  ),
                );
              }

              if (state is ListFruitError) {
                return SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const Text("Failed to get all fruit"),
                      const SizedBox(height: 6),
                      ElevatedButton.icon(
                        onPressed: () {
                          BlocProvider.of<ListFruitBloc>(context).add(FetchListFruit());
                        },
                        label: const Text("Refresh"),
                        icon: const Icon(
                          Icons.refresh_outlined,
                          size: 14,
                        ),
                      )
                    ],
                  ),
                );
              }

              return const SliverToBoxAdapter();
            },
          ),
          BlocBuilder<ListFruitBloc, FruitState>(
            builder: (BuildContext context, FruitState state) {
              if (state is ListFruitEmpty) {
                BlocProvider.of<ListFruitBloc>(context).add(FetchListFruit());
                return const SliverToBoxAdapter();
              }

              if (state is ListFruitLoaded && state.isSearch) {
                return SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 14,
                      ),
                      Text("Searching fruits...")
                    ],
                  ),
                );
              }

              if (state is ListFruitLoaded && !state.isSearch) {
                if (state.fruits.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Text("Fruit not found"),
                  );
                }

                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Column(
                        children: [
                          FruitItem(fruit: state.fruits[index]),
                          const SizedBox(height: 14)
                        ],
                      );
                    },
                    childCount: state.fruits.length
                  )
                );
              }

              return const SliverToBoxAdapter();
            }
          )
        ],
      )
    );
  }
}
