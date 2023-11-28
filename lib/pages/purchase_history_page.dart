import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class PurchaseHistoryPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  PurchaseHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade200,
        title: const Text('Purchase History'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
        child: FutureBuilder(
          future: _fetchPurchaseHistory(),
          builder:
              (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                  child: Text('No purchase history available.'));
            } else {
              // Display the purchase history
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final order = snapshot.data![index];
                  final orderId = order['orderId'];
                  final total = order['total'];
                  final timestamp = order['timestamp'] as Timestamp;
                  final orderTime = timestamp.toDate();

                  return Column(
                    children: [
                      ListTile(
                        title: Text('Order ID: $orderId'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total: PHP $total'),
                            Text('Timestamp: $orderTime'),
                          ],
                        ),
                        trailing: IconButton.filled(
                          color: Colors.red.shade300,
                          icon: const Icon(Icons.report),
                          onPressed: () {
                            _showReportDialog(context, orderId);
                          },
                        ),
                      ),
                      const Divider(), // Add a Divider
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> _fetchPurchaseHistory() async {
    User? user = _auth.currentUser;
    if (user != null) {
      QuerySnapshot historySnapshot = await _firestore
          .collection('purchase_history')
          .doc(user.uid)
          .collection('orders')
          .orderBy('timestamp', descending: true)
          .get();

      return historySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return {
          'orderId': doc.id, // Use the document ID as orderId
          'total': data['total'],
          'timestamp': data['timestamp'],
          // Add other details you want to include
        };
      }).toList();
    }

    return [];
  }

  void _showReportDialog(BuildContext context, String orderId) {
    String reportMessage = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Report Order'),
          content: Column(
            children: [
              const Text('Please provide details about the issue:'),
              const SizedBox(height: 10),
              TextFormField(
                cursorColor: Colors.red,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                onChanged: (value) {
                  reportMessage = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel',
                  style: GoogleFonts.poppins(
                    color: Colors.red.shade300,
                  )),
            ),
            TextButton(
              onPressed: () async {
                // Process the report (e.g., send it to a server)
                // For demonstration purposes, just print it here
                print('Report for Order ID $orderId: $reportMessage');

                // Show a confirmation dialog
                _showConfirmationDialog(context);
              },
              child: Text('Send Report',
                  style: GoogleFonts.poppins(
                    color: Colors.red.shade300,
                  )),
            ),
          ],
        );
      },
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Report Sent'),
          content: const Text('Thank you for reporting. We will investigate.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
