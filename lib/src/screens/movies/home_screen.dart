import 'package:cinemapedia/src/providers/providers.dart';
import 'package:cinemapedia/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideShowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    if (slideShowMovies.isEmpty) return const CircularProgressIndicator();

    return FullScreenLoader();

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppbar(),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            MoviesSlideShow(movies: slideShowMovies),
            MovieHorizontalListview(
                movies: nowPlayingMovies,
                title: 'In Cinamas',
                subtitle: 'Monday 20',
                loadNextPage: () =>
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage()),
            MovieHorizontalListview(
                movies: upcomingMovies,
                title: 'Coming soon',
                subtitle: 'In this month',
                loadNextPage: () =>
                    ref.read(upcomingMoviesProvider.notifier).loadNextPage()),
            MovieHorizontalListview(
                movies: popularMovies,
                title: 'Popular',
                // subTitle: '',
                loadNextPage: () =>
                    ref.read(popularMoviesProvider.notifier).loadNextPage()),
            MovieHorizontalListview(
                movies: topRatedMovies,
                title: 'Top Rated',
                subtitle: 'Since ever',
                loadNextPage: () =>
                    ref.read(topRatedMoviesProvider.notifier).loadNextPage()),
            const SizedBox(height: 10),
          ],
        );
      }, childCount: 1)),
    ]);
  }
}
