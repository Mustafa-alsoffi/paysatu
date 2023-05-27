import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Componets/bottom_nav_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _photoUrl = '';
  String _name = 'GAAFAR';
  String _email = 'abdullahmohmed34@gmail.com';
  String _phone = '+966502159213';
  String _website = 'WWW.GAAFAR.COM';
  String _location = 'Earth';
  String _id = '123456789';

  final ImagePicker _picker = ImagePicker();

  void _showEditDialog(String title, String value, Function(String) onSave) {
    TextEditingController _textEditingController =
        TextEditingController(text: value);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit $title'),
          content: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(hintText: 'Enter $title'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                onSave(_textEditingController.text);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _pickImageFromGallery() async {
    final XFile? imageFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      setState(() {
        _photoUrl = imageFile.path;
      });
    }
  }

  void _takePhotoWithCamera() async {
    final XFile? imageFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (imageFile != null) {
      setState(() {
        _photoUrl = imageFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Profile'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        // Set automaticallyImplyLeading to false
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(235, 3, 3, 210),
                    Color.fromARGB(254, 54, 54, 246)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Positioned(
                      child:
                          Stack(children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child:
                          CircleAvatar(radius: 70, backgroundImage:
                              AssetImage('assets/profile_photo.jpg')),
                    ),
                  ]) // Replace with your placeholder image asset path
                      ),
                  Padding(
                    padding:
                        const EdgeInsets.all(8.0),
                    child:
                        Row(mainAxisAlignment:
                            MainAxisAlignment.end,
                            children:
                                [
                      IconButton(
                        iconSize:
                            32,
                        icon:
                            Icon(Icons.photo, color:
                                Colors.white),
                        onPressed:
                            _pickImageFromGallery,
                      ),
                      IconButton(
                        iconSize:
                            32,
                        icon:
                            Icon(Icons.camera_alt, color:
                                Colors.white),
                        onPressed:
                            _takePhotoWithCamera,
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top:
                    200),
            child:
                ListView(children:
                    [
              ListTile(
                leading:
                    Icon(Icons.account_circle),
                title:
                    Text('Name', style:
                        TextStyle(fontFamily:
                            'Montserrat')),
                subtitle:
                    Text(_name, style:
                        TextStyle(fontFamily:
                            'Raleway')),
                trailing:
                    IconButton(
                  iconSize:
                      32,
                  icon:
                      Icon(Icons.edit),
                  onPressed:
                      () {
                    _showEditDialog('Name',
                        _name, (value) {
                      setState(() {
                        _name =
                            value;
                      });
                    });
                  },
                ),
              ),
              ListTile(
                leading:
                    Icon(Icons.email),
                title:
                    Text('Email', style:
                        TextStyle(fontFamily:
                            'Montserrat')),
                subtitle:
                    Text(_email, style:
                        TextStyle(fontFamily:
                            'Raleway')),
                trailing:
                    IconButton(
                  iconSize:
                      32,
                  icon:
                      Icon(Icons.edit),
                  onPressed:
                      () {
                    _showEditDialog('Email',
                        _email, (value) {
                      setState(() {
                        _email =
                            value;
                      });
                    });
                  },
                ),
              ),
              ListTile(
                leading:
                    Icon(Icons.phone),
                title:
                    Text('Phone', style:
                        TextStyle(fontFamily:
                            'Montserrat')),
                subtitle:
                    Text(_phone, style:
                        TextStyle(fontFamily:
                            'Raleway')),
                trailing:
                    IconButton(
                  iconSize:
                      32,
                  icon:
                      Icon(Icons.edit),
                  onPressed:
                      () {
                    _showEditDialog('Phone',
                        _phone, (value) {
                      setState(() {
                        _phone =
                            value;
                      });
                    });
                  },
                ),
              ),
              ListTile(
                leading:
                    Icon(Icons.web),
                title:
                    Text('Website', style:
                        TextStyle(fontFamily:
                            'Montserrat')),
                subtitle:
                    Text(_website, style:
                        TextStyle(fontFamily:
                            'Raleway')),
                trailing:                    IconButton(
                  iconSize:
                      32,
                  icon:
                      Icon(Icons.edit),
                  onPressed:
                      () {
                    _showEditDialog('Website',
                        _website, (value) {
                      setState(() {
                        _website =
                            value;
                      });
                    });
                  },
                ),
              ),
              ListTile(
                leading:
                    Icon(Icons.location_on),
                title:
                    Text('Location', style:
                        TextStyle(fontFamily:
                            'Montserrat')),
                subtitle:
                    Text(_location, style:
                        TextStyle(fontFamily:
                            'Raleway')),
                trailing:
                    IconButton(
                  iconSize:
                      32,
                  icon:
                      Icon(Icons.edit),
                  onPressed:
                      () {
                    _showEditDialog('Location',
                        _location, (value) {
                      setState(() {
                        _location =
                            value;
                      });
                    });
                  },
                ),
              ),
              ListTile(
                leading:
                    Icon(Icons.perm_identity),
                title:
                    Text('ID', style:
                        TextStyle(fontFamily:
                            'Montserrat')),
                subtitle:
                    Text(_id, style:
                        TextStyle(fontFamily:
                            'Raleway')),
                trailing:
                    IconButton(
                  iconSize:
                      32,
                  icon:
                      Icon(Icons.edit),
                  onPressed:
                      () {
                    _showEditDialog('ID',
                        _id, (value) {
                      setState(() {
                        _id =
                            value;
                      });
                    });
                  },
                ),
              ),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 2),
    );
  }
}


