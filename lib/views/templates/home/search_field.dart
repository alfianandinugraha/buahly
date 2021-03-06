import 'dart:async';

import 'package:buahly/core/store/list_fruit/bloc.dart';
import 'package:buahly/core/store/list_fruit/event.dart';
import 'package:buahly/themes/colors/primary_colors.dart';
import 'package:buahly/themes/icons/asset_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  FocusNode focusNode = FocusNode();
  bool isFocus = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    focusNode.addListener(() {
      setState(() {
        isFocus = focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(focusNode);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
              border: Border.all(
                color: isFocus ? PrimaryColors.pallete[500]! : const Color(0xFFE3E3E3)
              )
            ),
            child: TextField(
              focusNode: focusNode,
              onChanged: (keyword) {
                var bloc = BlocProvider.of<ListFruitBloc>(context);
                bloc.add(SearchListFruit(isSearch: true));
                if (timer != null) {
                  timer?.cancel();
                  timer = null;
                }

                timer = Timer(const Duration(milliseconds: 500), () {
                  bloc.add(SearchListFruit(isSearch: false));
                  bloc.add(FilterListFruit(keyword: keyword));
                });
              },
              decoration: const InputDecoration.collapsed(
                hintText: "Search Fruit",
                hintStyle: TextStyle(
                  color: Color(0xFFE3E3E3),
                  fontSize: 14,
                ),
              ),
              cursorWidth: 1.5,
              style: TextStyle(
                fontSize: 14,
                height: 1.2,
                decoration: TextDecoration.none,
                color: Theme.of(context).textTheme.bodyText2?.color,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Icon(
                AssetIcon.search,
                size: 16,
                color: PrimaryColors.pallete[500]!,
              )
            )
          ),
        ],
      ),
    );
  }
}
