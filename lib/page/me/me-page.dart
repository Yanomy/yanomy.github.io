import 'package:flutter/material.dart';


class MePage extends StatelessWidget{
  const MePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _buildProfileCol(context),
          _buildResumeCol(context),
        ],
      ),
    );
  }

  _buildProfileCol(BuildContext context){
    return Container(color: Colors.blue);
  }

  _buildResumeCol(BuildContext context){
    return Container(color: Theme.of(context).canvasColor);
  }
}
