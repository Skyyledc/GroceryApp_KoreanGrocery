import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _imagePicker = ImagePicker();

  String? _name;
  String? _email;
  bool _isLoading = true;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    // Load user information when the profile page is initialized.
    loadUserInfo();
  }

  Future<void> loadUserInfo() async {
    User? user = _auth.currentUser;

    if (user != null) {
      try {
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(user.uid).get();

        if (userDoc.exists) {
          setState(() {
            _name = userDoc['name'];
            _email = userDoc['email'];
          });
        }
      } catch (e) {
        print('Error loading user information: $e');
        // Handle error gracefully, show a message to the user, etc.
        // You might want to set an error state here.
      } finally {
        // Set isLoading to false when the data is loaded or an error occurs.
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _signOut() async {
    await _auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  Future<void> _sendPasswordResetEmail() async {
    try {
      User? user = _auth.currentUser;

      if (user != null && user.email != null) {
        await _auth.sendPasswordResetEmail(email: user.email!);

        // You can add a success message or navigate to a success screen.
        print('Password reset email sent successfully');
      } else {
        print('User or user email is null');
      }
    } catch (e) {
      print('Error sending password reset email: $e');
      // Handle error gracefully, show a message to the user, etc.
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });

      // Upload the image to Firebase Storage and update Firestore
      await _uploadImage(context, _imageFile);
    }
  }

  Future<void> _uploadImage(BuildContext context, File? imageFile) async {
    if (imageFile == null) {
      return;
    }

    try {
      User? user = _auth.currentUser;

      if (user != null) {
        final ref = _storage.ref().child('profile_images/${user.uid}');
        await ref.putFile(imageFile);
        final imageUrl = await ref.getDownloadURL();

        // Save the image URL to Firestore along with the user name and email.
        await _firestore.collection('users').doc(user.uid).set({
          'name': _name,
          'email': _email,
          'imageUrl': imageUrl,
        }, SetOptions(merge: true));
      }
    } catch (e) {
      print('Error uploading image: $e');
      // Handle error gracefully, show a message to the user, etc.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade200,
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _signOut,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      radius: 50,
                      backgroundImage: _imageFile != null
                          // ignore: unnecessary_cast
                          ? FileImage(File(_imageFile!.path))
                              as ImageProvider<Object>?
                          // ignore: unnecessary_cast
                          : const AssetImage('assets/images/newUser.png')
                              as ImageProvider<Object>?,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          onPressed: _pickImage,
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.pink.shade200,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (_name != null)
                      Text(
                        'Name: $_name',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    if (_email != null)
                      Text(
                        'Email: $_email',
                        style: const TextStyle(fontSize: 18),
                      ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _sendPasswordResetEmail,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade200,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                      ),
                      child: const Text('Reset Password'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
