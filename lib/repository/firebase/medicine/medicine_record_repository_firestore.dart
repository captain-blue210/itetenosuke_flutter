import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:itete_no_suke/model/medicine/medicine.dart';
import 'package:itete_no_suke/model/medicine/medicine_repository_interface.dart';

class MedicineRecordRepositoryFirestore implements MedicineRepositoryInterface {
  static const _localhost = 'localhost';
  static const _isEmulator = bool.fromEnvironment('IS_EMULATOR');

  MedicineRecordRepositoryFirestore() {
    if (_isEmulator) {
      FirebaseFirestore.instance.useFirestoreEmulator(_localhost, 8080);
    }
  }

  @override
  Future<List<Medicine>> findAll() {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  Stream<QuerySnapshot<Medicine>> fetchMedicinesByUserID(String userID) {
    return getMedicineRef(userID)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  @override
  Future<List<Medicine>?> fetchMedicinesByPainRecordsID(
      String userID, String painRecordsID) {
    // TODO: implement fetchMedicinesByUserID
    throw UnimplementedError();
  }

  @override
  Future<void> save(String userID, Medicine newMedicine) async {
    (await getMedicineRef(userID)).add(newMedicine);
  }

  CollectionReference<Medicine> getMedicineRef(String userID) {
    final medicineRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('medicines')
        .withConverter<Medicine>(
            fromFirestore: (snapshot, _) => Medicine.fromJson(snapshot.data()!),
            toFirestore: (medicine, _) => medicine.toJson());
    return medicineRef;
  }

  DocumentReference<Medicine> getMedicineRefByID(
      String userID, String medicineID) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('medicines')
        .doc(medicineID)
        .withConverter<Medicine>(
            fromFirestore: (snapshot, _) => Medicine.fromJson(snapshot.data()!),
            toFirestore: (medicine, _) => medicine.toJson());
  }

  @override
  Future<Medicine> fetchMedicineByID(String userID, String medicineID) async {
    return getMedicineRefByID(userID, medicineID).get().then(
        (medicine) => medicine.data()!.setMedicineRef(medicine.reference));
  }

  @override
  void update(String userID, Medicine updated) {
    getMedicineRefByID(userID, updated.medicineID).update(updated.toJson());
  }
}
