// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class UserDataClass extends DataClass implements Insertable<UserDataClass> {
  final int id;
  final String name;
  final String email;
  final String password;
  final DateTime createdAt;
  UserDataClass(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.createdAt});
  factory UserDataClass.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return UserDataClass(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
      password: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}password'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
      password: Value(password),
      createdAt: Value(createdAt),
    );
  }

  factory UserDataClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return UserDataClass(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  UserDataClass copyWith(
          {int? id,
          String? name,
          String? email,
          String? password,
          DateTime? createdAt}) =>
      UserDataClass(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('UserDataClass(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              email.hashCode, $mrjc(password.hashCode, createdAt.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDataClass &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.password == this.password &&
          other.createdAt == this.createdAt);
}

class UsersCompanion extends UpdateCompanion<UserDataClass> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> email;
  final Value<String> password;
  final Value<DateTime> createdAt;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String email,
    required String password,
    required DateTime createdAt,
  })  : name = Value(name),
        email = Value(email),
        password = Value(password),
        createdAt = Value(createdAt);
  static Insertable<UserDataClass> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? password,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? email,
      Value<String>? password,
      Value<DateTime>? createdAt}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, UserDataClass> {
  final GeneratedDatabase _db;
  final String? _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, false,
      typeName: 'TEXT',
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE');
  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  late final GeneratedColumn<String?> password = GeneratedColumn<String?>(
      'password', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, email, password, createdAt];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<UserDataClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserDataClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    return UserDataClass.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

class BreedersDataClass extends DataClass
    implements Insertable<BreedersDataClass> {
  final int id;
  final String name;
  final double weight;
  final bool gender;
  final int age;
  final String image;
  final int user;
  BreedersDataClass(
      {required this.id,
      required this.name,
      required this.weight,
      required this.gender,
      required this.age,
      required this.image,
      required this.user});
  factory BreedersDataClass.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BreedersDataClass(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      weight: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weight'])!,
      gender: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gender'])!,
      age: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}age'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image'])!,
      user: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['weight'] = Variable<double>(weight);
    map['gender'] = Variable<bool>(gender);
    map['age'] = Variable<int>(age);
    map['image'] = Variable<String>(image);
    map['user'] = Variable<int>(user);
    return map;
  }

  BreedersCompanion toCompanion(bool nullToAbsent) {
    return BreedersCompanion(
      id: Value(id),
      name: Value(name),
      weight: Value(weight),
      gender: Value(gender),
      age: Value(age),
      image: Value(image),
      user: Value(user),
    );
  }

  factory BreedersDataClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BreedersDataClass(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      weight: serializer.fromJson<double>(json['weight']),
      gender: serializer.fromJson<bool>(json['gender']),
      age: serializer.fromJson<int>(json['age']),
      image: serializer.fromJson<String>(json['image']),
      user: serializer.fromJson<int>(json['user']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'weight': serializer.toJson<double>(weight),
      'gender': serializer.toJson<bool>(gender),
      'age': serializer.toJson<int>(age),
      'image': serializer.toJson<String>(image),
      'user': serializer.toJson<int>(user),
    };
  }

  BreedersDataClass copyWith(
          {int? id,
          String? name,
          double? weight,
          bool? gender,
          int? age,
          String? image,
          int? user}) =>
      BreedersDataClass(
        id: id ?? this.id,
        name: name ?? this.name,
        weight: weight ?? this.weight,
        gender: gender ?? this.gender,
        age: age ?? this.age,
        image: image ?? this.image,
        user: user ?? this.user,
      );
  @override
  String toString() {
    return (StringBuffer('BreedersDataClass(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('weight: $weight, ')
          ..write('gender: $gender, ')
          ..write('age: $age, ')
          ..write('image: $image, ')
          ..write('user: $user')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              weight.hashCode,
              $mrjc(
                  gender.hashCode,
                  $mrjc(
                      age.hashCode, $mrjc(image.hashCode, user.hashCode)))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BreedersDataClass &&
          other.id == this.id &&
          other.name == this.name &&
          other.weight == this.weight &&
          other.gender == this.gender &&
          other.age == this.age &&
          other.image == this.image &&
          other.user == this.user);
}

class BreedersCompanion extends UpdateCompanion<BreedersDataClass> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> weight;
  final Value<bool> gender;
  final Value<int> age;
  final Value<String> image;
  final Value<int> user;
  const BreedersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.weight = const Value.absent(),
    this.gender = const Value.absent(),
    this.age = const Value.absent(),
    this.image = const Value.absent(),
    this.user = const Value.absent(),
  });
  BreedersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double weight,
    required bool gender,
    required int age,
    this.image = const Value.absent(),
    required int user,
  })  : name = Value(name),
        weight = Value(weight),
        gender = Value(gender),
        age = Value(age),
        user = Value(user);
  static Insertable<BreedersDataClass> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? weight,
    Expression<bool>? gender,
    Expression<int>? age,
    Expression<String>? image,
    Expression<int>? user,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (weight != null) 'weight': weight,
      if (gender != null) 'gender': gender,
      if (age != null) 'age': age,
      if (image != null) 'image': image,
      if (user != null) 'user': user,
    });
  }

  BreedersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<double>? weight,
      Value<bool>? gender,
      Value<int>? age,
      Value<String>? image,
      Value<int>? user}) {
    return BreedersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      weight: weight ?? this.weight,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      image: image ?? this.image,
      user: user ?? this.user,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (gender.present) {
      map['gender'] = Variable<bool>(gender.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (user.present) {
      map['user'] = Variable<int>(user.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BreedersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('weight: $weight, ')
          ..write('gender: $gender, ')
          ..write('age: $age, ')
          ..write('image: $image, ')
          ..write('user: $user')
          ..write(')'))
        .toString();
  }
}

class $BreedersTable extends Breeders
    with TableInfo<$BreedersTable, BreedersDataClass> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BreedersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  late final GeneratedColumn<double?> weight = GeneratedColumn<double?>(
      'weight', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  late final GeneratedColumn<bool?> gender = GeneratedColumn<bool?>(
      'gender', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (gender IN (0, 1))');
  final VerificationMeta _ageMeta = const VerificationMeta('age');
  late final GeneratedColumn<int?> age = GeneratedColumn<int?>(
      'age', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, false,
      typeName: 'TEXT',
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  final VerificationMeta _userMeta = const VerificationMeta('user');
  late final GeneratedColumn<int?> user = GeneratedColumn<int?>(
      'user', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES users (id) ON DELETE CASCADE');
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, weight, gender, age, image, user];
  @override
  String get aliasedName => _alias ?? 'breeders';
  @override
  String get actualTableName => 'breeders';
  @override
  VerificationContext validateIntegrity(Insertable<BreedersDataClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('user')) {
      context.handle(
          _userMeta, user.isAcceptableOrUnknown(data['user']!, _userMeta));
    } else if (isInserting) {
      context.missing(_userMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BreedersDataClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BreedersDataClass.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BreedersTable createAlias(String alias) {
    return $BreedersTable(_db, alias);
  }
}

class FeedingDataClass extends DataClass
    implements Insertable<FeedingDataClass> {
  final int id;
  final double dryMatter;
  final double greenMatter;
  final bool water;
  final DateTime date;
  final int breeder;
  FeedingDataClass(
      {required this.id,
      required this.dryMatter,
      required this.greenMatter,
      required this.water,
      required this.date,
      required this.breeder});
  factory FeedingDataClass.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return FeedingDataClass(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      dryMatter: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dry_matter'])!,
      greenMatter: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}green_matter'])!,
      water: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}water'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      breeder: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}breeder'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['dry_matter'] = Variable<double>(dryMatter);
    map['green_matter'] = Variable<double>(greenMatter);
    map['water'] = Variable<bool>(water);
    map['date'] = Variable<DateTime>(date);
    map['breeder'] = Variable<int>(breeder);
    return map;
  }

  FeedingCompanion toCompanion(bool nullToAbsent) {
    return FeedingCompanion(
      id: Value(id),
      dryMatter: Value(dryMatter),
      greenMatter: Value(greenMatter),
      water: Value(water),
      date: Value(date),
      breeder: Value(breeder),
    );
  }

  factory FeedingDataClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FeedingDataClass(
      id: serializer.fromJson<int>(json['id']),
      dryMatter: serializer.fromJson<double>(json['dryMatter']),
      greenMatter: serializer.fromJson<double>(json['greenMatter']),
      water: serializer.fromJson<bool>(json['water']),
      date: serializer.fromJson<DateTime>(json['date']),
      breeder: serializer.fromJson<int>(json['breeder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dryMatter': serializer.toJson<double>(dryMatter),
      'greenMatter': serializer.toJson<double>(greenMatter),
      'water': serializer.toJson<bool>(water),
      'date': serializer.toJson<DateTime>(date),
      'breeder': serializer.toJson<int>(breeder),
    };
  }

  FeedingDataClass copyWith(
          {int? id,
          double? dryMatter,
          double? greenMatter,
          bool? water,
          DateTime? date,
          int? breeder}) =>
      FeedingDataClass(
        id: id ?? this.id,
        dryMatter: dryMatter ?? this.dryMatter,
        greenMatter: greenMatter ?? this.greenMatter,
        water: water ?? this.water,
        date: date ?? this.date,
        breeder: breeder ?? this.breeder,
      );
  @override
  String toString() {
    return (StringBuffer('FeedingDataClass(')
          ..write('id: $id, ')
          ..write('dryMatter: $dryMatter, ')
          ..write('greenMatter: $greenMatter, ')
          ..write('water: $water, ')
          ..write('date: $date, ')
          ..write('breeder: $breeder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          dryMatter.hashCode,
          $mrjc(greenMatter.hashCode,
              $mrjc(water.hashCode, $mrjc(date.hashCode, breeder.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FeedingDataClass &&
          other.id == this.id &&
          other.dryMatter == this.dryMatter &&
          other.greenMatter == this.greenMatter &&
          other.water == this.water &&
          other.date == this.date &&
          other.breeder == this.breeder);
}

class FeedingCompanion extends UpdateCompanion<FeedingDataClass> {
  final Value<int> id;
  final Value<double> dryMatter;
  final Value<double> greenMatter;
  final Value<bool> water;
  final Value<DateTime> date;
  final Value<int> breeder;
  const FeedingCompanion({
    this.id = const Value.absent(),
    this.dryMatter = const Value.absent(),
    this.greenMatter = const Value.absent(),
    this.water = const Value.absent(),
    this.date = const Value.absent(),
    this.breeder = const Value.absent(),
  });
  FeedingCompanion.insert({
    this.id = const Value.absent(),
    required double dryMatter,
    required double greenMatter,
    required bool water,
    required DateTime date,
    required int breeder,
  })  : dryMatter = Value(dryMatter),
        greenMatter = Value(greenMatter),
        water = Value(water),
        date = Value(date),
        breeder = Value(breeder);
  static Insertable<FeedingDataClass> custom({
    Expression<int>? id,
    Expression<double>? dryMatter,
    Expression<double>? greenMatter,
    Expression<bool>? water,
    Expression<DateTime>? date,
    Expression<int>? breeder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dryMatter != null) 'dry_matter': dryMatter,
      if (greenMatter != null) 'green_matter': greenMatter,
      if (water != null) 'water': water,
      if (date != null) 'date': date,
      if (breeder != null) 'breeder': breeder,
    });
  }

  FeedingCompanion copyWith(
      {Value<int>? id,
      Value<double>? dryMatter,
      Value<double>? greenMatter,
      Value<bool>? water,
      Value<DateTime>? date,
      Value<int>? breeder}) {
    return FeedingCompanion(
      id: id ?? this.id,
      dryMatter: dryMatter ?? this.dryMatter,
      greenMatter: greenMatter ?? this.greenMatter,
      water: water ?? this.water,
      date: date ?? this.date,
      breeder: breeder ?? this.breeder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dryMatter.present) {
      map['dry_matter'] = Variable<double>(dryMatter.value);
    }
    if (greenMatter.present) {
      map['green_matter'] = Variable<double>(greenMatter.value);
    }
    if (water.present) {
      map['water'] = Variable<bool>(water.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (breeder.present) {
      map['breeder'] = Variable<int>(breeder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeedingCompanion(')
          ..write('id: $id, ')
          ..write('dryMatter: $dryMatter, ')
          ..write('greenMatter: $greenMatter, ')
          ..write('water: $water, ')
          ..write('date: $date, ')
          ..write('breeder: $breeder')
          ..write(')'))
        .toString();
  }
}

class $FeedingTable extends Feeding
    with TableInfo<$FeedingTable, FeedingDataClass> {
  final GeneratedDatabase _db;
  final String? _alias;
  $FeedingTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _dryMatterMeta = const VerificationMeta('dryMatter');
  late final GeneratedColumn<double?> dryMatter = GeneratedColumn<double?>(
      'dry_matter', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _greenMatterMeta =
      const VerificationMeta('greenMatter');
  late final GeneratedColumn<double?> greenMatter = GeneratedColumn<double?>(
      'green_matter', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _waterMeta = const VerificationMeta('water');
  late final GeneratedColumn<bool?> water = GeneratedColumn<bool?>(
      'water', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (water IN (0, 1))');
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _breederMeta = const VerificationMeta('breeder');
  late final GeneratedColumn<int?> breeder = GeneratedColumn<int?>(
      'breeder', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL REFERENCES breeders (id) ON DELETE CASCADE');
  @override
  List<GeneratedColumn> get $columns =>
      [id, dryMatter, greenMatter, water, date, breeder];
  @override
  String get aliasedName => _alias ?? 'feeding';
  @override
  String get actualTableName => 'feeding';
  @override
  VerificationContext validateIntegrity(Insertable<FeedingDataClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('dry_matter')) {
      context.handle(_dryMatterMeta,
          dryMatter.isAcceptableOrUnknown(data['dry_matter']!, _dryMatterMeta));
    } else if (isInserting) {
      context.missing(_dryMatterMeta);
    }
    if (data.containsKey('green_matter')) {
      context.handle(
          _greenMatterMeta,
          greenMatter.isAcceptableOrUnknown(
              data['green_matter']!, _greenMatterMeta));
    } else if (isInserting) {
      context.missing(_greenMatterMeta);
    }
    if (data.containsKey('water')) {
      context.handle(
          _waterMeta, water.isAcceptableOrUnknown(data['water']!, _waterMeta));
    } else if (isInserting) {
      context.missing(_waterMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('breeder')) {
      context.handle(_breederMeta,
          breeder.isAcceptableOrUnknown(data['breeder']!, _breederMeta));
    } else if (isInserting) {
      context.missing(_breederMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FeedingDataClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    return FeedingDataClass.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FeedingTable createAlias(String alias) {
    return $FeedingTable(_db, alias);
  }
}

class BreedingDataClass extends DataClass
    implements Insertable<BreedingDataClass> {
  final int id;
  final int kit;
  final DateTime date;
  final int breeder;
  final int mate;
  BreedingDataClass(
      {required this.id,
      required this.kit,
      required this.date,
      required this.breeder,
      required this.mate});
  factory BreedingDataClass.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BreedingDataClass(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      kit: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}kit'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      breeder: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}breeder'])!,
      mate: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}mate'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['kit'] = Variable<int>(kit);
    map['date'] = Variable<DateTime>(date);
    map['breeder'] = Variable<int>(breeder);
    map['mate'] = Variable<int>(mate);
    return map;
  }

  BreedingCompanion toCompanion(bool nullToAbsent) {
    return BreedingCompanion(
      id: Value(id),
      kit: Value(kit),
      date: Value(date),
      breeder: Value(breeder),
      mate: Value(mate),
    );
  }

  factory BreedingDataClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BreedingDataClass(
      id: serializer.fromJson<int>(json['id']),
      kit: serializer.fromJson<int>(json['kit']),
      date: serializer.fromJson<DateTime>(json['date']),
      breeder: serializer.fromJson<int>(json['breeder']),
      mate: serializer.fromJson<int>(json['mate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'kit': serializer.toJson<int>(kit),
      'date': serializer.toJson<DateTime>(date),
      'breeder': serializer.toJson<int>(breeder),
      'mate': serializer.toJson<int>(mate),
    };
  }

  BreedingDataClass copyWith(
          {int? id, int? kit, DateTime? date, int? breeder, int? mate}) =>
      BreedingDataClass(
        id: id ?? this.id,
        kit: kit ?? this.kit,
        date: date ?? this.date,
        breeder: breeder ?? this.breeder,
        mate: mate ?? this.mate,
      );
  @override
  String toString() {
    return (StringBuffer('BreedingDataClass(')
          ..write('id: $id, ')
          ..write('kit: $kit, ')
          ..write('date: $date, ')
          ..write('breeder: $breeder, ')
          ..write('mate: $mate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(kit.hashCode,
          $mrjc(date.hashCode, $mrjc(breeder.hashCode, mate.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BreedingDataClass &&
          other.id == this.id &&
          other.kit == this.kit &&
          other.date == this.date &&
          other.breeder == this.breeder &&
          other.mate == this.mate);
}

class BreedingCompanion extends UpdateCompanion<BreedingDataClass> {
  final Value<int> id;
  final Value<int> kit;
  final Value<DateTime> date;
  final Value<int> breeder;
  final Value<int> mate;
  const BreedingCompanion({
    this.id = const Value.absent(),
    this.kit = const Value.absent(),
    this.date = const Value.absent(),
    this.breeder = const Value.absent(),
    this.mate = const Value.absent(),
  });
  BreedingCompanion.insert({
    this.id = const Value.absent(),
    required int kit,
    required DateTime date,
    required int breeder,
    required int mate,
  })  : kit = Value(kit),
        date = Value(date),
        breeder = Value(breeder),
        mate = Value(mate);
  static Insertable<BreedingDataClass> custom({
    Expression<int>? id,
    Expression<int>? kit,
    Expression<DateTime>? date,
    Expression<int>? breeder,
    Expression<int>? mate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kit != null) 'kit': kit,
      if (date != null) 'date': date,
      if (breeder != null) 'breeder': breeder,
      if (mate != null) 'mate': mate,
    });
  }

  BreedingCompanion copyWith(
      {Value<int>? id,
      Value<int>? kit,
      Value<DateTime>? date,
      Value<int>? breeder,
      Value<int>? mate}) {
    return BreedingCompanion(
      id: id ?? this.id,
      kit: kit ?? this.kit,
      date: date ?? this.date,
      breeder: breeder ?? this.breeder,
      mate: mate ?? this.mate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (kit.present) {
      map['kit'] = Variable<int>(kit.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (breeder.present) {
      map['breeder'] = Variable<int>(breeder.value);
    }
    if (mate.present) {
      map['mate'] = Variable<int>(mate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BreedingCompanion(')
          ..write('id: $id, ')
          ..write('kit: $kit, ')
          ..write('date: $date, ')
          ..write('breeder: $breeder, ')
          ..write('mate: $mate')
          ..write(')'))
        .toString();
  }
}

class $BreedingTable extends Breeding
    with TableInfo<$BreedingTable, BreedingDataClass> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BreedingTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _kitMeta = const VerificationMeta('kit');
  late final GeneratedColumn<int?> kit = GeneratedColumn<int?>(
      'kit', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _breederMeta = const VerificationMeta('breeder');
  late final GeneratedColumn<int?> breeder = GeneratedColumn<int?>(
      'breeder', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints:
          'NOT NULL REFERENCES breeders (id) ON DELETE CASCADE');
  final VerificationMeta _mateMeta = const VerificationMeta('mate');
  late final GeneratedColumn<int?> mate = GeneratedColumn<int?>(
      'mate', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES breeders (id)');
  @override
  List<GeneratedColumn> get $columns => [id, kit, date, breeder, mate];
  @override
  String get aliasedName => _alias ?? 'breeding';
  @override
  String get actualTableName => 'breeding';
  @override
  VerificationContext validateIntegrity(Insertable<BreedingDataClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('kit')) {
      context.handle(
          _kitMeta, kit.isAcceptableOrUnknown(data['kit']!, _kitMeta));
    } else if (isInserting) {
      context.missing(_kitMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('breeder')) {
      context.handle(_breederMeta,
          breeder.isAcceptableOrUnknown(data['breeder']!, _breederMeta));
    } else if (isInserting) {
      context.missing(_breederMeta);
    }
    if (data.containsKey('mate')) {
      context.handle(
          _mateMeta, mate.isAcceptableOrUnknown(data['mate']!, _mateMeta));
    } else if (isInserting) {
      context.missing(_mateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BreedingDataClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BreedingDataClass.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BreedingTable createAlias(String alias) {
    return $BreedingTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $UsersTable users = $UsersTable(this);
  late final $BreedersTable breeders = $BreedersTable(this);
  late final $FeedingTable feeding = $FeedingTable(this);
  late final $BreedingTable breeding = $BreedingTable(this);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final BreedersDao breedersDao = BreedersDao(this as AppDatabase);
  late final FeedingDao feedingDao = FeedingDao(this as AppDatabase);
  late final BreedingDao breedingDao = BreedingDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, breeders, feeding, breeding];
}
