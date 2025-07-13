import 'package:case_film_app/view/explore/service/explore_service.dart';
import 'package:flutter/material.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  @override
  Widget build(BuildContext context) {
    ExploreService exploreService = ExploreService(context: context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            // LocaleManager.instance.removeValue(PreferencesKeys.TOKEN);
            // Navigator.of(context).pushAndRemoveUntil(
            //     MaterialPageRoute(builder: (_) => const AuthGate()),
            //     (route) => false);

            final response = await exploreService.fetchAllMovies();

            if (response != null) {
              for (var movie in response.data.movies) {
                print("RESPONSE: ${movie.imdbId}");
              }
            }
          },
          icon: Icon(
            Icons.logout,
          ),
        ),
      ),
    );
  }
}
