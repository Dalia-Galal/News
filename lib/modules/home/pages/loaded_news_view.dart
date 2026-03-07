import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/config/theme/color_palette.dart';
import 'package:news/models/category_data_model.dart';
import 'package:news/modules/home/articles_cubit/articles_cubit.dart';
import 'package:news/modules/home/pages/articles_view.dart';
import 'package:news/modules/home/sources_cubit/sources_cubit.dart';

import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom_bottom_sheet.dart';

class LoadedNewsView extends StatefulWidget {
  final CategoryDataModel categoryDataModel;

  const LoadedNewsView({super.key, required this.categoryDataModel});

  @override
  State<LoadedNewsView> createState() => _LoadedNewsViewState();
}

class _LoadedNewsViewState extends State<LoadedNewsView> {
  // late final HomeViewModel homeViewModel;
  var _selectedIndex = 0;

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
                  return Center(child: CircularProgressIndicator());
                case SuccessGetAllSourcesState():
                  return DefaultTabController(
                    length: state.sourcesList.length,
                    child: Expanded(
                      child: Column(
                        children: [
                          TabBar(
                            onTap: (index) {
                              setState(() {
                                _selectedIndex = index;
                              });
                              final articlesCubit = context
                                  .read<ArticlesCubit>();
                              articlesCubit.reset();

                              // articlesCubit.getAllArticles(
                              //   state.sourcesList[index].id,
                              // );
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
                            tabs: List.generate(state.sourcesList.length, (
                              index,
                            ) {
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
                          ArticlesView(
                            sourceId: state.sourcesList[_selectedIndex].id,
                          ),
                        ],
                      ),
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
      ],
    );
  }
}
