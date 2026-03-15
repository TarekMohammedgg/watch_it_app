class ProfileModel {
  final int id;
  final String facebookUrl;
  final String whatsappUrl;
  final String youtubeUrl;
  final String? aboutDeveloper;
  final String? privacyPolicy;

  const ProfileModel({
    required this.id,
    required this.facebookUrl,
    required this.whatsappUrl,
    required this.youtubeUrl,
    this.aboutDeveloper,
    this.privacyPolicy,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] as int,
      facebookUrl: json['facebook_url'] as String,
      whatsappUrl: json['whatsapp_url'] as String,
      youtubeUrl: json['youtube_url'] as String,
      aboutDeveloper: json['about_developer'] as String?,
      privacyPolicy: json['privacy_policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'facebook_url': facebookUrl,
      'whatsapp_url': whatsappUrl,
      'youtube_url': youtubeUrl,
      'about_developer': aboutDeveloper,
      'privacy_policy': privacyPolicy,
    };
  }
}
