import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/settings/settings_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/color_palette.dart';
import '../articles_cubit/articles_cubit.dart';
import '../widgets/custom_bottom_sheet.dart';

class ArticlesView extends StatefulWidget {
  final String sourceId;
  const ArticlesView({super.key, required this.sourceId});

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    
    super.initState();

   
    _scrollController.addListener(() {
      final articlesCubit = context.read<ArticlesCubit>();
      final state = articlesCubit.state;

      if (state is ArticlesLoaded &&
          !state.hasReachedEnd &&
          _scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent-200) {
        articlesCubit.getAllArticles(widget.sourceId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLight =
    (context.watch<SettingsCubit>().state.themeMode == ThemeMode.light);
    return Flexible(
      child: BlocBuilder<ArticlesCubit, ArticlesStates>(
        builder: (context, state) {
          switch (state) {
            case ArticlesInitialState():
              return SizedBox.shrink();
            case LoadGetAllArticlesState():
              return Center(child: CircularProgressIndicator());
            case ArticlesLoaded():
              return ListView.builder(
                controller: _scrollController,
                itemCount: state.articlesList.length + (state.hasReachedEnd ? 0 : 1),
                itemBuilder: (context, index) {
                  if (index >= state.articlesList.length){
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  final article=state.articlesList[index];
                  return Container(
                    key: ValueKey(article.url),
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 10,
                    ),
                    width: 360,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color:isLight? ColorPalette.black:ColorPalette.white),
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
                             article.description!,
                              url:article.url,
                              urlToImage:
                             article.urlToImage ??
                                  "",
                              onPressed: () async {
                                try {
                                  Uri siteLink = Uri.parse(
                                    article.url,
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
                             article.urlToImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                           article.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: isLight?ColorPalette.black:ColorPalette.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                               article.author ??
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
              );
            case ErrorGetAllArticlesState():
              return Text(state.message, textAlign: TextAlign.center);
          }
        },
      ),
    );
  }
}
