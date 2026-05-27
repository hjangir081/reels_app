import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore firestore;

  FirestoreService(this.firestore);

  Future<QuerySnapshot<Map<String, dynamic>>>
  fetchReels() async {

    try {

      final response =
      await firestore
          .collection('reels')
          .get();

      print(
        'DOCS COUNT: ${response.docs.length}',
      );

      return response;

    } on FirebaseException catch (e) {

      if (e.code == 'permission-denied') {

        throw Exception(
          'Firestore permission denied',
        );
      }

      throw Exception(
        e.message ??
            'Firestore error',
      );

    } catch (e) {

      throw Exception(
        'Something went wrong',
      );
    }
  }
}