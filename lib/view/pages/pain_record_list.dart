import 'package:flutter/material.dart';

class PainRecordList extends StatelessWidget {
  const PainRecordList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: ListTile(
            leading: Icon(Icons.tag_faces),
            title: Text('2021/10/22'),
            subtitle: Text('1. dummy1\n2. dummy2\n3. dummy3'),
            trailing: Icon(Icons.keyboard_arrow_right),
            isThreeLine: true,
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.tag_faces),
            title: Text('2021/10/23'),
            subtitle: Text('1. dummy1\n2. dummy2\n3. dummy3'),
            trailing: Icon(Icons.keyboard_arrow_right),
            isThreeLine: true,
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.tag_faces),
            title: Text('2021/10/23'),
            subtitle: Text('1. dummy1\n2. dummy2\n3. dummy3'),
            trailing: Icon(Icons.keyboard_arrow_right),
            isThreeLine: true,
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.tag_faces),
            title: Text('2021/10/23'),
            subtitle: Text('1. dummy1\n2. dummy2\n3. dummy3'),
            trailing: Icon(Icons.keyboard_arrow_right),
            isThreeLine: true,
          ),
        ),
      ],
    );
  }
}
