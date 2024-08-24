import 'dart:io';
import 'student.dart';
import 'subjects.dart';

void main() {
int choose =0;
int internalChoose =0;
bool ifContinue = true;
List <Student> ListOfStudents = [];
List <Subjects> sub = [];
while(ifContinue==true){
print("1]To add new student");
print("2]To add marks");
print("3]To Search about student");
print("4]To show student information");
print("5]To show all students");
print("please enter the number of your choice :");
choose = int.parse(stdin.readLineSync()!);
switch(choose){
case 1 : {
  print("1]with auto ID ");
  print("2]with maual ID ");
  print("enter number of choise");
  internalChoose = int.parse(stdin.readLineSync()!);
  switch(internalChoose){
    case 1 : addStudent2(ListOfStudents);
    break;
    case 2 : addStudent(ListOfStudents);
    break;
  }
}

break;
case 2 : addSubjects(sub, ListOfStudents);
break;
case 3 : SearchStudent(ListOfStudents);
break;
case 4 : showStudentInfo(ListOfStudents);
break;
case 5 : showAllStudent(ListOfStudents);
break;


}
print("Do you whant continue ?yes / no");
String complate = stdin.readLineSync()!;
if(complate=="no")
ifContinue = false;
} 
}
 addStudent2(List <Student> list){
  Student s= Student();
 s.id=DateTime.now().millisecondsSinceEpoch;
 print("Name : ");
 s.name=stdin.readLineSync()!;
 print("Phone : ");
 s.phone=stdin.readLineSync()!;
 print("Major : ");
 s.major=stdin.readLineSync()!;
 list.add(s);
 }
 //DateTime.now().millisecondsSinceEpoch;
 addStudent(List <Student> list){
 Student s= Student();
 print("ID : ");
 s.id=int.parse(stdin.readLineSync()!);
 print("Name : ");
 s.name=stdin.readLineSync()!;
 print("Phone : ");
 s.phone=stdin.readLineSync()!;
 print("Major : ");
 s.major=stdin.readLineSync()!;
 list.add(s);
 }
showAllStudent(List <Student> list){
  list.forEach((element) {
    print("-------------------------------------------------------------------------------------------");
    print("ID : ${element.id} Name : ${element.name} Phone : ${element.phone} Major ${element.major}");
    print("-------------------------------------------------------------------------------------------");
  });
}
SearchStudent(List <Student> list)
{ print("Enter student name :");
  String nameStd = stdin.readLineSync()!;
  
  //if(list.contains(nameStd)) 
    showAllStudent(list.where((element) => element.name==nameStd).toList());
 /* else 
  print("this student does not found");*/

}
addSubjects(List<Subjects> subjectList ,List <Student> list)
{ int numSub = 0;
  print("enter Student ID :");
  int stdID = int.parse(stdin.readLineSync()!);
  if(checkID(stdID, list))
  {
    int indexList = foundIndex( list, stdID);
    print("How many subjects you whant to add");
    numSub=int.parse(stdin.readLineSync()!);
    for(int i = 0;i<numSub;i++)
    { Subjects s =Subjects();
      print("enter name of sebject : ");
      s.nameSub = stdin.readLineSync()!;
      print("enter mark of sebject : ");
      s.mark =double.parse( stdin.readLineSync()!);
      list[indexList].subjects.add(s);////////////////////// 
     
    }
  }
  else 
  print("this student not found");
  
}
bool checkID(int id,List <Student> list)
{ bool isFound = true;
  list.forEach((element) {
    
    if (element.id == id)
     isFound =true;
    else 
     isFound= false;
  });
  return isFound;
}
int foundIndex(List <Student> list,int stdID)
{ int num = 0;
  for(int i=0 ; i<list.length ;i++)
  {
    if(list[i].id == stdID)
    num= i;
  }
  return num;
}
showStudentInfo(List <Student> list){
print("enter Student ID :");
  int stdID = int.parse(stdin.readLineSync()!);
  if(checkID(stdID, list))
  {
    int indexList = foundIndex( list, stdID);
    print("ID : ${list[indexList].id} Name : ${list[indexList].name} Phone : ${list[indexList].phone} Major ${list[indexList].major}");
    list[indexList].subjects.forEach((element) {
      print("name subject : ${element.nameSub} mark : ${element.mark}");
    });
  }
}