// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupportAgent _$SupportAgentFromJson(Map<String, dynamic> json) =>
    _SupportAgent(
      name: json['name'] as String,
      avatarUrl: json['avatar_url'] as String,
      isOnline: json['is_online'] as bool? ?? true,
    );

Map<String, dynamic> _$SupportAgentToJson(_SupportAgent instance) =>
    <String, dynamic>{
      'name': instance.name,
      'avatar_url': instance.avatarUrl,
      'is_online': instance.isOnline,
    };

_ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => _ChatMessage(
  id: json['id'] as String,
  author: $enumDecode(
    _$ChatAuthorEnumMap,
    json['author'],
    unknownValue: ChatAuthor.system,
  ),
  createdAt: DateTime.parse(json['created_at'] as String),
  text: json['text'] as String?,
  imagePath: json['image_path'] as String?,
  authorName: json['author_name'] as String?,
);

Map<String, dynamic> _$ChatMessageToJson(_ChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': _$ChatAuthorEnumMap[instance.author]!,
      'created_at': instance.createdAt.toIso8601String(),
      'text': ?instance.text,
      'image_path': ?instance.imagePath,
      'author_name': ?instance.authorName,
    };

const _$ChatAuthorEnumMap = {
  ChatAuthor.user: 'user',
  ChatAuthor.agent: 'agent',
  ChatAuthor.system: 'system',
};

_ChatThread _$ChatThreadFromJson(Map<String, dynamic> json) => _ChatThread(
  id: json['id'] as String,
  agent: json['agent'] == null
      ? null
      : SupportAgent.fromJson(json['agent'] as Map<String, dynamic>),
  messages:
      (json['messages'] as List<dynamic>?)
          ?.map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ChatThreadToJson(_ChatThread instance) =>
    <String, dynamic>{
      'id': instance.id,
      'agent': ?instance.agent?.toJson(),
      'messages': instance.messages.map((e) => e.toJson()).toList(),
    };
