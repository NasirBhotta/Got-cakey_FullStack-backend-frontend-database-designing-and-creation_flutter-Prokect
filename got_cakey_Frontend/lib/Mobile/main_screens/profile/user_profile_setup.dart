import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:got_cakey_mobile/utills/constants/mobile_constants.dart';
import 'package:got_cakey_mobile/provider/authProvider.dart';
import 'package:got_cakey_mobile/provider/userInfo.dart';
import 'package:provider/provider.dart';

class UserProfileSetup extends StatefulWidget {
  const UserProfileSetup({super.key});

  @override
  State<UserProfileSetup> createState() => _UserProfileSetupState();
}

class _UserProfileSetupState extends State<UserProfileSetup> {
  bool clicked = false;
  // ignore: non_constant_identifier_names
  void show_bottom_modal() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.clear)),
                const Expanded(child: SizedBox.shrink()),
                Text(
                  "Edit profile picture",
                  style: TextStyle(
                      fontFamily: 'PP-Mori-Regular',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: GCConstants.primaryColor),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3.4,
                )
              ],
            ),
            const Divider(),
            _createElevatedButton(
                "Choose from libarary",
                GCConstants.secondaryColor,
                MediaQuery.of(context).size,
                GCConstants.whiteColor),
            _createElevatedButton("Take photo", GCConstants.quatenaryColor,
                MediaQuery.of(context).size, GCConstants.primaryColor),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.014,
            ),
            Center(
              child: GestureDetector(
                child: Text(
                  "Close",
                  style: TextStyle(
                      fontFamily: 'PP-Mori-Regular',
                      fontSize: GCConstants(size: MediaQuery.of(context).size)
                          .fontsize(),
                      fontWeight: FontWeight.w600,
                      color: GCConstants.primaryColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserinfoProvider>(context).userInfo;
    var authUser = Provider.of<AuthProvider>(context).user;
    return SafeArea(
      child: Scaffold(
        backgroundColor: GCConstants.whiteColor,
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  IconButton(
                      style: IconButton.styleFrom(
                        side: BorderSide(
                            width: 0.6, color: GCConstants.borderColor),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.clear)),
                  const Expanded(child: SizedBox.shrink()),
                  Text(
                    "Your details",
                    style: TextStyle(
                        color: GCConstants.primaryColor,
                        fontFamily: 'PP-Mori-Regular',
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.9,
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Stack(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: GCConstants.borderColor,
                                borderRadius: BorderRadius.circular(60)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.asset(
                                  "assets/profile.jpg",
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: GCConstants.primaryColor),
                              child: GestureDetector(
                                onTap: () {
                                  show_bottom_modal();
                                },
                                child: Icon(
                                  Icons.mode_edit_outlined,
                                  color: GCConstants.whiteColor,
                                  size: 18,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 0.5, color: GCConstants.borderColor))),
                      child: _buildUserDetailTile(
                          title: 'Full name',
                          value: user.username,
                          isEditable: false,
                          context: context),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 0.5, color: GCConstants.borderColor))),
                      child: _buildUserDetailTile(
                          title: 'Alias/Handle',
                          value: user.username.split(' ').length > 1
                              ? user.username.split(' ')[1]
                              : user.username.split(' ')[0],
                          isEditable: true,
                          context: context),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 0.5, color: GCConstants.borderColor))),
                      child: _buildUserDetailTile(
                          title: 'Email',
                          value: authUser.email == ''
                              ? 'Error showing Email'
                              : authUser.email,
                          isEditable: true,
                          isVerified: true,
                          context: context),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 0.5, color: GCConstants.borderColor))),
                      child: _buildUserDetailTile(
                          title: 'Mobile number',
                          value: user.contact_no == null
                              ? 'Not Provided'
                              : user.contact_no!,
                          isEditable: true,
                          isVerified: true,
                          context: context),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 0.5, color: GCConstants.borderColor))),
                      child: _buildUserDetailTile(
                          title: 'Address',
                          value: user.pickup_address,
                          isEditable: true,
                          context: context),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 0.5, color: GCConstants.borderColor))),
                      child: _buildUserDetailTile(
                          title: 'Birthday',
                          value: 'August 17, 2000',
                          isEditable: false,
                          context: context),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 0.5, color: GCConstants.borderColor))),
                      child: _buildUserDetailTile(
                          title: 'Business name',
                          value: user.buisness_name,
                          isEditable: true,
                          isAddable: true,
                          context: context),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 0.5, color: GCConstants.borderColor))),
                      child: _buildUserDetailTile(
                          title: 'ABN (Australian Business Number)',
                          value: 'Not provided',
                          isEditable: true,
                          isAddable: true,
                          context: context),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                        top: BorderSide(
                            width: 0.5, color: GCConstants.borderColor),
                      )),
                      child: _buildUserDetailTile(
                          title: 'GST registration status',
                          value: user.registration_status,
                          isEditable: true,
                          context: context),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          const Icon(Icons.lock_outline_rounded),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              'You need to contact Got Cakey to update these fields as they relate to your identity.',
                              style: TextStyle(
                                  color: GCConstants.secondaryTextColor,
                                  fontFamily: 'PP-Mori-Regular',
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Delete account',
                      style: TextStyle(
                          color: GCConstants.errorColor,
                          fontFamily: 'PP-Mori-Regular',
                          decoration: TextDecoration.underline,
                          decorationColor: GCConstants.errorColor,
                          fontWeight: FontWeight.w600,
                          fontSize:
                              GCConstants(size: MediaQuery.of(context).size)
                                  .fontsize()),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: 0.78,
                      minHeight: 7,
                      borderRadius: BorderRadius.circular(10),
                      backgroundColor: GCConstants.borderColor,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "   78%",
                        style: TextStyle(
                            color: GCConstants.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: "\nComplete",
                        style: TextStyle(
                            color: GCConstants.primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400))
                  ]))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserDetailTile({
    required String title,
    required String value,
    required BuildContext context,
    bool isEditable = false,
    bool isVerified = false,
    bool isAddable = false,
  }) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'PP-Mori-Regular',
            fontSize: GCConstants(size: MediaQuery.of(context).size).fontsize(),
            color: GCConstants.primaryColor,
            fontWeight: FontWeight.w600),
      ),
      subtitle: Text(value,
          style: TextStyle(
              fontFamily: 'PP-Mori-Regular',
              fontSize:
                  GCConstants(size: MediaQuery.of(context).size).fontsize(),
              color: GCConstants.secondaryTextColor,
              fontWeight: FontWeight.w400)),
      trailing: isEditable
          ? GestureDetector(
              onTap: () {},
              child: Text(
                isAddable ? 'Add' : 'Edit',
                style: TextStyle(
                  color: isAddable
                      ? GCConstants.secondaryColor
                      : GCConstants.primaryColor,
                  fontFamily: 'PP-Mori-Regular',
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            )
          : Icon(
              Icons.lock_outline_rounded,
              color: GCConstants.secondaryTextColor,
            ),
    );
  }

  Widget _createElevatedButton(
    String value,
    Color color,
    Size size,
    Color textColor,
  ) {
    return ElevatedButton(
      onPressed: () async {},
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: EdgeInsetsDirectional.only(
              top: GCConstants(size: size).gcButtonPaddingTop(),
              bottom: GCConstants(size: size).gcButtonPaddingBottom())),
      child: clicked == false
          ? Text(
              value,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: GCConstants(size: size).fontsize(),
              ),
            )
          : SizedBox(
              height: size.height <= 450
                  ? 21.dg
                  : size.height <= 645
                      ? 17.dg
                      : 21,
              width: size.height <= 450
                  ? 21.dg
                  : size.height <= 645
                      ? 17.dg
                      : 21,
              child: const CircularProgressIndicator.adaptive(
                valueColor:
                    AlwaysStoppedAnimation<Color>(Color.fromRGBO(57, 9, 92, 1)),
                strokeWidth: 1,
              ),
            ),
    );
  }
}
