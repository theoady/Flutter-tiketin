//untuk mengakses seluruh file folder services
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tiketin/models/models.dart';
import 'package:tiketin/extensions/extensions.dart';
import 'package:http/http.dart' as http;
import 'package:tiketin/shared/shared.dart';

part 'auth_services.dart';
part 'user_services.dart';
part 'movie_services.dart';
part 'ticket_services.dart';
part 'history_transaction_services.dart';
