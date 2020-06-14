import 'package:flutter/material.dart';
import 'package:flutter_guide_project/_api/api.dart';
import 'package:flutter_guide_project/widgets/customButton.dart';

class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, dynamic> _formData = <String, dynamic>{};
  bool _loading = false;

  _addPost() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _loading = true;
      });
      _formKey.currentState.save();
      try {
        await API.savePost(_formData);
        _formKey.currentState.reset();
        print('saved');
      } catch (e) {
        print(e.toString());
      }
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Post')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'required';
                  return null;
                },
                onSaved: (value) {
                  _formData['title'] = value;
                },
              ),
              TextFormField(
                minLines: 1,
                maxLines: 4,
                decoration: InputDecoration(hintText: 'Body'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'required';
                  return null;
                },
                onSaved: (value) {
                  _formData['body'] = value;
                },
              ),
              Container(
                child: CustomButton(
                  text: 'Save',
                  ontap: _addPost,
                  loading: _loading,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
