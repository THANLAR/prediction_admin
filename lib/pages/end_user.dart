import 'package:flutter/material.dart';
import 'package:predition_admin/provider/home_page_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    HomePageProvider homePageProvider = Provider.of(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prediction"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 2,
                decoration: const InputDecoration(
                    counterText: "", border: InputBorder.none),
                onChanged: (value) => homePageProvider.onChangeTextField(value),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Consumer<HomePageProvider>(builder: (context, provider, _) {
              if (provider.input.isEmpty) {
                return Container();
              } else {
                if (provider.isloading) {
                  return const SizedBox(
                    height: 210,
                    child: Text("တွက်ချက်နေပါသည် ကျေးဇူးပြု၍ ခဏစောင့်ပါ ...."),
                  );
                } else {
                  return Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text:
                              'တွက်ချက်မှု့အရ နောက်အကြိမ်တွင် ထွက်မည့် ဂဏန်းတွင် ..',
                          style: TextStyle(fontSize: 16),
                        ),
                        TextSpan(
                            text: "\n\n${provider.possibleFirstResult}",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.amber[900],
                                fontWeight: FontWeight.w800)),
                        const TextSpan(
                          text: ' ဂဏန်း နှင့်',
                          style: TextStyle(fontSize: 16),
                        ),
                        TextSpan(
                            text: " ${provider.possibleSecondResult}",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.amber[900],
                                fontWeight: FontWeight.w800)),
                        const TextSpan(
                          text: ' ဂဏန်း တစ်ခုခု ပါနိုင်သည်။',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                }
              }
            }),
            const SizedBox(
              height: 20.0,
            ),
            Consumer<HomePageProvider>(builder: (context, provider, _) {
              return Table(
                children: provider.outputResult
                    .map((e) => TableRow(children: [
                          Text(e),
                          Text(e),
                          Text(e),
                          Text(e),
                          Text(e),
                          Text(e),
                          Text(e),
                          Text(e),
                          Text(e),
                          Text(e),
                        ]))
                    .toList(),
              );
            }),
            const SizedBox(
              height: 20.0,
            ),
            Consumer<HomePageProvider>(
                builder: (context, provider, _) => provider.input.isEmpty
                    ? Container()
                    : Chip(
                        label: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                            "၃ ကြိမ်နှင့်အထက် ဆက်တိုက်မှန်ပီးလျှင် အမှား ၁ ခါ \nပါတတ်သည် ကို သတိပြုပါ။",
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 13, color: Colors.red[300])),
                      )))
          ],
        ),
      ),
    );
  }
}
