import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'models/ems_agency_model.dart';

part 'team_api.g.dart';

@singleton
@RestApi()
abstract class TeamApi {
  @factoryMethod
  factory TeamApi(Dio dio) = _TeamApi;

  @GET("/v4/emsAgencies/{emsAgencyId}?fields=dynamicForms&includeCannedMessages=true")
  Future<EmsAgencyModel> getAgency(@Path("emsAgencyId") String emsAgencyId);
}
