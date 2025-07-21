import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasky_app/data/firebase/model/user_model.dart';

abstract class FirebaseDatabase {
  static CollectionReference<UserModel> collectionUser() {
    return FirebaseFirestore.instance
        .collection('Users')
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }

  static Future<void> createUser(UserModel user) async {
    collectionUser().doc(user.id).set(user);
  }

  static Future<UserModel?> getUser(String userId) async {
    var data = await collectionUser().doc(userId).get();
    return data.data();
  }

  static Future<void> deleteUser(String userId) async {
    var data = await collectionUser().doc(userId).delete();
  }

  static Future<UserModel?> updateUser(
    String userId,
    Map<String, dynamic> newData,
  ) async {
    await collectionUser().doc(userId).update(newData);
    var snapshot = await collectionUser().doc(userId).get();
    return snapshot.data();
  }
}
