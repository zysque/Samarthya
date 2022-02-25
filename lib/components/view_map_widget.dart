import '../flutter_flow/flutter_flow_static_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/lat_lng.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_search/mapbox_search.dart';

class ViewMapWidget extends StatefulWidget {
  const ViewMapWidget({
    Key key,
    this.location,
  }) : super(key: key);

  final LatLng location;

  @override
  _ViewMapWidgetState createState() => _ViewMapWidgetState();
}

class _ViewMapWidgetState extends State<ViewMapWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 550,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).darkBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                    child: InkWell(
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: FaIcon(
                        FontAwesomeIcons.solidWindowClose,
                        color: Color(0xFF810933),
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            FlutterFlowStaticMap(
              location: widget.location,
              apiKey:
                  'pk.eyJ1IjoienlzcXVlIiwiYSI6ImNsMDBsZ2xvMDAzdmIzY28zZTAwcHprNm4ifQ._sbRbkehl1FmnrSlTuN4eg',
              style: MapBoxStyle.Satellite_Street_V11,
              width: MediaQuery.of(context).size.width,
              height: 500,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(0),
              markerColor: Color(0xFF810933),
              cached: true,
              zoom: 16,
              tilt: 0,
              rotation: 0,
            ),
          ],
        ),
      ),
    );
  }
}
