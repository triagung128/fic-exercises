import 'package:flutter/material.dart';
import 'package:example/core.dart';

class LtfmFilterDialogView extends StatefulWidget {
  const LtfmFilterDialogView({Key? key}) : super(key: key);

  Widget build(context, LtfmFilterDialogController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("LtfmFilterDialog"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 12.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.grey[500],
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              initialValue: null,
                              decoration: InputDecoration.collapsed(
                                filled: true,
                                fillColor: Colors.transparent,
                                hintText: "What are you craving?",
                                hintStyle: TextStyle(
                                  color: Colors.grey[500],
                                ),
                                hoverColor: Colors.transparent,
                              ),
                              onFieldSubmitted: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  SizedBox(
                    height: 50.0,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.tune),
                      label: const Text("Filter"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                      ),
                      onPressed: () async {
                        //! 1. Tampilkan dialog, gunakan kode ini:
                        /*
                        await showDialog<void>(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Filter'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[],
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Filter"),
                                ),
                              ],
                            );
                          },
                        );
                        */
                        //! 2. Di dalam children dari ListBody,
                        //! Tambahkan field2 ini:
                        //? datepicker dengan label "from"
                        //? datepicker dengan label "to"
                        await showDialog<void>(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Filter'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2100),
                                        );
                                        print("pickedDate: $pickedDate");
                                        String formattedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(pickedDate!);
                                        controller.setState(() {
                                          controller.fromFilterController.text =
                                              formattedDate;
                                        });
                                      },
                                      child: TextFormField(
                                        controller:
                                            controller.fromFilterController,
                                        enabled: false,
                                        decoration: const InputDecoration(
                                          labelText: 'from',
                                          suffixIcon: Icon(Icons.date_range),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2100),
                                        );
                                        print("pickedDate: $pickedDate");
                                        String formattedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(pickedDate!);
                                        controller.setState(() {
                                          controller.toFilterController.text =
                                              formattedDate;
                                        });
                                      },
                                      child: TextFormField(
                                        controller:
                                            controller.toFilterController,
                                        enabled: false,
                                        decoration: const InputDecoration(
                                          labelText: 'to',
                                          suffixIcon: Icon(Icons.date_range),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Filter"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LtfmFilterDialogView> createState() => LtfmFilterDialogController();
}
