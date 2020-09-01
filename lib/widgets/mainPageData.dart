import 'package:flutter/material.dart';
import 'package:kmouin/screens/AcademicCalendar.dart';
import 'package:kmouin/screens/BusPage.dart';
import 'package:kmouin/screens/CommuterBusPage.dart';
import 'package:kmouin/screens/DeveloperPage.dart';
import 'package:kmouin/screens/DormMenu.dart';
import 'package:kmouin/screens/EvacuationFacility.dart';
import 'package:kmouin/screens/FacilityPage.dart';
import 'package:kmouin/screens/FifthFloor.dart';
import 'package:kmouin/screens/MenuPage.dart';
import 'package:kmouin/screens/SecondFloor.dart';
import 'package:kmouin/screens/ThirdFloor.dart';

final cat1 = BusPage();
final cat2 = MenuPage();
final cat3 = FacilityPage();
final cat4 = CalPage();

final commute = CoummuterBusPage();
final floor2 = SecondFloor();
final floor3 = ThirdFloor();
final floor5 = FifthFloor();
final dorm = DormMenu();
final campusMap = EvacuationFacility();
final developer = DeveloperPage();

final List category = [cat1, cat2, cat3, cat4];

final List keywords = [
  '통근버스',
  '통근',
  '2층',
  '2',
  '3층',
  '3',
  '5층',
  '5',
  '교직원',
  '기숙사',
  '생활관',
  '지도',
  '대피시설',
  '대피',
  '개발',
  '개발자',
  '개발자 정보',
];
final List subpage = [
  commute,
  commute,
  floor2,
  floor2,
  floor3,
  floor3,
  floor5,
  floor5,
  floor5,
  dorm,
  dorm,
  campusMap,
  campusMap,
  campusMap,
  developer,
  developer,
  developer,
];
