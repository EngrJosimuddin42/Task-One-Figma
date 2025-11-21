import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

//  Color and Constant Definitions

const Color primaryDarkBlue = Color(0xFF0A2342);
const Color primaryTeal = Color(0xFF00B8A9);
const Color whiteCardColor = Colors.white;
const Color tabUnselectedColor = Color(0xFFF7F7F7);
const Color selectedTabColor = primaryTeal;


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign In Screen',
      theme: ThemeData(
        primaryColor: primaryTeal,
        useMaterial3: true,
        fontFamily: 'Inter',
      ),
      home: const SignInScreen(),
    );
  }
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  int _userType = 0; // 0 = Customer, 1 = Coach

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  static const double topCardHeight = 212.0;
  static const double overlapHeight = 90.0;
  static const double maxCardWidth = 370.0;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  void _signIn() {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text;
    final String userType = _userType == 0 ? 'Customer' : 'Coach';


    // --- Basic Validation ---
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter both email and password.'),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
  }
  Widget _buildSocialButton({
    IconData? logoIcon,
    String? logoUrl,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
        color: whiteCardColor,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black87,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (logoIcon != null)
              Icon(logoIcon, size: 24, color: Colors.black),
            if (logoUrl != null)
              Image.network(
                logoUrl,
                height: 24,
                width: 24,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.public, color: Colors.black),
              ),
            const SizedBox(width: 10),
            Text(label,style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  Widget _buildConsentAndPrivacy() {
    final VoidCallback linkAction = () {};

    const TextStyle linkStyleUnderlined = TextStyle(
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
      color: primaryTeal,
      decorationColor: primaryTeal,
      decorationThickness: 2.5,
    );
    const TextStyle linkStyleNormal = TextStyle(
      fontWeight: FontWeight.bold,
      color: primaryTeal,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text.rich(
        TextSpan(
          text: 'By continuing, you accept our ',
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
          children: <TextSpan>[
            TextSpan(text: 'Privac',style: linkStyleUnderlined,recognizer: TapGestureRecognizer()..onTap = linkAction),
            TextSpan(text: 'y', style: linkStyleNormal,recognizer: TapGestureRecognizer()..onTap = linkAction),
            TextSpan(text: 'Polic',style: linkStyleUnderlined,recognizer: TapGestureRecognizer()..onTap = linkAction),
            TextSpan(text: 'y,', style: linkStyleNormal, recognizer: TapGestureRecognizer()..onTap = linkAction),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: whiteCardColor,
      body: Container(
        color: Colors.transparent,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              //  উপরের গ্র্যাডিয়েন্ট কার্ড
              children: <Widget>[
                Container(
                  height: topCardHeight,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        primaryDarkBlue,
                        primaryTeal,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(24.0, 30.0, 24.0, 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Welcome Back',style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('Sign in to continue your wellness journey',style: TextStyle(color: Colors.white70, fontSize: 16)),
                      ],
                    ),
                  ),
                ),

                //  প্রধান সাদা কার্ড কন্টেইনার
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: maxCardWidth),
                    child: Transform.translate(
                      offset: Offset(0.0, -overlapHeight),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 40.0),
                        decoration: const BoxDecoration(color: whiteCardColor,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 20,
                              offset: Offset(0, -10),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Text('I am a', style: TextStyle(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w600)),
                            const SizedBox(height: 24),

                            // ইউজার টাইপ সিলেক্টর
                            Row(
                              children: [
                                UserTypeTab(
                                  icon: Icons.person,
                                  label: 'Customer',
                                  subtitle: 'Track my wellness',
                                  isSelected: _userType == 0,
                                  onTap: () => setState(() => _userType = 0),
                                ),
                                const SizedBox(width: 15),
                                UserTypeTab(
                                  icon: Icons.person,
                                  label: 'Coach',
                                  subtitle: 'Manage clients',
                                  isSelected: _userType == 1,
                                  onTap: () => setState(() => _userType = 1),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),

                            // ফর্ম ফিল্ড: ইমেল
                            const Text('Email', style: TextStyle(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w600)),
                            const SizedBox(height: 8),
                            CustomTextField(
                              hintText: 'your.email@example.com',
                              icon: Icons.email_outlined,
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 24),

                            // ফর্ম ফিল্ড: পাসওয়ার্ড
                            const Text('Password', style: TextStyle(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w600)),
                            const SizedBox(height: 8),
                            CustomTextField(
                              hintText: '**********',
                              icon: Icons.lock_outline,
                              isPassword: true,
                              controller: _passwordController,
                              keyboardType: TextInputType.text,
                            ),
                            const SizedBox(height: 40),

                            // Sign In button
                            Container(
                              width: double.infinity,
                              height: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                  colors: [
                                    primaryTeal,
                                    primaryDarkBlue,
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: primaryTeal.withOpacity(0.5),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: TextButton(
                                onPressed: _signIn,
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 20)),
                                child: const Text('Sign in', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              ),
                            ),
                            const SizedBox(height: 30),

                            // ডিভাইডার
                            Row(
                              children: [
                                const Expanded(child: Divider(color: Colors.grey)),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text('or continue with',style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                                ),
                                const Expanded(child: Divider(color: Colors.grey)),
                              ],
                            ),
                            const SizedBox(height: 30),

                            // Google Sign In বোতাম
                            _buildSocialButton(
                              logoUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/2048px-Google_%22G%22_logo.svg.png',
                              label: 'Google',
                              onPressed: () =>()),
                            const SizedBox(height: 15),

                            // Apple Sign In বোতাম
                            _buildSocialButton(
                              logoIcon: Icons.apple,
                              label: 'Apple',
                              onPressed: () =>()),
                            const SizedBox(height: 30),
                            _buildConsentAndPrivacy(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // ফুটার স্পেসার
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text.rich(
                      TextSpan(text: "Don't have an account? ",style: TextStyle(color: Colors.grey[600]),
                        children: <TextSpan>[
                          TextSpan(text: 'Sign up', style: TextStyle(fontWeight: FontWeight.bold,color: primaryTeal)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// CustomTextField Widget

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: tabUnselectedColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300, width: 1)),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade400),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon, color: primaryTeal)),
          border: InputBorder.none,
          contentPadding:
          const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        ),
      ),
    );
  }
}


// UserTypeTab Widget

class UserTypeTab extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const UserTypeTab({
    super.key,
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  Widget _buildIcon() {
    final bool isCoach = label == 'Coach';
    final Color iconFgColor = isSelected
        ? Colors.white
        : (isCoach ? Colors.grey.shade600.withOpacity(0.8) : primaryTeal);
    Widget baseIcon = Icon(Icons.person_outlined, size: 25, color: iconFgColor);
    Widget iconContent = isCoach
        ? Stack(
      alignment: Alignment.center,
      children: [
        baseIcon,
        Positioned(right: 4, top: 4,
          child: Icon(Icons.settings, size: 12,color: iconFgColor),
        ),
      ],
    )
        : baseIcon;

    //  বৃত্তাকার কন্টেইনার
    return Container(
      width: 40,
      height: 60,
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: isSelected ? null : Colors.grey.shade300.withOpacity(0.7),
        gradient: isSelected
            ? const LinearGradient(
          colors: [primaryTeal, primaryDarkBlue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
            : null,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: iconContent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
            color: isSelected ? selectedTabColor.withOpacity(0.08) : tabUnselectedColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: isSelected ? selectedTabColor : Colors.grey.shade300,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Column(
            children: [
              _buildIcon(),
              const SizedBox(height: 5),
              Text(label, style: TextStyle(color: isSelected ? selectedTabColor : Colors.black87,fontWeight: FontWeight.bold,fontSize: 16)),
              Text(subtitle,textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[600],fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}