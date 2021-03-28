import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_core/firebase_core.dart";

class FirebaseService {
  FirebaseFirestore _firestore;

  FirebaseService() {
    _initFirestore();
  }

  Future<Map<String, dynamic>> fetchData() async {
    DocumentSnapshot doc = await _firestore
        .collection("Wallets")
        .doc(
            "049d09701c91306f1d633a2f5ed8c5c901fca366b4372297a0bfde95f9cb5c40c04442920f91ebec6b094042606bdc04e0589c671a845ff5cb57d1bc1a912db807")
        .get();

    Map<String, dynamic> data = doc.data();

    return data;
  }

  void _initFirestore() {
    this._firestore = FirebaseFirestore.instance;
  }
}
