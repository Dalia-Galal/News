import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:intl/intl.dart';
import 'package:news/core/settings/settings_cubit.dart';
import 'package:news/models/article_data.dart';
import 'package:news/modules/home/repository/home_repo_implementaion.dart';
import 'package:news/modules/home/search_cubit/search_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/color_palette.dart';
import '../../../gen/assets.gen.dart';
import '../../../core/network_handler/network_handler.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();
  var homeRepository = HomeRepoImplementation();

  @override
  Widget build(BuildContext context) {
    bool isLight =
        (context.watch<SettingsCubit>().state.themeMode == ThemeMode.light);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                style: TextStyle(
                  color: isLight ? ColorPalette.black : ColorPalette.white,
                ),
                onFieldSubmitted: (value) {
                  context.read<SearchCubit>().searchInArticles(value);
                },
                controller: _controller,
                cursorColor: isLight ? ColorPalette.black : ColorPalette.white,
                onTapUpOutside: (event) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: isLight ? ColorPalette.black : ColorPalette.white,
                  ),

                  prefixIcon: GestureDetector(
                    onTap:search,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Assets.icons.search.svg(
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          isLight ? ColorPalette.black : ColorPalette.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),

                  suffixIcon: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Assets.icons.xIcon.svg(
                        width: 14,
                        height: 14,
                        colorFilter: ColorFilter.mode(
                          isLight ? ColorPalette.iconColor : ColorPalette.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    gapPadding: 16,
                    borderSide: BorderSide(
                      color: isLight ? ColorPalette.black : ColorPalette.white,
                    ),
                  ),
                  contentPadding: EdgeInsetsGeometry.symmetric(vertical: 16),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    gapPadding: 16,
                    borderSide: BorderSide(color: ColorPalette.black),
                  ),
                ),
              ),
            ),

            BlocBuilder<SearchCubit, SearchStates>(
              builder: (context, state) {
                switch (state) {
                  case SearchArticlesInitial():
                    return SizedBox.shrink();
                  case SearchArticlesLoading():
                    return CircularProgressIndicator();
                  case SearchArticlesSuccess():
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.articleList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () async {
                              try {
                                Uri siteLink = Uri.parse(
                                  state.articleList[index].url,
                                );
                                await launchUrl(siteLink);
                              } catch (e) {
                                debugPrint(e.toString());
                              }
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => ArticleWebView(
                              //       url: state.articlesList[index].url,
                              //     ),
                              //   ),
                              // );
                            },
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              margin: EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 10,
                              ),
                              width: 360,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: isLight
                                      ? ColorPalette.black
                                      : ColorPalette.white,
                                ),
                              ),
                              child: Column(
                                spacing: 20,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      16,
                                    ),
                                    child:
                                        (state.articleList[index].urlToImage !=
                                            null)
                                        ? Image.network(
                                            state
                                                .articleList[index]
                                                .urlToImage!,
                                          )
                                        : SizedBox(
                                            height: 100,
                                            width: double.infinity,
                                            child: Text(
                                              'No Image to preview',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                  ),
                                  Text(
                                    state.articleList[index].title,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: isLight
                                          ? ColorPalette.black
                                          : ColorPalette.white,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        state.articleList[index].author ??
                                            'Unknown Author',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFFA0A0A0),
                                        ),
                                      ),
                                      Text(
                                        DateFormat('h:mm a - dd MMM').format(
                                          DateTime.parse(
                                            state
                                                .articleList[index]
                                                .publishedAt,
                                          ),
                                        ),
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFFA0A0A0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  case SearchArticlesError():
                    return Text(state.message, textAlign: TextAlign.center);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void search() {
    final value = _controller.text.trim();
    if (value.isNotEmpty) {
      context.read<SearchCubit>().searchInArticles(value);
    }
  }
}
