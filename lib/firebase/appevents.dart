
enum AppEvents {
  LOGIN,
  OTP_SEND,
  OTP_VERIFIED,
  SIGN_IN,
  SIGN_UP,
  TEST,
  ERROR
}

///
final String eventName = 'eventName';

///
final String hasCampaign = 'hasCampaign';

///
extension AppEventsExtension on AppEvents {
  ///
  Map<String, dynamic> get eventDetails {
    switch (this) {
      case AppEvents.LOGIN:
        return <String, dynamic>{
          eventName: 'log_in',
          hasCampaign: false.toString(),
        };

              case AppEvents.OTP_SEND:
        return <String, dynamic>{
          eventName: 'otp_send',
          hasCampaign: false.toString(),
        };

                      case AppEvents.OTP_VERIFIED:
        return <String, dynamic>{
          eventName: 'otp_verified',
          hasCampaign: false.toString(),
        };
                      case AppEvents.SIGN_IN:
        return <String, dynamic>{
          eventName: 'sign_in',
          hasCampaign: false.toString(),
        };
                              case AppEvents.SIGN_UP:
        return <String, dynamic>{
          eventName: 'sign_up',
          hasCampaign: false.toString(),
        };
                              case AppEvents.TEST:
        return <String, dynamic>{
          eventName: 'test',
          hasCampaign: false.toString(),
        };



                              case AppEvents.TEST:
        return <String, dynamic>{
          eventName: 'error',
          hasCampaign: false.toString(),
        };



      default:
        return <String, dynamic>{
          eventName: 'default',
          hasCampaign: false.toString(),
        };
    }
  }
}
