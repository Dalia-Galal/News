import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/config/theme/color_palette.dart';
import 'package:news/models/category_data_model.dart';
import 'package:news/modules/home/articles_cubit/articles_cubit.dart';
import 'package:news/modules/home/sources_cubit/sources_cubit.dart';

//import 'package:news/modules/home/view_model/home_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom_bottom_sheet.dart';
//import 'article_web_view.dart';

class LoadedNewsView extends StatefulWidget {
  final CategoryDataModel categoryDataModel;

  const LoadedNewsView({super.key, required this.categoryDataModel});

  @override
  State<LoadedNewsView> createState() => _LoadedNewsViewState();
}

class _LoadedNewsViewState extends State<LoadedNewsView> {
  // late final HomeViewModel homeViewModel;
  var _selectedIndex = 0;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();

    ///this block to ensure that the provider will be called only when i need to use it
    /// and to ensure context will not be called before it is build in the build method
    //
    // if (mounted) {
    //   homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    // }
    Future.wait([
      context.read<SourcesCubit>().getAllSources(widget.categoryDataModel.id),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocListener<SourcesCubit, SourcesStates>(
          listener: (context, state) {
            if (state is SuccessGetAllSourcesState &&
                context.read<ArticlesCubit>().state is ArticlesInitialState) {
              context.read<ArticlesCubit>().getAllArticles(
                state.sourcesList[_selectedIndex].id,
              );
            }
          },
          child: BlocBuilder<SourcesCubit, SourcesStates>(
            builder: (context, state) {
              switch (state) {
                case SourcesInitialState():
                  return const SizedBox.shrink();
                case LoadGetAllSourcesState():
                  return CircularProgressIndicator();
                case SuccessGetAllSourcesState():
                  return DefaultTabController(
                    length: state.sourcesList.length,
                    child: TabBar(
                      onTap: (index) {
                        setState(() {
                          _selectedIndex = index;
                          context.read<ArticlesCubit>().getAllArticles(
                            state.sourcesList[index].id,
                          );
                        });
                      },
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      dividerColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      indicatorColor: ColorPalette.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 0.5,
                      indicatorPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: -2,
                      ),
                      tabs: List.generate(state.sourcesList.length, (index) {
                        final bool isSelected = _selectedIndex == index;
                        return Text(
                          state.sourcesList[index].name,
                          style: TextStyle(
                            fontSize: isSelected ? 16 : 14,
                            fontWeight: isSelected
                                ? FontWeight.w700
                                : FontWeight.w500,
                            color: ColorPalette.black,
                          ),
                        );
                      }),
                    ),
                  );
                case ErrorGetAllSourcesState():
                  return Center(
                    child: Text(state.message, textAlign: TextAlign.center),
                  );
              }
            },
          ),
        ),
        BlocBuilder<ArticlesCubit, ArticlesStates>(
          builder: (context, state) {
            switch (state) {
              case ArticlesInitialState():
                return SizedBox.shrink();
              case LoadGetAllArticlesState():
                return CircularProgressIndicator();
              case SuccessGetAllArticlesState():
                return Expanded(
                  child: ListView.builder(
                    controller: ScrollController(),
                    itemCount: state.articlesList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 10,
                        ),
                        width: 360,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: ColorPalette.black),
                        ),
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              elevation: 2,
                              builder: (context) {
                                return CustomBottomSheet(
                                  description:
                                      state.articlesList[index].description!,
                                  url: state.articlesList[index].url,
                                  urlToImage:
                                      state.articlesList[index].urlToImage ??
                                      "",
                                  onPressed: () async {
                                    try {
                                      Uri siteLink = Uri.parse(
                                        state.articlesList[index].url,
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
                                );
                              },
                            );
                          },
                          child: Column(
                            spacing: 10,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(16),
                                child: Image.network(
                                  state.articlesList[index].urlToImage!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                state.articlesList[index].title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: ColorPalette.black,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state.articlesList[index].author ??
                                        'Unknown Author',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFA0A0A0),
                                    ),
                                  ),
                                  Text(
                                    ' 15 minutes ago',
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
              case ErrorGetAllArticlesState():
                return Text(state.message, textAlign: TextAlign.center);
            }
          },
        ),
      ],
    );
  }
}
