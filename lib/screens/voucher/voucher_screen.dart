import 'package:flutter/material.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({Key? key}) : super(key: key);

  static const String routeName = '/voucher';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => VoucherScreen(),
      settings: RouteSettings(
        name: routeName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voucher'),
        centerTitle: true,
      ),
      body: ElevatedButton(
        child: Text('Home Screen'),
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
      ),
    );
  }
}
