part of 'services.dart';

class HistoryTransactionServices {
  static CollectionReference transactionCollection =
      Firestore.instance.collection('transactions');

  static Future<void> saveTransaction(
      HistoryTransaction historyTransaction) async {
    await transactionCollection.document().setData({
      'userID': historyTransaction.userID,
      'title': historyTransaction.title,
      'subtitle': historyTransaction.subtitle,
      'time': historyTransaction.time.millisecondsSinceEpoch,
      'amount': historyTransaction.amount,
      'picture': historyTransaction.picture
    });
  }

  static Future<List<HistoryTransaction>> getTransaction(String userID) async {
    QuerySnapshot snapshot = await transactionCollection.getDocuments();

    var documents = snapshot.documents
        .where((document) => document.data['userID'] == userID);

    return documents
        .map((e) => HistoryTransaction(
            userID: e.data['userID'],
            title: e.data['title'],
            subtitle: e.data['subtitle'],
            time: DateTime.fromMicrosecondsSinceEpoch(e.data['time']),
            amount: e.data['amount'],
            picture: e.data['picture']))
        .toList();
  }
}
