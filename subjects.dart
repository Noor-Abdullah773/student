class Subjects{
late  String nameSub;
late double _mark;
set mark(double value){
if(value >=0 && value <= 100 )
_mark = value;
else
print("invalid mark");
}
double get mark{
return _mark;
}

}
