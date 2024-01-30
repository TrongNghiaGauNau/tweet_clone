import 'package:flutter/material.dart';

showLoadingDialog(BuildContext context) async {
  // dismiss pop navigator using root
  await Future.delayed(const Duration(milliseconds: 200), () {
    showLoadingDialogWithoutTimer(context);
  });
}

showLoadingDialogWithoutTimer(BuildContext context,
    {bool useRootNavigator = true}) async {
  showDialog(
      // The user CANNOT close this dialog  by pressing outsite it
      barrierDismissible: false,
      useRootNavigator: useRootNavigator,
      context: context,
      builder: (_) {
        return const Dialog(
          // The background color
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // The loading indicator
                CircularProgressIndicator(),
                SizedBox(
                  height: 15,
                ),
                // Some text
                Text('Loading...', style: TextStyle(color: Colors.black))
              ],
            ),
          ),
        );
      });
}

mixin LoadingMixin {
  Future<A> doAsyncTask<A>(BuildContext context,
      {required Future<A> asyncTask}) async {
    await showLoadingDialog(context);
    final result = await asyncTask;
    await Future.delayed(
        const Duration(milliseconds: 200), () => Navigator.of(context).pop());

    return result;
  }
}
