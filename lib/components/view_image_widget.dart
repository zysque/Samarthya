import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ViewImageWidget extends StatefulWidget {
  const ViewImageWidget({
    Key key,
    this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  _ViewImageWidgetState createState() => _ViewImageWidgetState();
}

class _ViewImageWidgetState extends State<ViewImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.darkBackground,
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
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: FlutterFlowExpandedImageView(
                        image: Image.network(
                          '',
                          fit: BoxFit.contain,
                        ),
                        allowRotation: false,
                        tag: 'imageTag',
                        useHeroAnimation: true,
                      ),
                    ),
                  );
                },
                child: Hero(
                  tag: 'imageTag',
                  transitionOnUserGestures: true,
                  child: Image.network(
                    '',
                    width: MediaQuery.of(context).size.width,
                    height: 210,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
