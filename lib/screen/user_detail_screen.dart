import 'package:flutter/material.dart';
import 'package:github_api_app/badge/badge_convert.dart';
import 'package:github_api_app/network/network_request.dart';


class UserDetailScreen extends StatelessWidget {
  final String? url;
  const UserDetailScreen({Key? key, required this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is user detail",
          style: TextStyle(color: Colors.amber),),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: NetworkRequest.fetchUserDetail(url!),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if(snapshot.hasData){
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                            child: Container(width: 190, height: 190, clipBehavior: Clip.antiAlias, decoration: const BoxDecoration(shape: BoxShape.circle,),
                              child: Image.network(
                                '${snapshot.data.avatarUrl}',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                            child: Text(
                              '${snapshot.data.name}',
                              style: const TextStyle(fontFamily: 'Poppins', fontSize: 16,),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                            child: Text(
                              '${snapshot.data.bio}',
                              style: const TextStyle(fontFamily: 'Poppins', fontSize: 16,),
                            ),
                          ),
                          const Divider(height: 3, thickness: 2, indent: 20, endIndent: 20,),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 0, 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                                  child: Icon(Icons.person, color: Colors.black, size: 35,),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4.0),
                                      child: Text(
                                        '${snapshot.data.login}',
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Container(width: 60, height: 20, decoration: BoxDecoration(color: Color(0xFF617AF8), borderRadius: BorderRadius.circular(20),),
                                      child: Center(
                                        child: Text(
                                          '${Badge.badgeSiteAdmin(snapshot.data.siteAdmin)}',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontFamily: 'Poppins', color: Colors.white, fontSize: 12,),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 0, 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                                  child: Icon(Icons.location_on, color: Colors.black, size: 35,),
                                ),
                                Text(
                                  '${snapshot.data.location}',
                                  style:
                                  const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 0, 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                                  child: Icon(Icons.link_rounded, color: Colors.black, size: 35,),
                                ),
                                Text(
                                  '${snapshot.data.blog}',
                                  style:
                                  const TextStyle(fontFamily: 'Poppins', color: Color(0xFF617AF8), fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                    else if(snapshot.hasError) {
                      return Center(
                        child: Text("Has Error ${url} "),
                      );
                    }
                    else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }))
        ],
      ),
    );
  }
}

