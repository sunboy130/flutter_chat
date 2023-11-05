import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

bool isChecked = false; // 初始未选中状态
bool _obscureText = true; // 初始状态为密码隐藏

initState() {
  isChecked = false;
  _obscureText = true;
}

class _RegisterPageState extends State<RegisterPage> {

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText; // 切换密码可见性状态
    });
  }

  void handleCheckboxValueChanged(bool? value) {
    setState(() {
      isChecked = value!; // 更新状态
      print("isChecked = $isChecked");
    });
  }

  
   @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // 包装成可滚动页面
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavWidget(context),
                SizedBox(height: 20),
                headerWidget(),
                SizedBox(height: 60),
                EmailWidget(),
                SizedBox(height: 50),
                PasswordWidget(_obscureText, _togglePasswordVisibility),
                SizedBox(height: 40),
                checkBoxWidget(context, isChecked, handleCheckboxValueChanged),
                SizedBox(height: 42),
                SignInBtnWidget(),
                SizedBox(height: 20),
                forgetPwdWidget(),
                SizedBox(height: 60),
                continueWidget(),
                SizedBox(height: 27),
                otherLoginWidget(),
                SizedBox(height: 40),
              ],
            ),
        ),
      ),
    );
  }
}

Widget NavWidget(BuildContext context){
  return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: Image.asset("assets/images/Back.png", width: 15, height: 15),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
  
    );
}


Widget headerWidget() {
  return Padding(padding: 
    const EdgeInsets.only(left: 32,right: 32),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Welcome back",
                style: TextStyle(
                  color: Colors.black, // 颜色为9E9E9E
                  fontSize: 20, // 字体大小为14px
                  fontFamily: "Inter", // 字体为Inter
                  fontWeight: FontWeight.w600, // 字体权重为400
                ),
              ),
              Image(
                image: Image.asset("assets/images/emoji.png").image,
                width: 22,
                height: 22,
              )
            ]
          ),
          SizedBox(height: 29),
          Text(
            "Please enter you email & password to sign in",
            style: TextStyle(
              color: Color(0xFF9E9E9E), // 颜色为9E9E9E
              fontSize: 14, // 字体大小为14px
              fontFamily: "Inter", // 字体为Inter
              fontWeight: FontWeight.w400, // 字体权重为400
            ),
          ),
        ]
      ),
    ),
  );

}

Widget EmailWidget(){

  return Padding(padding: 
    const EdgeInsets.only(left: 32,right: 32),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Email",
        style: TextStyle(
          color: Colors.black, // 颜色为9E9E9E
          fontSize: 14, // 字体大小为14px
          fontFamily: "Inter", // 字体为Inter
          fontWeight: FontWeight.w600, // 字体权重为400
        ),
      ),
      TextFormField(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF17C3CE), width: 1.0),
          ),
            suffixIcon: IconButton(
            icon: Image.asset("assets/images/Message_light.png"),
            iconSize: 26, // 设置后缀图标的大小
            onPressed: () {
              // 处理后缀图标的点击事件
            },
          ), // Replace with your desired icon
        ),
      ),
    ],
  ),
  );

}

Widget PasswordWidget(bool obscure, togglePasswordVisibility){
  return Padding(
    padding: const EdgeInsets.only(left: 32,right: 32),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: TextStyle(
            color: Colors.black, // 颜色为9E9E9E
            fontSize: 14, // 字体大小为14px
            fontFamily: "Inter", // 字体为Inter
            fontWeight: FontWeight.w600, // 字体权重为400
          ),
        ),
        TextFormField(
          obscureText: _obscureText, // 根据状态控制密码是否隐藏
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF17C3CE), width: 1.0),
            ),
            suffixIcon: IconButton(
              icon: _obscureText
                  ? Image.asset("assets/images/Eye_light.png")
                  : Image.asset("assets/images/eye_off.png"), // 根据状态切换图标
              iconSize: 26,
              onPressed: togglePasswordVisibility, // 点击后切换密码可见性
            ),
          ),
        ),
      ],
    ),
  );
}

Widget checkBoxWidget(BuildContext context, bool isChecked, ValueChanged<bool?>? onChanged) {
  return Padding(
    padding: const EdgeInsets.only(left: 20,right: 32),
    child: Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged, // 调用父小部件中的回调函数
          activeColor: Color(0xFF17C3CE),
          checkColor: Colors.white,
          side: MaterialStateBorderSide.resolveWith((Set<MaterialState> states) {
              return const BorderSide(width: 2, color: Color(0x0FF17C3CE));
            },
          ),
        ),
        Text("Remember Me"),
      ],
    ),
  );
}

