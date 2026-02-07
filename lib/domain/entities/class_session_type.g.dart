// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_session_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassSessionTypeImpl _$$ClassSessionTypeImplFromJson(
        Map<String, dynamic> json) =>
    _$ClassSessionTypeImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      totalDurationInMinutes: (json['totalDurationInMinutes'] as num).toInt(),
      sections: (json['sections'] as List<dynamic>)
          .map((e) => SessionSection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ClassSessionTypeImplToJson(
        _$ClassSessionTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'totalDurationInMinutes': instance.totalDurationInMinutes,
      'sections': instance.sections,
    };

_$SessionSectionImpl _$$SessionSectionImplFromJson(Map<String, dynamic> json) =>
    _$SessionSectionImpl(
      id: json['id'] as String,
      label: json['label'] as String,
      durationInMinutes: (json['durationInMinutes'] as num).toInt(),
      isBreak: json['isBreak'] as bool? ?? false,
    );

Map<String, dynamic> _$$SessionSectionImplToJson(
        _$SessionSectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'durationInMinutes': instance.durationInMinutes,
      'isBreak': instance.isBreak,
    };
