import 'package:farmerlocalmobile/core/errors/exeptions.dart';
import 'package:flutter/material.dart';

const USER_ID = 'USER';

const EMAIL_REGEX =
    r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
const PASS_REGEX = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$';
const NAME_REGEX = r"^[a-zA-Z]{2,30}$";

const SERVER_FAILURE_MESSAGE = "Server error please try again";
const NETWORK_FAILURE_MESSAGE = "Please activate your internet";
const SOCKET_FAILURE_MESSAGE = "Seems you internet connection ran out";
const CACHE_FAILURE_MESSAGE = "Could not access records";
const INPUT_FAILURE_MESSAGE = "Input Failure";
const SELECT_FROM_PHONE_FAILURE_MESSAGE = "Something went wrong with the file";
const SELECT_FROM_GALLERY_FAILURE_MESSAGE = "Couldnt pick image from gallery";
const SELECT_FAIL_FAILURE_MESSAGE = "You did not pick an file";
const PERMISSION_FAILURE_MESSAGE =
    "Please enable locations for app in settings";
const PERMISSION_NEVER_ASKED_FAILURE_MESSAGE =
    "Please for location never asked";
const ACCOUNT_FAILURE_MESSAGE = "Could not create an account";
const UNAUTHENTICATED_FAILURE_MESSAGE =
    "You are unauthenticated, you will be logged out";
const SERVER_MAINTAINCE_FAILURE_MESSAGE = "Service maintenance failed";
const LANGUAGE_FAILURE_MESSAGE = "Could not fetch locale";
const FORBIDDEN_MESSAGE = "Access to the requested resource is forbidden";
const NOT_FOUND_MESSAGE = "Method not found";

const CACHE_AUTH_TOKEN = "CACHE_AUTH_TOKEN";
const CACHE_DASH_BOARD_DATA = "CACHE_DASH_BOARD_DATA";
const CHECK_SAVED_USER = "CHECK_SAVED_USER";
const AUTH_USER = 'AUTH_USER';
const SELECT_FROM_CAMERA_FAILURE_MESSAGE =
    "Something went wrong with the camera";

const SELECT_IMAGE_FAILURE_MESSAGE = "You did not pick an image";
const DATABASE_FAILURE = "Database Failure";

//exeption checketer
String returnFailure(final exception) {
  if (exception is SelectImageException) {
    return SELECT_IMAGE_FAILURE_MESSAGE;
  } else if (exception is SelectImageFromCameraException) {
    return SELECT_FROM_CAMERA_FAILURE_MESSAGE;
  } else if (exception is SelectImageFromGalleryException) {
    return SELECT_FROM_GALLERY_FAILURE_MESSAGE;
  } else if (exception is DatabaseExeption) {
    return DATABASE_FAILURE;
  } else {
    return SERVER_FAILURE_MESSAGE;
  }
}

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.lightGreenAccent;
  }
  return Colors.green;
}
