import '../entities/entity_model.dart';

class ModelUser extends EntityModel {
  const ModelUser({
    this.email = '',
    this.name = '',
    this.photoUrl = '',
    this.accessToken,
    this.isActiveSession = false,
  });

  factory ModelUser.fromJson(Map<String, String> json) {
    return ModelUser(
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      photoUrl: json['photoUrl'] ?? '',
      accessToken: json['accessToken'],
    );
  }

  final String email;
  final String name;
  final String photoUrl;
  final String? accessToken;
  final bool isActiveSession;

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'photourl': photoUrl,
      'accessToken': accessToken,
    };
  }

  @override
  ModelUser copyWith({
    String? email,
    String? name,
    String? photoUrl,
    String? accessToken,
    bool? isActiveSession,
  }) {
    return ModelUser(
      email: email ?? this.email,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      accessToken: accessToken ?? this.accessToken,
      isActiveSession: isActiveSession ?? this.isActiveSession,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ModelUser &&
        other.runtimeType == runtimeType &&
        other.hashCode == hashCode;
  }

  @override
  int get hashCode =>
      '$email$name$photoUrl$accessToken$isActiveSession'.hashCode;
}
