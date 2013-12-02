unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Menus, TAGraph, TASeries;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Chart1: TChart;
    Chart1Line1: TLine;
    Chart1LineSeries1: TLineSeries;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{ TForm1 }

function f(x:real):real;
begin
result:=x*x*x+9*sqr(x)+5*x-6;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  x, y, xn, xk, xkr, a, b, c, e:real;
  code:integer;
  x1:string;
begin
val(Edit1.Text,xn,code);
if code=0 then
begin
val(Edit2.Text,xk,code);
if code=0 then
begin
val(Edit3.Text,xkr,code);
if code=0 then
begin
if xn<xk then
begin
memo1.lines.clear;
Chart1lineseries1.Clear;
if CheckBox1.Checked then
begin
a:=xn;
b:=xk;
c:=a-(b-a)*f(a)/(f(b)-f(a));
if (f(a)*f(b))>0 then  memo1.Lines.Add('Корней нет') else
begin
e:= strtofloat(InputBox('Введите е','Введите е','1'));
while abs(f(c))>e do
begin
if (f(a)*f(c))>0 then  a:=c else b:=c;
c:=a-(b-a)*f(a)/(f(b)-f(a));
end;
memo1.Lines.Add('Корень '+Floattostrf(c,fffixed,6,2));
end;
end;
x:=xn;
Chart1.visible:=true;
memo1.Lines.Add('');
memo1.Lines.Add('    X      F(X)');
while (x<=xk) do
begin
if x>0 then
begin
y:=f(x);
x1:=Floattostrf(x,fffixed,6,2)+'     '+Floattostrf(y,fffixed,10,4);
memo1.Lines.Add(x1);
Chart1lineseries1.AddXY(x,y);
end;
x:=x+xkr;
end;
end else showmessage('X больше Y!');
end else showmessage('Неверный ввод шага');
end else showmessage('Неверный ввод Y');
end else showmessage('Неверный ввод X');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.lines.clear;
  Chart1.visible:=false;
  edit1.Text:='';
  edit2.Text:='';
  edit3.Text:='';
  Chart1lineseries1.Clear;
end;

initialization
  {$I unit1.lrs}

end.

