import 'package:flutter/material.dart';
import 'package:kmouin/screens/AcademicCalendar.dart';
import 'package:kmouin/screens/BusPage.dart';
import 'package:kmouin/screens/CommuterBusPage.dart';
import 'package:kmouin/screens/DormMenu.dart';
import 'package:kmouin/screens/FacilityPage.dart';
import 'package:kmouin/screens/FifthFloor.dart';
import 'package:kmouin/screens/MenuPage.dart';
import 'package:kmouin/screens/SecondFloor.dart';
import 'package:kmouin/screens/ThirdFloor.dart';

final cat1 = BusPage();
final cat2 = MenuPage();
final cat3 = FacilityPage();
final cat4 = CalPage();

final sub1 = CoummuterBusPage();
final sub2 = SecondFloor();
final sub3 = ThirdFloor();
final sub4 = FifthFloor();
final sub5 = DormMenu();

final List category = [cat1, cat2, cat3, cat4];

final List keywords = ['통근버스', '통근', '2층', '3층', '5층', '교직원', '기숙사', '생활관', '편의시설','대피시설',];
final List subpage = [sub1, sub1, sub2, sub3, sub4, sub4, sub5, sub5, sub1, sub1,];