unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, OleCtrls, SHDocVw;

type
  TForm1 = class(TForm)
    RichEdit1: TRichEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    Edit3: TEdit;
    Label1: TLabel;
    Button3: TButton;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
begin
 if OpenDialog1.Execute
 then RichEdit1.Lines.LoadFromFile(OpenDialog1.FileName);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
 s: string;
 i,j,zam: integer;
begin
 Label1.Caption:='Произведено замен: 0';
 zam:=0;
 s:=Edit1.Text;
 RichEdit1.Lines.BeginUpdate;
 for i:=0 to RichEdit1.Lines.Count -1 do
  begin
   Edit3.Text:=RichEdit1.Lines.Strings[i];
   if pos(s,Edit3.Text)<>0
   then
    begin
     for j:=0 to Length(Edit3.Text) do
      begin
       if pos (s,Edit3.Text)<>0
       then
        begin
         Edit3.HideSelection:=false;
         Edit3.SelStart:=pos(s,RichEdit1.Lines.Strings[i])-1;
         Edit3.SelLength:=length(s);
         Edit3.SelText:=Edit2.Text;
         RichEdit1.Lines.Strings[i]:=Edit3.Text;
         inc(zam);
        end;
      end;
    end;
  end;
 RichEdit1.Lines.EndUpdate;
 Label1.Caption:='Произведено замен: '+IntToStr(zam);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
 s,ss: string;
 i,j,zam,k,z: integer;
begin
 Label1.Caption:='Произведено замен: 0';
 zam:=0;
 s:=Edit1.Text;
 RichEdit1.Lines.BeginUpdate;
 for i:=0 to RichEdit1.Lines.Count-1 do
  begin
   j:=0;
   z:=0;   
   Edit3.Text:=RichEdit1.Lines.Strings[i];
   ss:=Edit3.Text;
   if pos(s,ss)<>0
   then
    begin
     while j<=Length(ss) do
      begin
       k:=pos(s,ss);
       if k<>0
       then
        begin
         Edit3.HideSelection:=false;
         Edit3.SelStart:=z+k-1;
         Edit3.SelLength:=length(s);
         Edit3.SelText:=Edit2.Text;
         inc(zam);
         inc(j);
         ss:=Edit3.Text;
         Delete(ss,1,z+k+length(Edit2.Text)-1);
         z:=z+k+length(Edit2.Text)-1;
        end
       else
        begin
         RichEdit1.Lines.Strings[i]:=Edit3.Text;
         Break;
        end;
      end;
     RichEdit1.Lines.Strings[i]:=Edit3.Text;
    end;
  end;
 RichEdit1.Lines.EndUpdate;
 Label1.Caption:='Произведено замен: '+IntToStr(zam);
end;

end.
