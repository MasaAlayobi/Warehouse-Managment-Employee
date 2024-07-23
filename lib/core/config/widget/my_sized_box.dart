import 'package:flutter/material.dart';

class sizedBox30 extends StatelessWidget {
  const sizedBox30({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 30,
    );
  }
}
class sizedBox15 extends StatelessWidget {
  const sizedBox15({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 15,
    );
  }
}

class sizedBox40 extends StatelessWidget {
  const sizedBox40({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 40,
    );
  }
}

class sizedBox50 extends StatelessWidget {
  const sizedBox50({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 50,
    );
  }
}
