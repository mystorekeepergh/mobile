import 'package:flutter/material.dart';

import '../../../../../widgets/DashBordAppBar/appBar.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(child: Text('Account')),
      body: Center(
        child: Text('Account'),
      ),
    );
  }
}