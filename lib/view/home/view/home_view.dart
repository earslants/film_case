import 'package:case_film_app/view/home/viewmodel/home_view_model.dart';
import 'package:case_film_app/view/home/viewmodel/mixin/home_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:case_film_app/view/home/viewmodel/state/home_state.dart';
// Örnek olarak Shimmer paketi:
import 'package:shimmer/shimmer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: Scaffold(
        body: BlocBuilder<HomeViewModel, HomeState>(
          builder: (context, state) {
            if (state.movies == null) {
              return ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              );
            }

            final movies = state.movies!;
            return ListView.builder(
              itemCount: movies.data.movies.length,
              itemBuilder: (context, index) {
                final movie = movies.data.movies[index];
                return ListTile(
                  leading: Image.network(movie.poster),
                  title: Text(movie.title),
                  subtitle: Text(movie.year),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
