class TeamModel {
  final String strTeam;
  final String strStadium;
  final String strBadge;
  bool isFavorite;

  TeamModel({
    required this.strTeam,
    required this.strStadium,
    required this.strBadge,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'strTeam': strTeam,
      'strStadium': strStadium,
      'strBadge': strBadge,
      'isFavorite': isFavorite ? 1 : 0,
    };
  }

  factory TeamModel.fromMap(Map<String, dynamic> map) {
    return TeamModel(
      strTeam: map['strTeam'] ?? '',
      strStadium: map['strStadium']?? '',
      strBadge: map['strBadge'] ?? '',
      isFavorite: map['isFavorite'] == 1,
    );
  }

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      strTeam: json['strTeam'] ?? '',
      strStadium: json['strStadium'] ?? '',
      strBadge: json['strBadge'] ?? '',
      isFavorite: false,
    );
  }
}





// class ModelMakeup {
//   final String name;
//   final double rating;
//   final String price;
//   final String image_link;
//
//   ModelMakeup({
//     required this.name,
//     required this.rating,
//     required this.price,
//     required this.image_link,
//   });
//
//   factory ModelMakeup.fromJson(Map<String, dynamic> json) {
//     return ModelMakeup(
//         name: json['name'] ?? '',
//         rating: json['rating'] ?? 0,
//         price: json['price'] ?? '0',
//         image_link: json['image_link'] ?? '');
//   }
// }
