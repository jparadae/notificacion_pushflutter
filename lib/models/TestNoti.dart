/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// ignore_for_file: public_member_api_docs

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the TestNoti type in your schema. */
@immutable
class TestNoti extends Model {
  static const classType = const _TestNotiModelType();
  final String id;
  final String? _descripcion;
  final bool? _isComplete;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get descripcion {
    return _descripcion;
  }
  
  bool? get isComplete {
    return _isComplete;
  }
  
  const TestNoti._internal({required this.id, descripcion, isComplete}): _descripcion = descripcion, _isComplete = isComplete;
  
  factory TestNoti({String? id, String? descripcion, bool? isComplete}) {
    return TestNoti._internal(
      id: id == null ? UUID.getUUID() : id,
      descripcion: descripcion,
      isComplete: isComplete);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TestNoti &&
      id == other.id &&
      _descripcion == other._descripcion &&
      _isComplete == other._isComplete;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("TestNoti {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("descripcion=" + "$_descripcion" + ", ");
    buffer.write("isComplete=" + (_isComplete != null ? _isComplete!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  TestNoti copyWith({String? id, String? descripcion, bool? isComplete}) {
    return TestNoti(
      id: id ?? this.id,
      descripcion: descripcion ?? this.descripcion,
      isComplete: isComplete ?? this.isComplete);
  }
  
  TestNoti.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _descripcion = json['descripcion'],
      _isComplete = json['isComplete'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'descripcion': _descripcion, 'isComplete': _isComplete
  };

  static final QueryField ID = QueryField(fieldName: "testNoti.id");
  static final QueryField DESCRIPCION = QueryField(fieldName: "descripcion");
  static final QueryField ISCOMPLETE = QueryField(fieldName: "isComplete");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "TestNoti";
    modelSchemaDefinition.pluralName = "TestNotis";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TestNoti.DESCRIPCION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: TestNoti.ISCOMPLETE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
  });
}

class _TestNotiModelType extends ModelType<TestNoti> {
  const _TestNotiModelType();
  
  @override
  TestNoti fromJson(Map<String, dynamic> jsonData) {
    return TestNoti.fromJson(jsonData);
  }
}