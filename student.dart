import 'subjects.dart';

class Student{
int? id;
String? name;
String? major;
String? phone; 
List <Subjects> subjects = [];
  
addSubjetToStudent(List<Student> listOfStudents ,int index, Subjects subject)
{
  listOfStudents[index].subjects.add(subject);
}

 addStuden(int idStd,String nameStd,String maj,String phoneStd)
 {
  id=idStd;
  name=nameStd;
  major=maj;
  phone=phoneStd;

 }
 
}