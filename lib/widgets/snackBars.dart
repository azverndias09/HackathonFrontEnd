import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

var goodSnackBar = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'On Great!',
    message:
        'This is an example error message that will be shown in the body of snackbar!',

    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
    contentType: ContentType.success,
  ),
);
var badSnackBar = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'On Snap!',
    message:
        'This is an example error message that will be shown in the body of snackbar!',

    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
    contentType: ContentType.failure,
  ),
);
