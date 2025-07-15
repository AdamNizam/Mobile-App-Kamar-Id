class SocialModel {
  final String name;
  final String email;
  final String photoUrl;
  final String provider; // "google" atau "facebook"

  SocialModel({
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.provider,
  });
}
