import 'dart:io';

import 'package:case_film_app/view/profile/viewmodel/mixin/profile_mixin.dart';
import 'package:case_film_app/view/profile/viewmodel/profile_view_model.dart';
import 'package:case_film_app/view/profile/viewmodel/state/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with ProfileViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileViewModel,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: Text(
            "Profil Detayı",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          actions: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Color(0xFFE50914),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: Image(
                        image: AssetImage(
                          'images/offer_icon.png',
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "Sınırlı Teklif",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: BlocBuilder<ProfileViewModel, ProfileState>(
              builder: (context, state) {
                final isLoading =
                    state.profileModel == null || state.favoriteModel == null;
                if (isLoading) {
                  // Shimmer loading
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ShimmerWidget(
                              width: 72,
                              height: 72,
                              borderRadius: BorderRadius.circular(36)),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShimmerWidget(
                                  width: 120,
                                  height: 20,
                                  borderRadius: BorderRadius.circular(8)),
                              const SizedBox(height: 8),
                              ShimmerWidget(
                                  width: 80,
                                  height: 16,
                                  borderRadius: BorderRadius.circular(8)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      ShimmerWidget(
                          width: 160,
                          height: 20,
                          borderRadius: BorderRadius.circular(8)),
                      const SizedBox(height: 16),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 0.7,
                          children: List.generate(
                              4,
                              (index) => ShimmerWidget(
                                  height: 200,
                                  borderRadius: BorderRadius.circular(16))),
                        ),
                      ),
                    ],
                  );
                }

                final profile = state.profileModel;
                final favoriteMovies = state.favoriteModel?.data ?? [];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profil Bilgileri
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 36,
                              backgroundImage:
                                  NetworkImage(profile?.data.photoUrl ?? ""),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  profile?.data.name ?? "-",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "ID: ${profile?.data.id != null && profile!.data.id.length > 6 ? '${profile.data.id.substring(0, 6)}...' : profile?.data.id ?? '-'}",
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () async {
                            final ImagePicker imagePicker = ImagePicker();
                            var image = await imagePicker.pickImage(
                                source: ImageSource.gallery);

                            if (image != null) {
                              profileViewModel.uploadPhoto(File(image.path));
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            decoration: BoxDecoration(
                              color: Color(0xFFE50914),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              "Fotoğraf Ekle",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Text(
                      "Beğendiğim Filmler",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: (favoriteMovies.isEmpty)
                          ? Center(
                              child: Text("Hiç favori film yok.",
                                  style: TextStyle(color: Colors.white54)))
                          : GridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              childAspectRatio: 0.7,
                              children: favoriteMovies
                                  .map((movie) => _ProfileMovieCard(
                                        imageUrl: movie.poster ?? '',
                                        title: movie.title ?? '-',
                                        subtitle: movie.writer ?? '',
                                      ))
                                  .toList(),
                            ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;
  const ShimmerWidget(
      {this.width = double.infinity,
      this.height = 16,
      this.borderRadius = BorderRadius.zero,
      super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade700,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}

class _ProfileMovieCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  const _ProfileMovieCard({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[800],
                  child: const Icon(Icons.broken_image, color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              subtitle,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 13,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
