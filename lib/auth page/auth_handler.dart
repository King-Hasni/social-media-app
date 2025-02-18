import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class auth_handler{
  auth_handler._();
  static auth_handler instance = auth_handler._();
  GoogleSignIn google = GoogleSignIn();
  //FirebaseAuth fauth = FirebaseAuth.instance;
  Future<UserCredential?> google_sign() async{
    try{
      final GoogleSignInAccount? request = await google.signIn();

      if(request == null){
        print("cancelled");
        return null;
      }
      final GoogleSignInAuthentication auth = await request.authentication;

      final OAuthCredential  cred = GoogleAuthProvider.credential(idToken: auth.idToken, accessToken: auth.accessToken);

      final yehy =  await FirebaseAuth.instance.signInWithCredential(cred).then((value) async{
        await FirebaseFirestore.instance.collection("users").add(
          {"user" : request.email,
          "name": request.displayName,
          "posts" : 0,
          "followers" : 0,
          "following" : 0,
          "description": "wow g",
          "profile": "",
          "uid" : FirebaseAuth.instance.currentUser!.uid,
          }
        );
        print('wow');
      },);
      
        
        return yehy;

    }
    on FirebaseAuthException catch(e){
      print(e.message);
    }
    return null;
  }
  Future<void> signout()async{
    try{
      await google.signOut();
      await FirebaseAuth.instance.signOut();
    }
    catch(e){

    }
  }
}