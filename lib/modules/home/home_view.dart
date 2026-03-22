import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news/core/config/page_route_names.dart';
import 'package:news/core/settings/settings_cubit.dart';
import 'package:news/core/theme/color_palette.dart';
import 'package:news/models/category_data_model.dart';
import 'package:news/modules/home/articles_cubit/articles_cubit.dart';

import 'package:news/modules/home/pages/loaded_news_view.dart';
import 'package:news/modules/home/pages/search_view.dart';
import 'package:news/modules/home/repository/home_repo_implementaion.dart';
import 'package:news/modules/home/repository/home_repository.dart';
import 'package:news/modules/home/sources_cubit/sources_cubit.dart';

import 'package:news/modules/home/widgets/custom_drawer_widget.dart';
import 'package:news/modules/home/widgets/news_card_widget.dart';
// import 'package:provider/provider.dart';

import '../../gen/assets.gen.dart';
import 'home_cubit/home_cubit.dart';
import 'search_cubit/search_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryDataModel> categories = [
    CategoryDataModel(
      id: 'general',
      title: 'General',
      image: Assets.images.generalDark.path,
      darkImage: Assets.images.general.path,
    ),
    CategoryDataModel(
      id: 'business',
      title: 'Business',
      image: Assets.images.busniessDark.path,
      darkImage: Assets.images.busniess.path,
    ),
    CategoryDataModel(
      id: 'sports',
      title: 'Sports',
      image: Assets.images.sportDark.path,
      darkImage: Assets.images.sport.path,
    ),

    CategoryDataModel(
      id: 'technology',
      title: 'Technology',
      image: Assets.images.technologyDark.path,
      darkImage: Assets.images.technology.path,
    ),
    CategoryDataModel(
      id: 'science',
      title: 'Science',
      image: Assets.images.scienceDark.path,
      darkImage: Assets.images.science.path,
    ),
  ];
  CategoryDataModel? selectedCategory;
  var homeRepository = HomeRepoImplementation();

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SourcesCubit(homeRepository)),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => ArticlesCubit(homeRepository)),
        BlocProvider(create: (context) => SearchCubit(homeRepository)),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor:
              (context.watch<SettingsCubit>().state.themeMode ==
                  ThemeMode.light)
              ? ColorPalette.black
              : ColorPalette.white,
          title: Text(
            selectedCategory?.title ?? 'Home',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color:
                  context.watch<SettingsCubit>().state.themeMode ==
                      ThemeMode.light
                  ? Color(0xFF171717)
                  : ColorPalette.white,
            ),
          ),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => SearchCubit(homeRepository),
                      child: SearchView(),
                    ),
                  ),
                );
              },
              child: Assets.icons.search.svg(
                colorFilter: ColorFilter.mode(
                  (context.watch<SettingsCubit>().state.themeMode ==
                          ThemeMode.light)
                      ? ColorPalette.black
                      : ColorPalette.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
          actionsPadding: EdgeInsets.symmetric(horizontal: 20),
        ),

        drawer: CustomDrawerWidget(),
        body: selectedCategory == null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    spacing: 10,
                    children: [
                      Text(
                        'Good Morning\nHere is Some News For You',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color:
                              (context.watch<SettingsCubit>().state.themeMode ==
                                  ThemeMode.light)
                              ? ColorPalette.black
                              : ColorPalette.white,
                        ),
                      ),
                      ...List.generate(categories.length, (index) {
                        return NewsCardWidget(
                          isLeft: index % 2 == 0,
                          categoryDataModel: categories[index],
                          onTap: _onCategoryTap,
                        );
                      }),
                    ],
                  ),
                ),
              )
            : LoadedNewsView(categoryDataModel: selectedCategory!),
      ),
    );
  }

  void _onCategoryTap(CategoryDataModel categoryDataModel) {
    setState(() {
      selectedCategory = categoryDataModel;
    });
  }
}