Widget SignInBtnWidget(){
  return Padding(
    padding: const EdgeInsets.only(left: 32,right: 32),
    child: Container(
      child: SizedBox(
        width: double.infinity, // 按钮宽度占满父容器
        height: 60, // 按钮高度
        child: ElevatedButton(
          onPressed: () {
            // 处理按钮点击事件
            EasyLoading.instance
              ..displayDuration = const Duration(milliseconds: 2000)  // 加载时间
              ..indicatorType = EasyLoadingIndicatorType.circle  // 加载类型
              ..loadingStyle = EasyLoadingStyle.custom  // 加载样式
              ..indicatorSize = 45.0   // 大小
              ..indicatorColor = Color(0xFF17C3CE)
              ..progressColor = Color(0xFF17C3CE)
              ..backgroundColor = Colors.white
              ..textColor = Color(0xFF17C3CE)
              ..maskType = EasyLoadingMaskType.black // 遮罩
              ..userInteractions = true  // 使用单例模式
              ..dismissOnTap = false;  // 指示器结束的点击时间
            // 显示指示器
            EasyLoading.show();
            //  延时2秒
            Future.delayed(const Duration(seconds: 2), () {
              //  关闭指示器
              EasyLoading.dismiss();
            });
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.lightBlue, // 按钮的背景颜色
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17), // 圆角半径
            ),
          ),
          child: Text(
            "Sign In",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    )
  );
}

Widget forgetPwdWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Forget password?",
            style: TextStyle(
              color: Color(0xFF17C3CE), // 颜色为9E9E9E
              fontSize: 14, // 字体大小为14px
              fontFamily: "Inter", // 字体为Inter
              fontWeight: FontWeight.w500, // 字体权重为400
            ),
          ),
        ],
      ),
      SizedBox(height: 23),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't have an account? "),
          GestureDetector(
            onTap: () {
              // 处理 Sign up 文本点击事件
              print("Sign Up Clicked");
            },
            child: Text(
              "Sign up",
              style: TextStyle(
                color: Color(0xFF17C3CE),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget continueWidget(){
  return Row(
      children: [
        Expanded(
          child: Container(
            height: 0.5,
            color: Color.fromARGB(255, 155, 154, 154),
            margin: EdgeInsets.only(right: 32),
          ),
        ),
        Text(
          "or continue with",
          style: TextStyle(
            color: Color.fromARGB(255, 167, 233, 236), // 颜色为9E9E9E
            fontSize: 14, // 字体大小为14px
            fontFamily: "Inter", // 字体为Inter
            fontWeight: FontWeight.w500, // 字体权重为400
          ),
        ),
        Expanded(
          child: Container(
            height: 0.5,
            color: Color.fromARGB(255, 133, 132, 132),
            margin: EdgeInsets.only(left: 32),
          ),
        ),
      ],
    );
}

// Widget otherLoginWidget() {
//   return Row(
//     children: [
//       SizedBox(width: 25), // 左边距离屏幕
//       Flexible(
//         flex: 1,
//         child: Container(
//           height: 55,
//           child: OutlinedButton(
//             onPressed: () {
//               // 处理按钮点击事件
//               print("Button Clicked");
//             },
//             style: OutlinedButton.styleFrom(
//               side: BorderSide(
//                 color: Colors.black, // 边框颜色
//                 width: 0.5, // 边框宽度
//               ),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8), // 圆角半径
//               ),
//             ),
//             child: Image.asset("assets/images/Google.png", width: 30, height: 30),
//           ),
//         ),
//       ),
//       SizedBox(width: 22), // 按钮之间的间距是22
//       Flexible(
//         flex: 1,
//         child: Container(
//           height: 55,
//           child: OutlinedButton(
//             onPressed: () {
//               // 处理按钮点击事件
//               print("Button Clicked");
//             },
//             style: OutlinedButton.styleFrom(
//               side: BorderSide(
//                 color: Colors.black, // 边框颜色
//                 width: 0.5, // 边框宽度
//               ),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8), // 圆角半径
//               ),
//             ),
//             child: Image.asset("assets/images/Facebook.png", width: 30, height: 30),
//           ),
//         ),
//       ),
//       SizedBox(width: 22), // 按钮之间的间距是22
//       Flexible(
//         flex: 1,
//         child: Container(
//           height: 55,
//           child: OutlinedButton(
//             onPressed: () {
//               // 处理按钮点击事件
//               print("Button Clicked");
//             },
//             style: OutlinedButton.styleFrom(
//               side: BorderSide(
//                 color: Colors.black, // 边框颜色
//                 width: 0.5, // 边框宽度
//               ),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8), // 圆角半径
//               ),
//             ),
//             child: Image.asset("assets/images/Apple.png", width: 30, height: 30),
//           ),
//         ),
//       ),
//       SizedBox(width: 25), // 右边距离屏幕
//     ],
//   );
// }

Widget otherLoginWidget() {
  return Row(
    children: [
      SizedBox(width: 25), // 左边距离屏幕
      Expanded(
        child: Container(
          height: 55,
          child: OutlinedButton(
            onPressed: () {
              // 处理按钮点击事件
              print("Button Clicked");
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: Colors.black, // 边框颜色
                width: 0.5, // 边框宽度
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // 圆角半径
              ),
            ),
            child: Image.asset("assets/images/Google.png", width: 30, height: 30),
          ),
        ),
      ),
      SizedBox(width: 22), // 按钮之间的间距是22
      Expanded(
        child: Container(
          height: 55,
          child: OutlinedButton(
            onPressed: () {
              // 处理按钮点击事件
              print("Button Clicked");
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: Colors.black, // 边框颜色
                width: 0.5, // 边框宽度
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // 圆角半径
              ),
            ),
            child: Image.asset("assets/images/Facebook.png", width: 30, height: 30),
          ),
        ),
      ),
      SizedBox(width: 22), // 按钮之间的间距是22
      Expanded(
        child: Container(
          height: 55,
          child: OutlinedButton(
            onPressed: () {
              // 处理按钮点击事件
              print("Button Clicked");
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: Colors.black, // 边框颜色
                width: 0.5, // 边框宽度
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // 圆角半径
              ),
            ),
            child: Image.asset("assets/images/Apple.png", width: 30, height: 30),
          ),
        ),
      ),
      SizedBox(width: 25), // 右边距离屏幕
    ],
  );
}






