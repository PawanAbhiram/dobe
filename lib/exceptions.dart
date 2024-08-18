import 'dart:io';

import 'package:dobe/constants/error_constants.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

class Exceptions{
  int? errorCode;
String? message;


Exceptions({this.errorCode,this.message});
}

class ParseException {
  Exceptions parseException(Object exception){
    if(exception is SocketException){
      return Exceptions(errorCode: ErrorCodes.INTERNT_ERROR,message: ErrorMessages.INTERNT_ERROR);
    }
    else if(exception is FormatException){
            return Exceptions(errorCode: ErrorCodes.FORMAT_EXCEPTION,message: ErrorMessages.FORMAT_EXCEPTION);

    }else if(exception is RangeError){
                  return Exceptions(errorCode: ErrorCodes.RANGE_ERROR,message: ErrorMessages.RANGE_ERROR);

    }else if(exception is PlatformException){
                        return Exceptions(errorCode: ErrorCodes.PLATFORM_EXCEPTION,message: ErrorMessages.PLATFORM_EXCEPTION);

    }else if(exception is StateError){
                              return Exceptions(errorCode: ErrorCodes.STATE_ERROR,message: ErrorMessages.STATE_ERROR);

    }
    else if(exception is TypeError){
                              return Exceptions(errorCode: ErrorCodes.TYPE_ERROR,message: ErrorMessages.TYPE_ERROR);

    }
    return Exceptions(errorCode: ErrorCodes.UNKNOWN_ERROR,message: ErrorMessages.UNKNOWN_ERROR);

}}