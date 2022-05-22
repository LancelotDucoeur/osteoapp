import 'package:flutter/material.dart';

class TermsScreen extends StatefulWidget {
  final Function(int) onChangedStep;

  const TermsScreen({
    Key? key,
    required this.onChangedStep,
  }) : super(key: key);

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  late ScrollController _scrollController;
  bool _termsReaded = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() => _termsReaded = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(
          "Termes & conditions",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => widget.onChangedStep(0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          bottom: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam egestas, orci quis pulvinar egestas, lorem nibh maximus risus, a viverra nisi sapien eget diam. Proin nec augue congue augue condimentum hendrerit. Nullam posuere fringilla metus convallis tincidunt. Nullam iaculis eu elit non tempor. Nulla quis auctor ipsum, lacinia blandit nisi. Nullam aliquet dignissim mauris et tincidunt. Integer molestie, nulla at hendrerit tincidunt, eros erat tempus sem, in scelerisque orci ligula mattis ante. Nam purus velit, finibus et pulvinar id, dignissim quis ipsum. Curabitur eget neque justo. Cras fermentum mattis felis, at convallis nisl dignissim sed. \nInteger sodales dapibus dolor vel bibendum. Aenean vel dui ante. Etiam elit sem, dictum id enim vitae, fermentum efficitur massa. Sed aliquet, massa id faucibus sodales, risus sem hendrerit ex, vitae tincidunt nunc quam viverra leo. Morbi lobortis arcu pellentesque, aliquam ex mollis, porta enim. Duis euismod sagittis justo, et convallis ex. Aliquam eget massa turpis. Aenean interdum nunc et velit rutrum lobortis. Integer at lacinia elit. Vestibulum vitae nunc enim. Curabitur interdum purus nec mi elementum, id mollis lorem laoreet. Aenean vel mi tortor. Aliquam erat volutpat. Quisque ut posuere mi, quis consequat augue. Nulla lobortis consectetur mattis.\nSuspendisse turpis velit, egestas in ante non, interdum egestas lacus. Pellentesque ornare quis lacus quis consectetur. Praesent congue tempor ex id mattis. Pellentesque pharetra porttitor lectus, sed luctus elit congue et. Integer ultricies neque purus, tincidunt posuere nunc varius id. Phasellus cursus ante quis sodales molestie. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla tincidunt efficitur urna sed consequat. Quisque laoreet justo vitae metus efficitur, ac hendrerit sapien molestie. Proin ipsum risus, consectetur lobortis aliquam nec, semper a odio. Duis tortor mauris, ultrices eget lacus eu, finibus iaculis neque.\nSed quis quam eleifend lacus tristique iaculis. Nunc nec purus nec eros suscipit lobortis. Donec consequat libero in eros fringilla vestibulum nec sit amet dolor. Sed libero lacus, mattis sit amet lorem sodales, tempus tristique diam. Fusce porta leo sed orci faucibus tristique. Nunc vehicula, lacus maximus commodo mollis, ipsum tortor efficitur justo, vitae pellentesque urna nisl aliquam metus. Cras mollis rutrum lectus, quis hendrerit dolor sodales sit amet.\nDonec vestibulum, eros nec placerat iaculis, est dui porttitor ex, ac mattis nulla eros ac nibh. Ut auctor quis quam a aliquet. Morbi varius condimentum massa, et iaculis urna gravida vitae. Sed id odio sit amet diam imperdiet vulputate non non odio. Aliquam posuere odio id metus porta, non finibus leo pulvinar. Fusce massa nisi, vulputate nec augue ut, maximus sodales urna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur iaculis tincidunt dapibus. Pellentesque semper, arcu vitae molestie vehicula, urna orci rhoncus mauris, sed suscipit augue augue vitae ante. Nam ligula neque, porttitor et nisi vitae, efficitur aliquam odio. Nam neque libero, venenatis in velit id, elementum lobortis neque. Maecenas ullamcorper eu orci eu iaculis. Aenean non nulla condimentum, scelerisque odio lobortis, porttitor mi.",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: !_termsReaded ? null : () => widget.onChangedStep(2),
              child: Text(
                "accepter".toUpperCase(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
