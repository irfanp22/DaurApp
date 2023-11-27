import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? namaLengkap;
  String? email;
  String? noHP;
  int? icn;
  List<String>? alamat;
  int? activePoin;
  int? xp;
  Timestamp? createdAt;

  UserModel(
      {this.id,
      this.namaLengkap,
      this.email,
      this.noHP,
      this.icn,
      this.alamat,
      this.activePoin,
      this.xp,
      this.createdAt});

  factory UserModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return UserModel(
        id: data?['id'],
        namaLengkap: data?['namaLengkap'],
        email: data?['email'],
        noHP: data?['noHP'],
        icn: data?['icn'],
        alamat: data?['alamat'] is Iterable ? List.from(data?['alamat']) : null,
        activePoin: data?['activePoin'],
        xp: data?['xp'],
        createdAt: data?['createdAt']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) 'id': id,
      if (namaLengkap != null) 'namaLengkap': namaLengkap,
      if (email != null) 'email': email,
      if (noHP != null) 'noHP': noHP,
      if (icn != null) 'icn': icn,
      if (alamat != null) 'alamat': alamat,
      if (activePoin != null) 'activePoin': activePoin,
      if (xp != null) 'xp': xp,
      if (createdAt != null) 'createdAt': createdAt
    };
  }
}
