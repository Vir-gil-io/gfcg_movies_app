import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gfcg_movies_app/presentation/providers/movies/movies_providers.dart';
import 'package:gfcg_movies_app/presentation/widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> with AutomaticKeepAliveClientMixin { //Mantiene el estado de la pantalla aunque se cambie de vista
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Mantiene el estado de la pantalla aunque se cambie de vista
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppBar(),
            titlePadding: EdgeInsets.zero,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  MoviesSlideshow(movies: nowPlayingMovies),
                  
                  SizedBox(height: 5,),
                  
                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'En cines',
                    subTitle: 'A partir de',
                    loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),
                ],
              );
            },
            childCount: 1,
          ),
        )
      ],
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}