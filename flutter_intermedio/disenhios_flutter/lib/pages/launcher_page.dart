import 'package:disenhios_flutter/routes/routes.dart';
import 'package:disenhios_flutter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stilos en flutter'),
      ),
      drawer: const _MenuPrincipal(),
      body: const _ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: pageRoutes.length,
      separatorBuilder: (context, int index) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemBuilder: (context, int index) => ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => pageRoutes[index].page));
        },
        leading: FaIcon(
          pageRoutes[index].icon,
          color: Colors.blue,
        ),
        title: Text(pageRoutes[index].titulo),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Provider.of<ThemeChanger>(context);
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    'JA',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
            const Expanded(child: _ListaOpciones()),
            ListTile(
              leading: const Icon(
                Icons.lightbulb_outline,
                color: Colors.blue,
              ),
              title: const Text('Dark Mode'),
              trailing: Switch.adaptive(
                  activeColor: Colors.blue,
                  value: customTheme.darkTheme,
                  onChanged: (value) => customTheme.darkTheme = value),
            ),
            ListTile(
              leading: const Icon(
                Icons.add_to_home_screen,
                color: Colors.blue,
              ),
              title: const Text('Custom Theme'),
              trailing: Switch.adaptive(
                  activeColor: Colors.blue,
                  value: customTheme.customTheme,
                  onChanged: (value) => customTheme.customTheme = value),
            ),
          ],
        ),
      ),
    );
  }
}
