import 'package:flutter/material.dart';

TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController mobile = TextEditingController();
TextEditingController pass1 = TextEditingController();
TextEditingController pass2 = TextEditingController();

void dispose() {
  name.dispose();
  email.dispose();
  mobile.dispose();
  pass1.dispose();
  pass2.dispose();
}
